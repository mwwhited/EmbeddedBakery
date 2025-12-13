# HSV and RGB LED Controller

RGB LED control with HSV to RGB color conversion.

## Description

Allows control of an RGB LED using either direct RGB values or HSV (Hue, Saturation, Value) color space. Three potentiometers set the color values, and a switch toggles between RGB and HSV modes.

## Features

- HSV to RGB color conversion
- Mode switch between direct RGB and HSV input
- Real-time potentiometer control
- Serial debug output

## Hardware Requirements

- Arduino Uno or compatible
- Common-anode RGB LED
- 3 potentiometers
- Mode selection switch

## Pin Configuration

| Function     | Pin |
|--------------|-----|
| Red LED      | 9   |
| Green LED    | 10  |
| Blue LED     | 11  |
| RGB/HSV Switch | 7  |
| H/R Pot      | A0  |
| S/G Pot      | A1  |
| V/B Pot      | A2  |

## HSV Color Model

- Hue: 0-360 degrees (mapped from pot range)
- Saturation: 0-100%
- Value: 0-100%

## Serial Debug

- Baud rate: 9600
- Outputs analog readings and calculated RGB values
