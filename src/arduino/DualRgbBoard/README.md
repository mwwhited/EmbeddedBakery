# DualRgbBoard

Test board with 2 RGB LEDs, switches, buttons, and potentiometers.

## Description

Demonstration firmware for a custom board featuring dual RGB LEDs controlled by 6 potentiometers, with button and switch input reading.

## Hardware

| Device   | Pin       |
|----------|-----------|
| Button 0 | Digital 2 |
| Button 1 | Digital 4 |
| Button 2 | Digital 7 |
| Switch 0 | Digital 8 |
| Switch 1 | Digital 12|
| Switch 2 | Digital 13|
| LED 0 R  | Digital 9 |
| LED 0 G  | Digital 10|
| LED 0 B  | Digital 11|
| LED 1 R  | Digital 6 |
| LED 1 G  | Digital 5 |
| LED 1 B  | Digital 3 |
| POT 0-5  | A0-A5     |

## Behavior

- Potentiometers 0-2 control RGB values of LED 0
- Potentiometers 3-5 control RGB values of LED 1
- Button and switch states are output to serial (9600 baud)
