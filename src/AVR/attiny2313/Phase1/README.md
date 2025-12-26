# Phase 1 AI - Obstacle Avoidance Robot

Direct port from Basic Stamp 2 to ATtiny2313.

Original by Matthew Whited - v0.1 - 12/29/2001

## Overview

This is a minimal, direct translation of the original PBASIC code to C. It preserves the original structure and logic as closely as possible.

For a modern, refactored version with modular code and PlatformIO support, see **Phase2**.

## Hardware

| Component    | Description                             |
|--------------|-----------------------------------------|
| MCU          | ATtiny2313 @ 1MHz (internal RC)         |
| IR Sensor    | Lynxmotion IRPD (IR Proximity Detector) |
| Motor Driver | Dual Mini H-Bridge                      |
| Status LED   | Indicates backup mode                   |

## Pin Mapping

```
BS2 Pin   Function              ATtiny2313    Physical Pin
-------   --------              ----------    ------------
Pin 0     IRPD Left LED         PD2           6
Pin 1     IRPD Right LED        PD3           7
Pin 2     IRPD Signal (input)   PD4           8
Pin 3     H-Bridge B1 (L Motor) PD5           9
Pin 4     H-Bridge B2 (L Motor) PD6           11
Pin 5     H-Bridge A1 (R Motor) PB0           12
Pin 6     H-Bridge A2 (R Motor) PB1           13
Pin 7     Status LED            PB2           14
```

## Build

Requires AVR-GCC toolchain (WinAVR or avr-gcc).

```bash
make all      # Compile
make program  # Flash via usbtiny
make clean    # Clean build files
```

Edit `Makefile` to change programmer:
- `AVRDUDE_PROGRAMMER = usbtiny`
- `AVRDUDE_PROGRAMMER = usbasp`
- `AVRDUDE_PROGRAMMER = stk500v1`

## Algorithm

Matches original PBASIC logic exactly:

1. Startup delay (1 second)
2. Main loop:
   - Wait 750ms
   - Pulse right IR LED, read detector
   - Pulse left IR LED, read detector
   - Calculate action:
     - `action = 0` if both clear → forward
     - `action = 1` if left blocked → turn right
     - `action = 2` if right blocked → turn left
     - `action = 3` if both blocked → backup (LED on)

## See Also

- **Phase2/** - Modern refactored version with PlatformIO, modular code, and timing diagrams
- **IRPD_NOTES.md** - Lynxmotion IRPD sensor documentation (in Phase2/)
