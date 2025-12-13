# Development Tools

.NET development tools and utilities.

## BinaryBaker Solution

A collection of .NET tools for embedded development, ROM/PROM programming, and hardware emulation.

### Build

```bash
cd BinaryBaker
dotnet build BinaryBaker.sln
```

### Projects

#### BinaryBaker.Cli
Command-line interface for binary file manipulation and conversion.

#### BreadBoardEmulator.Cli
Breadboard and circuit emulation tool for testing digital logic designs.

#### MicroCodeBuilder
Microcode generation and compilation tool for custom CPU designs.

#### MicroCodeMaker
Alternative microcode generation utility.

#### TruthExpander
Truth table expansion and Boolean logic simplification tool.

#### XgproLgcTool
Tool for working with Xgpro programmer logic files.

#### DisplayMaker
Display and graphics generation utilities.

#### ImageBuilder
Binary image builder for ROM/EPROM programming.

#### RomFonts
ROM font data and conversion utilities.

#### Emulator
C++ based hardware emulator.

#### Esp32NanoFrameworkTest
.NET nanoFramework test project for ESP32.

#### SimpleTests
Unit tests and simple test utilities.

## Requirements

- .NET 6.0+ SDK
- Visual Studio 2022 (for full solution support)
- .NET nanoFramework extension (for ESP32 project)
