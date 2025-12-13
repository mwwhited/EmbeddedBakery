# Six Axis Gyro

MPU-6000 6-axis accelerometer/gyroscope demo via SPI.

## Description

Reads acceleration and gyroscope data from an MPU-6000 sensor using SPI communication. Outputs calibrated sensor values to serial monitor.

## Hardware Requirements

- Arduino Uno or compatible
- MPU-6000 6-axis IMU (SPI version)
- Robogaia 6-axis shield or similar

## Pin Configuration

| Function | Pin |
|----------|-----|
| CS       | 10  |
| MOSI     | 11  |
| MISO     | 12  |
| SCK      | 13  |

## Sensor Configuration

- Sample rate: 50 Hz
- Gyro scale: 2000 deg/s
- Accel scale: 4g
- Low-pass filter: 20 Hz

## Serial Output

- Baud rate: 9600
- Format: `AccelerationX= <value> AccelerationY= <value> AccelerationZ= <value> GyroX= <value> GyroY= <value> GyroZ= <value>`

## Calibration

Adjust gain and offset variables for calibrated output:
```cpp
int xAccelerationGain = 1;
int xAccelerationOffset = 0;
// ... similar for Y, Z and gyros
```

## Dependencies

- SPI library

## References

- [Robogaia 6-axis Shield](https://www.robogaia.com/6-axis-accelerometer-gyro-arduino-shield.html)
- [ArduIMU Project](http://code.google.com/p/ardu-imu/)
