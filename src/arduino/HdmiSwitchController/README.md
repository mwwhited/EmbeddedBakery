# HDMI Switch Controller

## Summary

Arduino-based controller for the [Fosmon HD1832 HDMI switch](https://www.amazon.com/gp/product/B008D6YZXG). Provides serial control and input status monitoring.

## Features

- Serial command interface for switching inputs
- Automatic input status polling and reporting
- IR transmission for switch control
- Status feedback via RS485 or serial

## Hardware Requirements

- Arduino Mini or compatible
- Logic level converter (for IR receiver integration)
- IRremote compatible IR LED on pin 3

## Pin Configuration

| Function    | Pin |
|-------------|-----|
| IR Receive  | 11  |
| Input Det 1 | 2   |
| Input Det 2 | 4   |
| Input Det 3 | 5   |
| Input Det 4 | 6   |
| Input Det 5 | 7   |

## Serial Protocol

- Baud rate: 9600
- Send single digit (1-5) to switch to that HDMI input
- Response format: `HDMIx;command;code;input;`

## IR Codes

| Input | NEC Code   |
|-------|------------|
| 1     | 0x1FEA05F  |
| 2     | 0x1FEE01F  |
| 3     | 0x1FE10EF  |
| 4     | 0x1FE906F  |
| 5     | 0x1FED827  |

## Dependencies

- IRremote library