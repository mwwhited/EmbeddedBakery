# Relay Controller – Serial Commands and Pinout Guide

## Overview

This controller firmware supports both **Arduino Pro Mini** and **Arduino Pro Micro**, maintaining a consistent physical pinout across both boards.

## Serial Commands

All commands are sent over `Serial` at **9600 baud**. Commands are case-insensitive.

### Command List

| Command                               | Arguments                       | Description                                                  |                                            |
| :------------------------------------ | :------------------------------ | :----------------------------------------------------------- | ------------------------------------------ |
| `set-timeout {color} {seconds}`       | Color name, Timeout in seconds  | Set relay auto-off timeout.                                  |                                            |
| `set-debounce {color} {milliseconds}` | Color name, Debounce time in ms | Set button debounce time.                                    |                                            |
| `on {color}`                          | Color name                      | Turn a relay ON manually.                                    |                                            |
| `off {color}`                         | Color name                      | Turn a relay OFF manually.                                   |                                            |
| `save`                                | None                            | Save current timeout and debounce settings to EEPROM.        |                                            |
| `show-timeout {color}`                | Color name                      | Show current timeout value in runtime config.                |                                            |
| `show-debounce {color}`               | Color name                      | Show current debounce value in runtime config.               |                                            |
| `load-timeout {color}`                | Color name                      | Load timeout value from EEPROM into runtime config.          |                                            |
| `load-debounce {color}`               | Color name                      | Load debounce value from EEPROM into runtime config.         |                                            |
| `status {color}`                      | Color name                      | Get current latch status and timer ticks.                    |                                            |
| \`logging on                          | off\`                           | "on" or "off"                                                | Enable or disable periodic status logging. |
| `read`                                | None                            | Read raw EEPROM data for all colors (debug/diagnostic).      |                                            |
| `show`                                | None                            | Show current runtime config for all colors.                  |                                            |
| `load`                                | None                            | Load all settings from EEPROM into runtime config.           |                                            |
| `reset`                               | None                            | Reset runtime config to defaults (does not write to EEPROM). |                                            |
| `help`                                | None                            | Display list of available commands.                          |                                            |

### Example Usage

```plaintext
set-timeout blue 600    // Set blue relay timeout to 10 minutes
set-timeout red 0       // Disable automatic timeout for red relay
set-debounce red 250    // Set red debounce to 250 ms
on green                // Turn green relay ON
off yellow              // Turn yellow relay OFF
save                    // Save current settings to EEPROM
show-timeout blue       // Show blue timeout from runtime config
load-debounce red       // Load red debounce from EEPROM to runtime config
status red              // Show red relay status
read                    // Print raw EEPROM data for diagnostics
show                    // Show all runtime config values
load                    // Load all config from EEPROM
reset                   // Reset runtime config to default values
logging off             // Disable periodic logging
help                    // Show available commands
```

---

## Compatible Boards

* ✅ **Arduino Pro Mini** (5V, ATmega328P)
* ✅ **Arduino Pro Micro** (5V, ATmega32U4)

**Note:** This firmware automatically adjusts for board differences and maintains a consistent **physical pin mapping** for relay/buttons/LEDs across both boards.

---

## Relay/Button/LED Pin Mapping

| Signal               | Pro Mini Pin | Pro Micro Pin | Description                    |
| :------------------- | :----------- | :------------ | :----------------------------- |
| Blue Button          | A1 (15)      | F4 (A1)       | Input button for blue relay    |
| Green Button         | A0 (14)      | F5 (A0)       | Input button for green relay   |
| Yellow Button        | A2 (16)      | F6 (A2)       | Input button for yellow relay  |
| Red Button           | D10 (10)     | B6 (D10)      | Input button for red relay     |
| Blue LED             | A3           | F7            | Status LED for blue relay      |
| Green LED            | A2           | F6            | Status LED for green relay     |
| Yellow LED           | A1           | F5            | Status LED for yellow relay    |
| Red LED              | A0           | F4            | Status LED for red relay       |
| Blue Relay Control   | D6           | D7            | Output to control blue relay   |
| Green Relay Control  | D7           | E6            | Output to control green relay  |
| Yellow Relay Control | D8           | B4            | Output to control yellow relay |
| Red Relay Control    | D9           | B5            | Output to control red relay    |

**Notes:**

* Button pins use `INPUT_PULLUP` mode.
* Relays are **active LOW** (0 = ON, 1 = OFF).
* LEDs are **active HIGH**.

---

## Default Settings

| Setting  | Value                     |
| :------- | :------------------------ |
| Timeout  | 30 minutes (1800 seconds) |
| Debounce | 200 milliseconds          |

EEPROM is initialized with these values on first run or if corrupted data is detected.

---

## EEPROM Storage Map

| Address | Size    | Description           |
| :------ | :------ | :-------------------- |
| 0       | 1 byte  | EEPROM Version        |
| 1       | 4 bytes | Blue Relay Timeout    |
| 5       | 4 bytes | Blue Relay Debounce   |
| 9       | 4 bytes | Green Relay Timeout   |
| 13      | 4 bytes | Green Relay Debounce  |
| 17      | 4 bytes | Yellow Relay Timeout  |
| 21      | 4 bytes | Yellow Relay Debounce |
| 25      | 4 bytes | Red Relay Timeout     |
| 29      | 4 bytes | Red Relay Debounce    |

**Note:** EEPROM writes only occur on changes or `save` command, reducing wear.

---

## Serial Logging Output

When logging is enabled, the system outputs status every second:

```
blue> latch:0 tick:0 off
green> latch:1 tick:1234567 on
yellow> latch:0 tick:0 off
red> latch:0 tick:0 off
```

Where:

* `latch`: logic state (1 = on, 0 = off)
* `tick`: time in milliseconds when relay was activated
* Final word: actual relay output state

A built-in LED blinks once per second to indicate the controller is running.