# SimpleClock

Digital clock for ATtiny2313 with 7-segment display.

## Description

A simple digital clock using the ATtiny2313 microcontroller and a 4-digit 7-segment LED display. Supports both 12-hour and 24-hour (military) time formats.

## Features

- 4-digit time display (HH:MM)
- 12/24 hour mode selection
- Button-based time adjustment
- Blinking colon indicator
- BCD time encoding

## Hardware Requirements

- ATtiny2313 microcontroller
- 4-digit common cathode 7-segment display
- 4 push buttons for time adjustment
- Mode selection switch

## Pin Configuration

### Port D (7-Segment Data)
All pins configured as outputs for segment control (a-g).

### Port B
| Pin | Direction | Function |
|-----|-----------|----------|
| PB0-3 | Output | Digit select (active low) |
| PB4-7 | Input | Button inputs |

### Port A
| Pin | Direction | Function |
|-----|-----------|----------|
| PA0 | Input | 12/24 hour mode switch |
| PA1 | Output | Colon LED |

## Button Functions

| Button | Pin | Action |
|--------|-----|--------|
| Hour + | PB7 | Increment hour |
| Hour - | PB6 | Decrement hour |
| Min +  | PB5 | Increment minute |
| Min -  | PB4 | Decrement minute |

## Time Format

Time is stored in BCD format:
- Bits 23-16: Hours (BCD)
- Bits 15-8: Minutes (BCD)
- Bits 7-0: Seconds (BCD)

## Dependencies

- SegmentedDisplay.h (7-segment encoding)
- Encoding.h (BCD conversion)
