# I2CTest

ADC (Analog-to-Digital Converter) test with potentiometer.

## Description

Reads analog value from ADC channel 0 and displays scaled value on LEDs (PB0-PB2).

## Hardware

- Target: ATmega328P
- Clock: 8 MHz
- Input: ADC0 (potentiometer)
- Output: PB0, PB1, PB2 (LEDs)

## ADC Configuration

- Reference: AVCC (REFS0)
- Prescaler: 128 (ADPS2:0)
- Resolution: 10-bit

## Build

```bash
make all
make program
```
