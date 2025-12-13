# PIC16F627 Projects

Projects for PIC16F627/628 microcontrollers.

## p4048.X

LED chase pattern with button input.

### Features

- 6-LED chase pattern on PORTB (RB0-RB5)
- 4-button input on PORTA (RA0-RA3)
- Bidirectional pattern movement
- Button input overrides pattern position

### Pin Configuration

| Pin | Port | Function |
|-----|------|----------|
| 6   | RB0  | LED 1    |
| 7   | RB1  | LED 2    |
| 8   | RB2  | LED 3    |
| 9   | RB3  | LED 4    |
| 10  | RB4  | LED 5    |
| 11  | RB5  | LED 6    |
| 17  | RA0  | Switch 1 |
| 18  | RA1  | Switch 2 |
| 1   | RA2  | Switch 3 |
| 2   | RA3  | Switch 4 |

### Configuration

- Oscillator: HS (High-speed crystal)
- Watchdog: Disabled
- MCLR: Enabled
- Clock: 4 MHz

### Build

```bash
# Using MPLAB X IDE
# Or command line with XC8:
make
```
