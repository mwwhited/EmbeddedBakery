# ATtiny85 Line Follower Controller

Replaces the LM393 dual comparator on a D2-1 line follower robot board with an ATtiny85 microcontroller, enabling proportional steering control and adjustable speed via potentiometer.

## Features

- Proportional steering (smoother line following than bang-bang comparator)
- Adjustable speed via onboard potentiometer
- Hysteresis to prevent oscillation at line edges
- Stop detection for intersections/end of line
- Search mode when line is lost

## Hardware Requirements

| Component          | Specification                    |
|--------------------|----------------------------------|
| MCU                | ATtiny85 in 8-pincan 1 adc and 1 pwn be aligned  DIP package    |
| Clock              | 8MHz internal oscillator         |
| Inputs             | 2x analog IR sensors, 1x pot     |
| Outputs            | 2x PWM motor control signals     |
| Programmer         | USBasp or Arduino as ISP         |

## Pinout Diagrams

### ATtiny85 (DIP-8)

```
                  ATtiny85
                +----U----+
   RESET    1  -|         |- 8   VCC
   PB3/ADC3 2  -|         |- 7   PB2/ADC1/SCK
   PB4/ADC2 3  -|         |- 6   PB1/OC0B/MISO
   GND      4  -|         |- 5   PB0/OC0A/MOSI
                +---------+
```

### LM393 Socket (DIP-8) - Simplified Wiring

```
                   LM393
                +----U----+
   OUT1     1  -|         |- 8   VCC        <- Right Header
   IN1-     2  -|  R_IR   |- 7   OUT2       <- Right Header (R Motor)
   IN1+     3  -|  L_IR   |- 6   IN2- (NC)
   GND      4  -|         |- 5   IN2+ (NC)
                +---------+
                Left Header
```

**Simplified Wiring Benefit:** Both IR sensors connect via pins 2 and 3 on the left header (pins 1-4), reducing traces to the right header.

### 6-Pin ISP Header

```
          +-------------+
     MOSI | 1         2 | VCC
          +-------------+
      N/C | 3         4 | GND
          +-------------+
    RESET | 5         6 | SCK
          +-------------+
```

## Pin Assignment Table (Simplified Wiring)

| Signal              | ATtiny85 Pin | ATtiny85 Func | ISP Pin | ISP Func | LM393 Socket Pin | LM393 Func |
|---------------------|--------------|---------------|---------|----------|------------------|------------|
| RESET               | 1            | RESET         | 5       | RESET    | --               | --         |
| Speed Control (ADC) | 2            | PB3/ADC3      | --      | --       | --               | --         |
| Right IR (ADC)      | 3            | PB4/ADC2      | --      | --       | 2                | IN1-       |
| GND                 | 4            | GND           | 4       | GND      | 4                | GND        |
| Left Motor (PWM)    | 5            | PB0/OC0A      | 1       | MOSI     | 1                | OUT1       |
| Right Motor (PWM)   | 6            | PB1/OC0B      | --      | --       | 7                | OUT2       |
| Left IR (ADC)       | 7            | PB2/ADC1      | 6       | SCK      | 3                | IN1+       |
| VCC                 | 8            | VCC           | 2       | VCC      | 8                | VCC        |
| NC (ISP)            | --           | --            | 3       | N/C      | --               | --         |
| NC (LM393)          | --           | --            | --      | --       | 5                | IN2+       |
| NC (LM393)          | --           | --            | --      | --       | 6                | IN2-       |

## Perf Board Layout (Simplified)

