# Xilinx FPGA Projects

Projects for Xilinx FPGAs and CPLDs using Vivado and ISE.

## Target Boards

### Arty A7-100T
Digilent Arty A7 development board with Artix-7 FPGA (XC7A100T).

### Arty Z7-20
Digilent Arty Z7 development board with Zynq-7020 SoC (XC7Z020).

### XC9500 CPLD
Xilinx XC9500 series CPLD projects.

## Projects

### arty_a7_100/
- **ArtyCalc** - Calculator implementation
- **ArtyMicroBlazeTutorial** - MicroBlaze soft processor tutorial
- **AxiMigAndMore** - AXI Memory Interface Generator
- **CharacterIndexToBitmask** - Character rendering utilities
- **CharacterSimplify** - Character simplification logic
- **CustomInterfaceTest** - Custom AXI interface testing
- **FifoTutorial** - FIFO implementation tutorial
- **MyCpu** - Custom CPU design
- **PModEnc** - Pmod rotary encoder interface
- **PModLed8x8** - 8x8 LED matrix Pmod driver
- **PModShieldTest** - Pmod shield testing
- **Pmod16bit** - 16-bit Pmod interface
- **PmodKYPD_Demo** - Pmod keypad demonstration
- **SimpleAsPossibleComputer** - Minimal CPU implementation
- **TestAgimus** - Test project
- **i2c_simple** - Simple I2C interface
- **test_proj** - Test project
- **test_statemachine** - State machine examples

### arty_z7_20/
- **HLS-Tiny-Tutorials** - Vivado HLS tutorials
- **helloworld** - Basic Zynq hello world

### xc9500/
- **Multip** - Multiplexer designs
- **TestXilinx** - Test projects
- **calc** - Calculator logic
- **pldt1** - PLD test
- **sch** - Schematic designs

## Development Environment

- **Vivado Design Suite** - For Artix-7 and Zynq devices
- **ISE Design Suite** - For XC9500 CPLD (legacy)

## Constraints

Board constraint files (.xdc) are provided:
- `arty-a7-100t.xdc` - Arty A7 pin assignments
- `migmem.xdc` - Memory interface constraints

## IP Catalog

Custom IP cores are stored in `IpCatalog/`.

## Notes

Design notes and documentation are in `Notes/`:
- FIFO implementation details
- State machine diagrams
