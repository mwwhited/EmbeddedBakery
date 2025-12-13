# SimpleServoControl

Basic servo motor control via serial commands.

## Description

Controls a servo motor position via serial input. Send angle values to position the servo.

## Hardware Requirements

- Arduino Uno or compatible
- Standard servo motor

## Pin Configuration

| Function | Pin |
|----------|-----|
| Servo    | 9   |

## Serial Protocol

- Baud rate: 9600
- Send angle value (0-180) to set position
- Send "1" to reset to 0 degrees

## Dependencies

- Servo library
