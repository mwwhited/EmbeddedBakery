# Uno CardInfo

SD Card diagnostic utility.

## Description

Tests SD card connectivity and displays card information including type, size, and file listing. Useful for verifying SD card wiring and compatibility.

## Hardware Requirements

- Arduino Uno or compatible
- SD card module or shield

## Pin Configuration (SPI)

| Function | Pin |
|----------|-----|
| CS       | 4   |
| MOSI     | 11  |
| MISO     | 12  |
| CLK      | 13  |

## Output Information

- Card type (SD1, SD2, SDHC)
- Cluster count and size
- Volume size (KB, MB, GB)
- FAT type (FAT16/FAT32)
- File listing with dates and sizes

## Chip Select Options

Adjust `chipSelect` constant for your hardware:
- Arduino Ethernet shield: pin 4
- Adafruit SD shields: pin 10
- Sparkfun SD shield: pin 8
- MKRZero: SDCARD_SS_PIN

## Dependencies

- SPI library
- SD library

## Credits

Original code by Limor Fried and Tom Igoe.
