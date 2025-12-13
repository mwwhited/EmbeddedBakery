# ATtiny2313 Projects

Projects for the ATtiny2313 microcontroller.

## SimpleClock

Digital clock with 4-digit 7-segment display.

### Features

- 12/24 hour mode (switch selectable)
- 4-button time adjustment
- Blinking colon separator
- BCD time encoding

### Hardware

- Target: ATtiny2313
- Display: 4-digit common cathode 7-segment
- Inputs: 4 buttons, mode switch

### Pin Configuration

| Port | Function |
|------|----------|
| PORTD | 7-segment data |
| PORTB[0:3] | Digit select |
| PORTB[4:7] | Button inputs |
| PORTA[0] | 12/24 hour switch |
| PORTA[1] | Colon LED |

### Button Functions

| Button | Function |
|--------|----------|
| PINB7 | Hour + |
| PINB6 | Hour - |
| PINB5 | Minute + |
| PINB4 | Minute - |

## SimpleClockExt

Extended clock with additional features.
