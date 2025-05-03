# Relay Controller - Serial Commands and Arduino Pro Mini Pinout

## Serial Commands

All commands can be sent to `Serial` at **9600 baud**. Commands are case-insensitive.

### Command List

| Command                               | Arguments                       | Description                                           |
| :------------------------------------ | :------------------------------ | :---------------------------------------------------- |
| `set-timeout {color} {seconds}`       | Color name, Timeout in seconds  | Set relay auto-off timeout.                           |
| `set-debounce {color} {milliseconds}` | Color name, Debounce time in ms | Set button debounce time.                             |
| `on {color}`                          | Color name                      | Turn a relay ON manually.                             |
| `off {color}`                         | Color name                      | Turn a relay OFF manually.                            |
| `save`                                | None                            | Save current timeout and debounce settings to EEPROM. |
| `read-timeout {color}`                | Color name                      | Read current timeout setting for a relay.             |
| `read-debounce {color}`               | Color name                      | Read current debounce setting for a relay.            |
| `status {color}`                      | Color name                      | Get current latch status and timer ticks.             |
| `logging on|off`                      | "on" or "off"                   | Enable or disable periodic status logging.            |
| `help`                                | None                            | Display list of available commands.                   |

### Example Usage

```plaintext
set-timeout blue 600   // Sets blue relay timeout to 10 minutes (600 seconds)
set-timeout red 0      // Disables automatic timeout for red relay
set-debounce red 250   // Sets red button debounce to 250 ms
on green               // Turns green relay ON
off yellow             // Turns yellow relay OFF
save                   // Saves current timeout and debounce settings
read-timeout blue      // Reads blue relay timeout
status red             // Shows red relay status
logging off            // Disables periodic status logging
help                   // Shows available commands
```

---

## Arduino Pro Mini Pinout (Relay Connections)

| Signal               | Arduino Pin | Description                    |
| :------------------- | :---------- | :----------------------------- |
| Blue Button          | 15 (A1)     | Input button for blue relay    |
| Green Button         | 14 (A0)     | Input button for green relay   |
| Yellow Button        | 16 (A2)     | Input button for yellow relay  |
| Red Button           | 10 (D10)    | Input button for red relay     |
| Blue LED             | A3          | Status LED for blue relay      |
| Green LED            | A2          | Status LED for green relay     |
| Yellow LED           | A1          | Status LED for yellow relay    |
| Red LED              | A0          | Status LED for red relay       |
| Blue Relay Control   | 6 (D6)      | Output to control blue relay   |
| Green Relay Control  | 7 (D7)      | Output to control green relay  |
| Yellow Relay Control | 8 (D8)      | Output to control yellow relay |
| Red Relay Control    | 9 (D9)      | Output to control red relay    |

**Notes:**

* All button pins are set to `INPUT_PULLUP` mode.
* Relays are **active LOW** (0 = ON, 1 = OFF).
* LEDs are **active HIGH**.

---

## Default Settings

| Setting  | Value                     |
| :------- | :------------------------ |
| Timeout  | 30 minutes (1800 seconds) |
| Debounce | 200 milliseconds          |

EEPROM memory is automatically initialized with default values if invalid (0 or 0xFFFFFFFF) data is found.

## EEPROM Storage

The controller stores configuration in EEPROM with version tracking to ensure compatibility across firmware updates:

| Address | Size    | Description                  |
| :------ | :------ | :--------------------------- |
| 0       | 1 byte  | EEPROM Version               |
| 1       | 4 bytes | Blue Relay Timeout           |
| 5       | 4 bytes | Blue Relay Debounce          |?
| 9       | 4 bytes | Green Relay Timeout          |
| 13      | 4 bytes | Green Relay Debounce         |
| 17      | 4 bytes | Yellow Relay Timeout         |
| 21      | 4 bytes | Yellow Relay Debounce        |
| 25      | 4 bytes | Red Relay Timeout            |
| 29      | 4 bytes | Red Relay Debounce           |

**Note:** Settings are only written to EEPROM when they change or when the `save` command is issued, to minimize EEPROM wear.

---

## Serial Output Format

When logging is enabled, the controller outputs status information for all relays once per second:

```
blue> latch:0 tick:0 off
green> latch:1 tick:1234567 on
yellow> latch:0 tick:0 off
red> latch:0 tick:0 off
```

Where:
- `latch` is the internal state (1=on, 0=off)
- `tick` is the millisecond timer value when the relay was turned on
- The final word indicates current relay state

The built-in LED blinks once per second to indicate the system is operational.