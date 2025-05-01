# Relay Controller - Serial Commands and Arduino Pro Micro Pinout

## Serial Commands

All commands can be sent to either `Serial` or `Serial1` at **9600 baud**. Commands are case-insensitive.

### Command List

| Command                               | Arguments                         | Description                                           |
|:--------------------------------------|:----------------------------------|:------------------------------------------------------|
| `set-timeout {color} {seconds}`       | Color name, Timeout in seconds    | Set relay auto-off timeout.                           |
| `set-debounce {color} {milliseconds}` | Color name, Debounce time in ms   | Set button debounce time.                             |
| `on {color}`                          | Color name                        | Turn a relay ON manually.                             |
| `off {color}`                         | Color name                        | Turn a relay OFF manually.                            |
| `save`                                | None                              | Save current timeout and debounce settings to EEPROM. |
| `read-timeout {color}`                | Color name                        | Read current timeout setting for a relay.             |
| `read-debounce {color}`               | Color name                        | Read current debounce setting for a relay.            |
| `status {color}`                      | Color name                        | Get current latch status and timer ticks.             |

### Example Usage

```plaintext
set-timeout blue 600   // Sets blue relay timeout to 10 minutes (600 seconds)
set-debounce red 250   // Sets red button debounce to 250 ms
on green               // Turns green relay ON
off yellow             // Turns yellow relay OFF
save                   // Saves current timeout and debounce settings
read-timeout blue      // Reads blue relay timeout
status red             // Shows red relay status
```

---

## Arduino Pro Micro Pinout (Relay Connections)

| Signal                | Arduino Pin   | Description                       |
|:----------------------|:--------------|:----------------------------------|
| Blue Button           | 15 (TXLED)    | Input button for blue relay       |
| Green Button          | 14 (RXLED)    | Input button for green relay      |
| Yellow Button         | 16 (SCK)      | Input button for yellow relay     |
| Red Button            | 10 (SS)       | Input button for red relay        |
| Blue LED              | A3 (F4)       | Status LED for blue relay         |
| Green LED             | A2 (F5)       | Status LED for green relay        |
| Yellow LED            | A1 (F6)       | Status LED for yellow relay       |
| Red LED               | A0 (F7)       | Status LED for red relay          |
| Blue Relay Control    | 6 (D7)        | Output to control blue relay      |
| Green Relay Control   | 7 (E6)        | Output to control green relay     |
| Yellow Relay Control  | 8 (B4)        | Output to control yellow relay    |
| Red Relay Control     | 9 (B5)        | Output to control red relay       |

**Notes:**
- All button pins are set to `INPUT_PULLUP` mode.
- Relays are **active LOW** (0 = ON, 1 = OFF).
- LEDs are also **active HIGH**.

---

## Default Settings

| Setting   | Value                     |
|:----------|:--------------------------|
| Timeout   | 30 minutes (1800 seconds) |
| Debounce  | 200 milliseconds          |

EEPROM memory is automatically initialized with default values if invalid (0 or 0xFFFFFFFF) data is found.

