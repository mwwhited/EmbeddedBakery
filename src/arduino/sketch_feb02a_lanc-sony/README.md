# LANC-Sony RS232 Interface

Full-featured Arduino LANC to RS232 interface.

## Description

Bidirectional LANC interface for communicating with Sony cameras via serial. Supports LANC command sending and message receiving with full 8-byte frame capture.

## Features

- Send LANC commands via serial (hex format)
- Receive full 8-byte LANC message responses
- Support for Sony D8 camcorder service mode EEPROM access
- Optimized timing using direct port manipulation

## Hardware Requirements

- Arduino Pro Mini or compatible
- LANC interface circuit

## Pin Configuration

| Function | Pin |
|----------|-----|
| LANC CMD | 7   |
| LANC IN  | 11  |
| LED      | 13  |

## Serial Protocol

- Baud rate: 57600
- Send: 4 hex characters (e.g., "02AF")
- Receive: 8-byte LANC message in hex format

## LANC Timing

- Bit duration: 104 microseconds
- Uses direct port writes for timing accuracy

## Service Mode Commands (Sony D8)

| Command   | Function        |
|-----------|-----------------|
| FF 00     | Read current    |
| FF 67     | Page up         |
| FF 65     | Page down       |
| FF 38     | Address up      |
| FF 36     | Address down    |
| FF 34     | Data up         |
| FF 30     | Data down       |
| FF 32     | Store           |

## Credits

Written by L.Rosén

## References

- http://controlyourcamera.blogspot.com/2011/02/arduino-controlled-video-recording-over.html
- http://lea.hamradio.si/~s51kq/DV-IN.HTM