```
                    Perf Board Top View
    +---------------------------------------------+
    |                                             |
    |    ISP Header (2x3)        Speed Pot (10K)  |
    |    +---+---+                 +---+          |
    |    | 1 | 2 |  MOSI / VCC   +| W |+         |
    |    +---+---+                |+---+|         |
    |    | 3 | 4 |  N/C  / GND   |     |         |
    |    +---+---+               GND   VCC        |
    |    | 5 | 6 |  RST  / SCK                    |
    |    +---+---+                                |
    |       |   |                   |             |
    |       |   +-------------------|-----+       |
    |       |                       |     |       |
    |    ATtiny85 (DIP-8 Socket)    |     |       |
    |    +--------U--------+        |     |       |
    |    | 1-RST       VCC-8 |------|-----|--+    |
    |    |                   |      |     |  |    |
    |    | 2-PB3       PB2-7 |------+     |  |    |
    |    |   |               |            |  |    |
    |    |   +-(Speed Pot Wiper)          |  |    |
    |    |                   |            |  |    |
    |    | 3-PB4       PB1-6 |------------│--│-+  |
    |    |   |               |            |  | |  |
    |    | 4-GND       PB0-5 |--+         |  | |  |
    |    +---│---------------+  |         |  | |  |
    |        |                  |         |  | |  |
    |        +------------------│---------│--│-│--+-- GND bus
    |                           |         |  | |  |
    |    1x4 Header (Left)   1x4 Header (Right)   |
    |    +---+               +---+                |
    |    | 1 | OUT1/L Motor  | 5 | (NC)           |
    |    +---+               +---+                |
    |    | 2 | IN1-/R IR <---│ 6 | (NC)           |
    |    +---+               +---+                |
    |    | 3 | IN1+/L IR     | 7 | OUT2/R Motor   |
    |    +---+               +---+                |
    |    | 4 | GND           | 8 | VCC            |
    |    +---+               +---+                |
    |      v                   v                  |
    |   (plugs into LM393 socket pins 1-4, 5-8)   |
    +---------------------------------------------+
```

## Perf Board Components

| Qty | Component                | Purpose                                |
|-----|--------------------------|----------------------------------------|
| 1   | 8-pin DIP socket         | ATtiny85 holder                        |
| 1   | 2x3 pin header           | ISP programming                        |
| 2   | 1x4 pin headers          | Plug into LM393 socket (pins 1-4, 5-8) |
| 1   | 10K potentiometer        | Speed control                          |

## Speed Potentiometer Wiring

| Pot Pin        | Connection                  |
|----------------|------------------------------|
| Leg 1 (outer)  | GND                          |
| Leg 2 (wiper)  | ATtiny85 Pin 2 (PB3/ADC3)    |
| Leg 3 (outer)  | VCC                          |

## ISP Header Wiring

| ISP Pin | Signal | ATtiny85 Pin | Notes                    |
|---------|--------|--------------|--------------------------|
| 1       | MOSI   | Pin 5 (PB0)  | Shared with Left Motor   |
| 2       | VCC    | Pin 8        |                          |
| 3       | N/C    | --           | Not connected            |
| 4       | GND    | Pin 4        |                          |
| 5       | RESET  | Pin 1        |                          |
| 6       | SCK    | Pin 7 (PB2)  | Shared with Left IR      |

**Note:** Disconnect motors during programming to avoid interference.

## Programming Instructions

### Using PlatformIO (Recommended)

1. Install PlatformIO Core or VS Code extension
2. Connect USBasp programmer to ISP header
3. Build and upload:

```bash
# Build only
pio run

# Upload firmware
pio run --target upload

# Set fuses for 8MHz internal oscillator (first time only)
pio run --target fuses
```

### Using Arduino IDE

1. Install ATtiny board support:
   - File -> Preferences -> Additional Board URLs:
   - Add: `http://drazzy.com/package_drazzy.com_index.json`
   - Tools -> Board -> Boards Manager -> Install "ATTinyCore"

2. Configure board settings:
   - Board: ATtiny25/45/85 (No bootloader)
   - Chip: ATtiny85
   - Clock: 8 MHz (internal)
   - Programmer: USBasp

3. Burn bootloader (sets fuses):
   - Tools -> Burn Bootloader

4. Upload sketch:
   - Sketch -> Upload Using Programmer

### Using avrdude Directly

```bash
# Set fuses for 8MHz internal oscillator
avrdude -c usbasp -p t85 -U lfuse:w:0xE2:m -U hfuse:w:0xDF:m -U efuse:w:0xFF:m

# Upload firmware
avrdude -c usbasp -p t85 -U flash:w:firmware.hex:i
```

## Tunable Parameters

Edit these constants in `src/main.cpp` to adjust behavior:

