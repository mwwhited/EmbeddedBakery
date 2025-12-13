# BlinkRGB

RGB LED color cycling demonstration.

## Description

Cycles through all possible RGB color combinations by incrementing each color channel. Creates a smooth color transition effect.

## Hardware Requirements

- Arduino Uno or compatible
- Common-anode RGB LED (or adjust code for common-cathode)
- Current limiting resistors

## Pin Configuration

| Color | Pin |
|-------|-----|
| Red   | 9   |
| Green | 10  |
| Blue  | 11  |

## Parameters

- Step size: 5 (adjustable for speed vs. smoothness)
- Delay: 1ms between color changes
- Uses inverted output (255 - value) for common-anode LED
