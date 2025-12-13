# ArduinoWeb

Web-controlled 8-channel relay controller using ENC28J60 Ethernet module.

## Description

Provides a web interface to control 8 relays via HTTP requests. Uses the ENC28J60 Ethernet controller chip.

## Hardware Requirements

- Arduino Uno or compatible
- ENC28J60 Ethernet module
- 8-channel relay module

## Network Configuration

- MAC: 54:55:58:10:00:24
- IP: 192.168.1.13
- Port: 80

## Pin Configuration

| Relay | Pin |
|-------|-----|
| 0     | A0  |
| 1     | A1  |
| 2     | A2  |
| 3     | A3  |
| 4     | A4  |
| 5     | A5  |
| 6     | D3  |
| 7     | D4  |

## HTTP API

Control relays via URL parameters:

```
http://192.168.1.13/?R0=ON   # Turn relay 0 on
http://192.168.1.13/?R0=OFF  # Turn relay 0 off
http://192.168.1.13/?R1=ON   # Turn relay 1 on
...
```

## Dependencies

- etherShield library
- ETHER_28J60 library
