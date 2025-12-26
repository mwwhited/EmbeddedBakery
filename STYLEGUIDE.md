# Style Guide

This document defines formatting and style conventions for documentation and code in this repository.

## Markdown Tables

Tables must have properly aligned vertical bars for human readability.

### Correct

```markdown
| Column A | Column B        | Column C   |
|----------|-----------------|------------|
| Short    | Medium Value    | Longer Val |
| X        | Another Example | Data       |
```

### Incorrect

```markdown
| Column A | Column B | Column C |
|----------|----------|----------|
| Short | Medium Value | Longer Val |
| X | Another Example | Data |
```

### Rules

1. Pad cell contents with spaces so all `|` characters align vertically
2. Header separator row (`|---|`) should match column widths
3. Content should be left-aligned within cells (pad right side)
4. Use consistent column widths throughout the table

## Code Comments

- Use C-style block comments for file headers
- Use single-line comments for inline explanations
- Keep comments concise and meaningful

### C/C++ Header Example

```c
/*
 * Project Name - Brief Description
 * Original by Author Name - version - date
 *
 * Hardware:
 *   - Component 1
 *   - Component 2
 */
```

## Pin Mapping Documentation

When documenting microcontroller pin mappings, use fixed-width format:

```
| MCU Pin | Function        | Direction |
|---------|-----------------|-----------|
| PD2     | Sensor Input    | Input     |
| PD3     | LED Control     | Output    |
| PB0     | Motor A         | Output    |
```

## ASCII Art Diagrams

For chip pinouts, use monospace formatting with consistent spacing:

```
          +----U----+
    PA2  1|         |20  VCC
    PD0  2|         |19  PB7
    PD1  3|         |18  PB6
    PA1  4|         |17  PB5
    PA0  5|         |16  PB4
    PD2  6|         |15  PB3
    PD3  7|         |14  PB2
    PD4  8|         |13  PB1
    PD5  9|         |12  PB0
    GND 10|         |11  PD6
          +---------+
```

## File Naming

| Type              | Convention              | Example                |
|-------------------|-------------------------|------------------------|
| C source          | lowercase, underscores  | `main.c`, `motor_ctrl.c` |
| C headers         | lowercase, underscores  | `config.h`             |
| Makefiles         | `Makefile` (exact)      | `Makefile`             |
| Documentation     | UPPERCASE or Title Case | `README.md`, `NOTES.md`|
| Project folders   | PascalCase or lowercase | `Phase1`, `blink_test` |

## Version Headers

Include version and date information in source file headers:

```c
/*
 * Project Name
 * Author: Name
 * Version: 1.0
 * Date: YYYY-MM-DD
 */
```