| Parameter      | Default | Range   | Description                                   |
|----------------|---------|---------|-----------------------------------------------|
| `THRESHOLD`    | 512     | 0-1023  | ADC value for black/white line detection      |
| `HYSTERESIS`   | 30      | 0-100   | Prevents oscillation at line edges            |
| `MIN_SPEED`    | 60      | 0-255   | Minimum PWM when pot at lowest                |
| `MAX_SPEED`    | 255     | 0-255   | Maximum PWM when pot at highest               |
| `PROP_GAIN`    | 2       | 1-10    | Proportional steering gain (higher = sharper) |
| `LOOP_DELAY`   | 10      | 5-50    | Main loop delay in ms                         |
| `SEARCH_SPEED` | 80      | 0-255   | Speed when line is lost (both white)          |

### Tuning Guide

1. **Start with THRESHOLD:** Place sensors over black line, note ADC value. Place over white, note value. Set THRESHOLD midway between.

2. **Adjust HYSTERESIS:** If robot oscillates at line edges, increase. If response is sluggish, decrease.

3. **Set PROP_GAIN:** Start at 2. Increase for sharper turns on tight curves. Decrease if robot oversteers and wobbles.

4. **Tune speeds:** Start with MIN_SPEED=60, MAX_SPEED=180. Increase MAX_SPEED as robot behavior improves.

## Behavior Logic

| Left Sensor | Right Sensor | Action                              |
|-------------|--------------|-------------------------------------|
| BLACK       | BLACK        | STOP (intersection/end of line)     |
| WHITE       | WHITE        | Go straight slow (line lost)        |
| BLACK       | WHITE        | Turn left (slow right, speed left)  |
| WHITE       | BLACK        | Turn right (slow left, speed right) |
| Mixed       | Mixed        | Proportional steering               |

## Troubleshooting

### Robot doesn't move
- Check power supply voltage (should be 4-6V)
- Verify motor connections to LM393 socket pins 1 and 7
- Check that speed pot is connected and not at minimum
- Ensure motors work by testing with direct voltage

### Robot moves but doesn't follow line
- Verify IR sensor connections (pins 2 and 3 of LM393 socket)
- Adjust THRESHOLD value for your surface/line colors
- Check sensor height above surface (typically 5-15mm)
- Ensure LEDs in IR sensors are illuminating

### Robot oscillates/wobbles
- Increase HYSTERESIS value
- Decrease PROP_GAIN
- Increase LOOP_DELAY
- Check for loose mechanical connections

### Programming fails
- Disconnect motors during programming (ISP shares pins)
- Verify USBasp connections to ISP header
- Check that USBasp has correct drivers installed
- Try slower programming speed: `-B8` or `-B16` flag

### Motors run in wrong direction
- Swap motor wire connections
- Or swap LEFT_MOTOR_PIN and RIGHT_MOTOR_PIN in code

### Inconsistent sensor readings
- Add decoupling capacitor (0.1uF) near VCC pin
- Shield IR sensors from ambient light
- Clean sensor lenses
- Check for loose connections

## D2-1 Line Follower Reference

The D2-1 is a common DIY line follower kit that uses:
- LM393 dual voltage comparator as the controller
- Two LDR or IR reflective sensors
- S8550 PNP transistors for high-side motor switching
- TT gear motors with 40mm wheels

This ATtiny85 replacement provides improved performance through:
- Proportional control instead of bang-bang switching
- Adjustable speed control
- Programmable behavior for different track conditions

### Documentation

See `docs/D2-1_Reference.md` for detailed technical information about the original D2-1 kit including:
- Complete circuit architecture and theory of operation
- Component list with values
- Original LM393 comparator logic explanation
- Calibration procedures
- Common issues and solutions

### External Resources

- [D2-1 Instructions PDF (Elecrow)](https://www.elecrow.com/download/D2-1%20Intelligent%20Tracking%20Car%20Instructions.pdf)
- [D2-5 User Manual PDF (ICStation)](https://www.icstation.com/product_document/Download/10168_User_Manual.pdf)
- [LEAP#416 Line Follower Kit Analysis](https://leap.tardate.com/kinetics/linefollowerkit/)
- [D2-1 Assembly Guide (Instructables)](https://www.instructables.com/D2-1-Linefollowing-Robot-Assembly-Guide-Ultra-Chea/)

## File Structure

```
LineFollower/
+-- platformio.ini        # PlatformIO configuration
+-- src/
|   +-- main.cpp          # Firmware source code
+-- docs/
|   +-- D2-1_Reference.md # D2-1 kit technical reference
+-- README.md             # This documentation
+-- notes.pdf             # Original design notes
```

## License

This project is part of the Embedded Bakery collection.
