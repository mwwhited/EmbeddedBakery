# Arty A7-100T Projects

FPGA projects for the Digilent Arty A7-100T development board.

## Hardware

- **FPGA**: Xilinx Artix-7 (XC7A100TCSG324-1)
- **Memory**: 256MB DDR3L
- **Clock**: 100MHz
- **I/O**: 4 Pmod ports, ChipKit headers, LEDs, switches, buttons

## Projects

### ArtyCalc
Calculator implementation on FPGA.

### ArtyMicroBlazeTutorial
MicroBlaze soft processor tutorial with:
- AXI GPIO
- AXI UART16550
- AXI Interrupt Controller
- Local Memory Bus (LMB) BRAM

### MyCpu
Custom CPU design implementation.

### SimpleAsPossibleComputer
Minimal "Simple As Possible" (SAP) computer architecture implementation.

### Pmod Projects
- **PModEnc** - Rotary encoder interface
- **PModLed8x8** - 8x8 LED matrix driver
- **PModShieldTest** - Shield testing
- **Pmod16bit** - 16-bit switch/LED interface
- **PmodKYPD_Demo** - 4x4 keypad interface

### Tutorials
- **FifoTutorial** - FIFO design and implementation
- **i2c_simple** - Simple I2C master interface
- **test_statemachine** - FSM design examples

## Constraints

Use `arty-a7-100t.xdc` for pin assignments.

## Build

Open `.xpr` project files in Vivado.
