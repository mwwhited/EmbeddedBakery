# AVR Projects

Bare-metal AVR microcontroller projects using WinAVR/avr-gcc toolchain.

## Projects

### BlinkTest
Basic LED blink test for ATmega328P. Alternates PB0 and PB1 at 500ms intervals.

### I2CTest
ADC (Analog-to-Digital Converter) test with potentiometer input. Reads ADC channel 0 and displays value on LEDs (PB0-PB2).

### InputTest
Digital input reading test. Reads PINB and mirrors input to output.

### attiny/attiny85_helloworld.X
ATtiny85 "Hello World" project (MPLAB X format).

### attiny2313/SimpleClock
Digital clock using ATtiny2313 with 4-digit 7-segment display. Features:
- 12/24 hour mode selection
- Button-based time adjustment
- BCD time encoding

### attiny2313/SimpleClockExt
Extended version of SimpleClock with additional features.

## Build System

Projects use WinAVR-style Makefiles:

```bash
make all      # Build
make clean    # Clean
make program  # Flash via avrdude
```

## Configuration

Each Makefile defines:
- `MCU`: Target microcontroller (e.g., atmega328p)
- `F_CPU`: Clock frequency (e.g., 8000000 for 8MHz)
- `AVRDUDE_PROGRAMMER`: Programming hardware
- `AVRDUDE_PORT`: Serial port

## Toolchain

- avr-gcc (compiler)
- avr-objcopy (hex file generation)
- avrdude (programming)
