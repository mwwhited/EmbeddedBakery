# I2C LCD Display Demo

I2C LCD character display demonstration.

## Description

Displays all available characters on an I2C LCD, then acts as a serial-to-LCD terminal.

## Hardware Requirements

- Arduino Uno or compatible
- 20x4 I2C LCD display (address 0x27)

## Configuration

| Parameter | Value |
|-----------|-------|
| Columns   | 20    |
| Rows      | 4     |
| Address   | 0x27  |

## Serial Interface

- Baud rate: 9600
- Characters received are displayed on LCD

## Dependencies

- Wire
- LiquidCrystal_I2C
