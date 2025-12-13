# Generic FPGA Designs

Reusable FPGA designs and IP cores that work across multiple platforms (Xilinx, Altera/Intel).

## Projects

### ClockDivider
Clock divider/frequency divider module.

### FifoToBlockRam
FIFO interface to block RAM converter.

### PMod7SegmentDisplay
7-segment display driver for Pmod interface.

### PModBanked16
16-bit banked I/O interface for Pmod.

### PModKypd
Keypad interface for Pmod KYPD.

### PModVgaTextMode
Text-mode VGA display driver.

### RowColumnDecoder
Row/column address decoder.

### TriggeredFIFOWriter
Triggered FIFO write controller.

## Usage

These modules can be instantiated in platform-specific projects:
- Copy VHDL/Verilog files to your project
- Instantiate the modules in your top-level design
- Adjust generic parameters as needed
