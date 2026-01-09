// pick one of these defines
// and set it in the project configuration 
// properties
//#define USE_EMULATED_ACCELEROMETER
//#define USE_BUTTONS
#define USE_HARDWARE

using System;
using Microsoft.SPOT;
using DeviceSolutions.SPOT;
using DeviceSolutions.SPOT.Hardware;
using Microsoft.SPOT.Hardware;
using FusionWare.SPOT.Hardware;

namespace BallInMazeV2 {
    internal interface IPanTiltProvider {
        Point Acceleration { get; }
        void Calibrate();
    }

#if USE_BUTTONS
    internal class ButtonPanTiltProvider : IPanTiltProvider
    {
        readonly InputPort[] buttons;

        readonly Point[] acceleration = new Point[] {
            new Point(0, -1), // up
            new Point(0, 1),  // down
            new Point(-1, 0), // left
            new Point(1, 0)   // right
        };

        public ButtonPanTiltProvider()
        {
            this.buttons = new InputPort[4];
            
            this.buttons[0] = new InputPort(Tahoe.Pins.SW5, false, Port.ResistorMode.PullUp); // up
            this.buttons[1] = new InputPort(Tahoe.Pins.SW9, false, Port.ResistorMode.PullUp); // down
            this.buttons[2] = new InputPort(Tahoe.Pins.SW6, false, Port.ResistorMode.PullUp); // Left
            this.buttons[3] = new InputPort(Tahoe.Pins.SW8, false, Port.ResistorMode.PullUp); // right
        }

        Point IPanTiltProvider.Acceleration
        {
            get
            {
                Point accel = new Point(0,0);
            
                if(!buttons[0].Read())
                    accel += acceleration[0];

                if(!buttons[1].Read())
                    accel += acceleration[1];

                if(!buttons[2].Read())
                    accel += acceleration[2];

                if(!buttons[3].Read())
                    accel += acceleration[3];

                return accel;
            }
        }

        void IPanTiltProvider.Calibrate()
        {
        }
    }

    internal static class PanTiltData
    {
        public static IPanTiltProvider GetProvider()
        {
            return new ButtonPanTiltProvider();
        }
    }
    
#endif

#if USE_EMULATED_ACCELEROMETER
    /// <summary>
    /// Adapter class for the emulated Accelerometer driver
    /// </summary>
    internal class EmulatorPanTiltProvider : IPanTiltProvider
    {
        EmulatorAccelerometer Device;

        public EmulatorPanTiltProvider(EmulatorAccelerometer Device)
        {
            this.Device = Device;
        }

        Point IPanTiltProvider.Acceleration
        {
            get { return this.Device.Acceleration; }
        }

        void IPanTiltProvider.Calibrate()
        {
        }
    }

    internal static class PanTiltData
    {
        public static IPanTiltProvider GetProvider()
        {
            I2CBus bus = new I2CBus();
            EmulatorAccelerometer acc = new EmulatorAccelerometer(bus, 124);
            return new EmulatorPanTiltProvider(acc);
        }
    }
#endif

#if USE_HARDWARE
    /// <summary>
    /// Adapter class for the real hardware Accelerometer driver
    /// </summary>
    internal class MMA7455QTPanTiltProvider : IPanTiltProvider {
        MMA7455 Acc;

        int[] SensorCenterValue;

        public MMA7455QTPanTiltProvider(MMA7455 Acc) {
            // Holds the calibration data
            SensorCenterValue = new int[4];

            // Default Center values
            SensorCenterValue[(int)Channel.ChannelY] = -30;
            SensorCenterValue[(int)Channel.ChannelX] = -30;

            // Start sampling
            Acc.SetMode(MMA7455.Mma7455Mode.modeMeasurement, MMA7455.Mma7455gSelect.g2);

            this.Acc = Acc;
        }

        Point IPanTiltProvider.Acceleration {
            get {
                return new Point(GetAccelleration(Channel.ChannelY, false),
                                    GetAccelleration(Channel.ChannelX, true));
            }
        }

        void IPanTiltProvider.Calibrate() {
            // Save the center values
            SensorCenterValue[(int)Channel.ChannelY] = this.Acc.YData();
            SensorCenterValue[(int)Channel.ChannelX] = this.Acc.XData();
#if DEBUG
            Microsoft.SPOT.Debug.Print("CALIBRATE #" +
                Channel.ChannelY + " " + SensorCenterValue[(int)Channel.ChannelY] + " #" +
                Channel.ChannelX + " " + SensorCenterValue[(int)Channel.ChannelX]);
#endif
        }

        enum Channel {
            ChannelY = 2,
            ChannelX = 3
        }

        private int GetAccelleration(Channel Channel, bool InvertResult) {
            int valData = Channel == Channel.ChannelX ? this.Acc.XData() : this.Acc.YData();
            int valCenter = SensorCenterValue[(int)Channel];
            int result = 0;

            result = (int)((valCenter - valData) * .2);  // was 0.3 but need to go a bit slower as it can sometime go through walls!

            if (InvertResult)
                result = result * -1;

            return result;
        }
    }

    internal static class PanTiltData {
        public static IPanTiltProvider GetProvider() {
            // NOTE: at present Dispose will never be called for these...
            I2CBus bus = new I2CBus();
            MMA7455 acc = new MMA7455(bus, 0x1d);
            return new MMA7455QTPanTiltProvider(acc);
        }
    }
#endif
}
