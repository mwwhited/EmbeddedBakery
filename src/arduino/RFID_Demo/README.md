# RFID Demo

Parallax RFID Card Reader demonstration.

## Description

Reads and displays RFID tag IDs from a Parallax RFID Card Reader (#28140) via serial output.

## Hardware Requirements

- Arduino Uno or compatible
- Parallax RFID Card Reader (#28140)
- Compatible RFID tags

## Pin Configuration

| Function   | Pin |
|------------|-----|
| Enable     | 9   |
| RX (SOUT)  | 10  |
| TX (unused)| 11  |

## Wiring

```
Arduino     RFID Reader
-------     -----------
Pin 9  -->  ENABLE
Pin 10 <--  SOUT
GND    ---  GND
5V     ---  VCC
```

## Protocol

- RFID Reader baud: 2400
- Serial Monitor baud: 9600
- Tag ID: 10-byte ASCII string

## Dependencies

- SoftwareSerial library

## Credits

Original code by Joe Grand (www.grandideastudio.com) for Parallax Inc.
