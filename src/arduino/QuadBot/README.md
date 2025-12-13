# QuadBot

Simple PWM servo test for quadruped robot.

## Description

Basic PWM output test for servo motor control, used for testing quadruped robot leg servos.

## Hardware Requirements

- Arduino Uno or compatible
- Servo motors

## Pin Configuration

| Function | Pin |
|----------|-----|
| Servo 1  | 3   |
| LED      | 13  |

## Behavior

Cycles PWM output through 0, 127, and 255 values with 1 second delays. LED mirrors servo PWM for visual feedback.
