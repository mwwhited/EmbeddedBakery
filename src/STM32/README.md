# STM32 Projects

Projects for STM32 ARM Cortex-M microcontrollers.

## Projects

### F103C8/Blink
LED blink demonstration for STM32F103C8T6 (Blue Pill) board.

## Hardware

- STM32F103C8T6 "Blue Pill" board
- Built-in LED on PC13

## Development Environment

Projects use the STM32duino framework (Arduino IDE with STM32 board support).

### Arduino IDE Setup

1. Add board URL: `https://github.com/stm32duino/BoardManagerFiles/raw/main/package_stmicroelectronics_index.json`
2. Install "STM32 MCU based boards" from Board Manager
3. Select "Generic STM32F1 series" -> "BluePill F103C8"

## Programming

- Use ST-Link V2 programmer
- Or USB DFU mode with bootloader
