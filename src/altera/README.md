# Altera FPGA Projects

Projects for Altera (now Intel) FPGAs using Quartus.

## Target Device

### Cyclone II EP2C5
Low-cost FPGA development board with:
- EP2C5T144 FPGA
- External SRAM
- PS/2 port
- VGA output
- SD card slot
- Serial UART

## Projects

### CycloneII_ep2c5/
Contains projects for the EP2C5 development board:
- **TestProject1** - Basic FPGA test
- **TestIPSource** - IP source testing

## Pin Assignments

See `landboard-ep2c5.txt` for complete pin mapping:

| Interface | Pins |
|-----------|------|
| Clock | PIN_17 |
| Reset | PIN_144 |
| PS/2 | PIN_86, PIN_87 |
| Serial TX | PIN_103 |
| Serial RX | PIN_101 |
| VGA | PIN_63-72 |
| SRAM | Multiple |
| SD Card | PIN_92-97 |

## Development Environment

- **Quartus Prime** (or legacy Quartus II)
- Programmer: USB Blaster

## Build

Open `.qpf` project files in Quartus.
