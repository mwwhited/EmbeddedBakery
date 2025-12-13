# BlinkTest

Basic LED blink test for ATmega328P.

## Description

Alternates LEDs on PB0 and PB1 at 500ms intervals. Simple test to verify toolchain and hardware setup.

## Hardware

- Target: ATmega328P
- Clock: 8 MHz
- Output: PB0, PB1 (LEDs)

## Build

```bash
make all
make program
```
