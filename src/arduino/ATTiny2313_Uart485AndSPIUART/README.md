# ATTiny2313 UART/RS485 and SPI Bridge

Bridge between RS485 serial and SPI interfaces for ATtiny2313.

## Description

Implements a protocol bridge that receives commands via RS485 and forwards them over SPI to a connected device (designed for Zoom H4n control). Includes a watchdog LED indicator.

## Hardware Requirements

- ATtiny2313
- RS485 transceiver (MAX485 or similar)
- SPI peripheral device

## Pin Configuration

```
              ATiny2313
Reset,17,PA2 -| 1 V 20|- Vcc
RXD  ,00,PD0 -| 2   19|- PB7,SCK/SCL
TXD  ,01,PD1 -| 3   18|- PB6,MISO
XTAL2,02,PA1 -| 4   17|- PB5,MOSI/SDA
XTAL1,03,PA0 -| 5   16|- PB4,OC1B
INT0 ,04,PD2 -| 6   15|- PB3,OC1A (LED)
INIT1,05,PD3 -| 7   14|- PB2,OC0A
     ,06,PD4 -| 8   13|- PB1
     ,07,PD5 -| 9   12|- PB0
     ,  ,GND -|10   11|- PD6
```

| Function  | Pin |
|-----------|-----|
| LED       | 4   |
| DIRECTION | 2   |

## Protocol

- Baud rate: 9600
- Commands received on RS485 are forwarded via SPI
- Automatic response scheduling with 250ms offset
