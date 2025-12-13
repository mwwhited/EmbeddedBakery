# Embedded Bakery

## Summary

This is a collection of various electronics and microprocessor projects including PAL, FPGA, CPLD, and microcontroller experiments.

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
├── GenericFPGA/      # Reusable FPGA IP cores
├── pal/              # Programmable Array Logic projects
├── basicstamp/       # Basic Stamp projects
├── particle/         # Particle IoT projects
└── tools/            # Development tools (.NET solution)
circuits/             # KiCad PCB designs and schematics
notes/                # Reference documentation and datasheets
```

## Key Projects

### Microcontroller Projects
- **Arduino**: Various sensor interfaces, relay controllers, FreeRTOS examples, LANC camera control
- **ESP8266**: LXI Serial Bridge, WiFi relay controllers, network interfaces
- **AVR**: Bare-metal ATmega/ATtiny projects, digital clock
- **STM32**: Blue Pill development projects
- **PIC**: PIC16F627 LED chase patterns

### FPGA Projects
- **Xilinx Arty A7**: MicroBlaze tutorials, custom CPU designs, Pmod interfaces
- **Xilinx Arty Z7**: Zynq HLS tutorials
- **Altera Cyclone II**: Basic FPGA experiments
- **XC9500 CPLD**: Legacy CPLD projects

### PCB Designs
- Analog computer circuits
- Development boards
- Interface adapters (LANC, RS485, H4n)

### Development Tools
- BinaryBaker: ROM/PROM utilities
- MicroCodeBuilder: Custom CPU microcode tools
- TruthExpander: Boolean logic tools

## Getting Started

See individual project README files for specific build instructions.

### Quick Reference

| Platform | Build Tool |
|----------|------------|
| Arduino | Arduino IDE / arduino-cli |
| AVR | WinAVR / avr-gcc + avrdude |
| ESP8266 | PlatformIO / Arduino IDE |
| STM32 | STM32duino / STM32CubeIDE |
| PIC | MPLAB X + XC8 |
| Xilinx | Vivado / ISE |
| Altera | Quartus |
| KiCad | KiCad + KiBot |
| .NET | dotnet CLI / Visual Studio |  
