# 8Dac

8-channel DAC output test for Arduino Mega.

## Description

Outputs incrementing 8-bit values simultaneously on four ports (PORTA, PORTC, PORTL, PORTK) to drive multiple DAC channels. Uses direct port manipulation for maximum speed.

## Hardware Requirements

- Arduino Mega 2560 (requires ports A, C, L, K)
- External DAC circuits connected to port pins

## Pin Mapping

| Port  | Mega Pins |
|-------|-----------|
| PORTA | 22-29     |
| PORTC | 37-30     |
| PORTL | 49-42     |
| PORTK | A8-A15    |
