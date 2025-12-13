# BinaryBaker

.NET solution containing tools for embedded development, ROM/PROM programming, and hardware emulation.

## Build

```bash
dotnet build BinaryBaker.sln
```

## Projects

### Active Tools

| Project | Description |
|---------|-------------|
| BreadBoardEmulator.Cli | Breadboard circuit emulation |
| MicroCodeBuilder | Microcode generation for custom CPUs |
| TruthExpander | Boolean logic and truth table tools |
| XgproLgcTool | Xgpro programmer logic file tool |
| DisplayMaker | Display generation utilities |

### Retired/Legacy

Projects in the "Retired" folder:
- BinaryBaker.Cli - Binary file manipulation
- RomFonts - ROM font utilities
- ImageBuilder - ROM image builder
- Emulator - C++ hardware emulator
- SimpleTests - Test utilities
- MicroCodeMaker - Legacy microcode tool
- Esp32NanoFrameworkTest - nanoFramework experiments

## Requirements

- .NET 6.0+ SDK
- Visual Studio 2022 (optional, for IDE support)
