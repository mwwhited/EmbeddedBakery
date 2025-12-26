# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is **Embedded Bakery**, a collection of electronics and microprocessor projects including PAL, FPGA, CPLD, and microcontroller experiments.

## Repository Structure

```
src/
├── arduino/          # Arduino sketches and libraries
├── AVR/              # AVR microcontroller projects (ATmega, ATtiny)
├── ESP8266/          # ESP8266 WiFi module projects
├── STM32/            # STM32 ARM microcontroller projects
├── PIC/              # Microchip PIC microcontroller projects
├── xilinx/           # Xilinx FPGA projects (Arty A7, Arty Z7)
├── altera/           # Altera/Intel FPGA projects (Cyclone II)
├── GenericFPGA/      # Generic FPGA designs
├── pal/              # Programmable Array Logic projects
├── basicstamp/       # Basic Stamp projects
├── particle/         # Particle IoT projects
└── tools/            # Development tools (.NET solution)
circuits/             # KiCad PCB designs and schematics
notes/                # Reference documentation and datasheets
```

## Build Commands

### AVR Projects (src/AVR/)
AVR projects use WinAVR-style Makefiles:
```bash
make all              # Build the project
make clean            # Clean build artifacts
make program          # Flash to device via avrdude
```
Key Makefile variables: `MCU` (target chip), `F_CPU` (clock frequency), `AVRDUDE_PROGRAMMER`, `AVRDUDE_PORT`

### Arduino Projects (src/arduino/)
Open `.ino` files in Arduino IDE or use arduino-cli:
```bash
arduino-cli compile --fqbn <board> <sketch>
arduino-cli upload -p <port> --fqbn <board> <sketch>
```
Arduino libraries are stored in `src/arduino/libraries/`

### ESP8266/PlatformIO Projects (src/ESP8266/)
Some projects (like LxiBridge) use PlatformIO:
```bash
pio run                 # Build
pio run --target upload # Upload
```

### Xilinx FPGA Projects (src/xilinx/)
Projects use Vivado. Open `.xpr` project files in Vivado IDE.

### .NET Tools (src/tools/BinaryBaker/)
```bash
dotnet build BinaryBaker.sln
dotnet run --project <ProjectName>
```
Tools include: BinaryBaker.Cli, BreadBoardEmulator, MicroCodeBuilder, TruthExpander, XgproLgcTool

### KiCad PCB Projects (circuits/)
Open `.kicad_pcb` and `.kicad_sch` files in KiCad.
KiBot configuration (`docs.kibot.yaml`) generates documentation:
```bash
kibot -c docs.kibot.yaml
```

## Key Technologies

- **Microcontrollers**: ATmega328P, ATtiny2313, ATtiny85, ESP8266, STM32F103, PIC16F627
- **FPGA**: Xilinx Artix-7, Zynq-7020, Altera Cyclone II, XC9500 CPLD
- **PCB Design**: KiCad with custom symbols (`circuits/MyCustomSymbols.kicad_sym`) and footprints (`circuits/MyCustomLibrary.pretty/`)
- **HDL**: VHDL and Verilog for FPGA designs

## Style Guide

Follow the formatting conventions defined in `STYLEGUIDE.md`. Key requirements:

- **Markdown tables**: Align all vertical bars (`|`) for human readability
- **Pin mappings**: Use fixed-width table format with aligned columns
- **ASCII diagrams**: Use consistent monospace spacing for chip pinouts
- **File headers**: Include project name, author, version, and date
