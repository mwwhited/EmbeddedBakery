# STM32 Blue Pill Blink

LED blink demonstration for STM32F103C8T6.

## Description

Toggles the built-in LED on PC13 with a pattern:
1. One second on, one second off
2. Ten rapid blinks (100ms interval)
3. Repeat

## Hardware

- STM32F103C8T6 "Blue Pill" board
- LED on PC13 (active low on most boards)

## Build

Use Arduino IDE with STM32duino core:
1. Select board: Generic STM32F1 series -> BluePill F103C8
2. Upload via ST-Link or USB bootloader

## Credits

Modified from Arduino example by Scott Fitzgerald.
Adapted for Maple Mini/Blue Pill by Roger Clark.
