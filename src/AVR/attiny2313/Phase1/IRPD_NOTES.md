# Lynxmotion IRPD - Reference Notes

## Overview

The IRPD (Infrared Proximity Detector) is an obstacle detection sensor from Lynxmotion. It uses modulated IR LEDs and a detector to sense obstacles in left/right quadrants.

## How It Works

The IRPD has two IR LEDs (left and right) and a single IR detector. The microcontroller pulses each LED individually and reads the detector to determine if an obstacle reflected the IR light back.

### Detection Sequence

1. Pulse the IR LED (HIGH-LOW-HIGH pattern)
2. Read the detector signal
3. If signal is LOW (0), obstacle detected (IR reflected back)
4. If signal is HIGH (1), path is clear (no reflection)

## Versions

| Version  | Era        | Notes                          |
|----------|------------|--------------------------------|
| Original | ~1997-1999 | First version, details scarce  |
| Ver 3.0  | ~2000s     | Well documented, IRPD-01 SKU   |
| Ver 5.0  | Later      | Assembly manual IRPD-01 VER 5.0|

## Pinout Comparison

### Original IRPD (from AI.bs2 code, circa 2001)

Based on the Basic Stamp 2 code in this project:

| Wire/Pin | Function        | Direction |
|----------|-----------------|-----------|
| 1        | Left IR LED     | Output    |
| 2        | Right IR LED    | Output    |
| 3        | Detector Signal | Input     |
| 4        | VCC (+5V)       | Power     |
| 5        | GND             | Power     |

Timing used: 5ms pulses (PAUSE 5 in PBASIC)

### IRPD Ver 3.0

From Parallax forum documentation:

| Wire/Pin | Function        | Direction |
|----------|-----------------|-----------|
| 1        | Left IR LED     | Output    |
| 2        | Right IR LED    | Output    |
| 3        | Detector Signal | Input     |
| -        | VCC (+5V)       | Power     |
| -        | GND             | Power     |

Timing used: 1ms pulses (PAUSE 1 in PBASIC)

## Pulse Sequence Detail

From IRPD Ver 3.0 documentation (likely same for original):

```
; Test Right Side
HIGH right_led_pin
PAUSE 1          ; or PAUSE 5 for original
LOW right_led_pin
PAUSE 1
HIGH right_led_pin
PAUSE 1
result = IN signal_pin   ; 0=obstacle, 1=clear
LOW right_led_pin

; Test Left Side
HIGH left_led_pin
PAUSE 1
LOW left_led_pin
PAUSE 1
HIGH left_led_pin
PAUSE 1
result = IN signal_pin
LOW left_led_pin
```

## Physical Connector

The IRPD typically has:
- 2x 3-pin headers on the board
- Cable with red/black wires (power)
- Cable with purple/blue/gray wires (signal)

**Note:** Your 1997 version may have a different connector arrangement. Verify with a multimeter:
1. Identify VCC/GND by checking for continuity to obvious power traces
2. Identify LED pins by checking which pins light up LEDs when driven HIGH
3. Identify signal pin by reading it while covering/uncovering the detector

## Sensitivity Adjustment

The IRPD has an adjustable potentiometer to set detection range (adjustable down to ~4 inches).

## Sources

- [Lynxmotion Wiki - Sensors](https://wiki.lynxmotion.com/info/wiki/lynxmotion/view/servo-erector-set-system/ses-electronics/ses-sensors/)
- [Parallax Forums - IRPD Code Example](https://forums.parallax.com/discussion/comment/1104160)
- [Lynxmotion History](https://www.lynxmotion.com/history-of-lynxmotion/)
- Original AI.bs2 code from this repository

## Timing Considerations

The original code uses 5ms pulses. The ATtiny2313 port maintains this timing for compatibility. If detection is unreliable, you can try:
- Increasing pulse time (10ms)
- Decreasing pulse time (1-2ms)
- Adjusting the potentiometer on the IRPD board
