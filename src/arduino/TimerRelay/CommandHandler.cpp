#include "CommandHandler.h"
#include "Configuration.h"
#include "RelayManager.h"
#include "SerialLogger.h"
#include "EEPROMManager.h"
#include "ErrorHandler.h"
#include <Arduino.h>

CircularBuffer<String, HISTORY_SIZE> CommandHandler::history;
int CommandHandler::historyIndex = 0;

void CommandHandler::addToHistory(const String &cmd) {
    if (cmd.length() > 0) {
        history.push(cmd);
        historyIndex = history.size();
    }
}

String CommandHandler::getPreviousCommand() {
    if (historyIndex > 0) {
        historyIndex--;
        return history.peek(historyIndex);
    }
    return "";
}

String CommandHandler::getNextCommand() {
    if (historyIndex < history.size() - 1) {
        historyIndex++;
        return history.peek(historyIndex);
    }
    return "";
}

void CommandHandler::handleSerial(Stream &s) {
    static String input;
    static bool escapeSequence = false;
    static bool arrowSequence = false;
    
    while (s.available()) {
        char c = s.read();
        
        if (escapeSequence) {
            if (arrowSequence) {
                // Handle arrow keys
                switch (c) {
                    case 'A': // Up arrow
                        input = getPreviousCommand();
                        s.print(F("\r\n> "));
                        s.print(input);
                        break;
                    case 'B': // Down arrow
                        input = getNextCommand();
                        s.print(F("\r\n> "));
                        s.print(input);
                        break;
                }
                escapeSequence = arrowSequence = false;
            } else if (c == '[') {
                arrowSequence = true;
            } else {
                escapeSequence = false;
            }
        } else if (c == 27) { // ESC character
            escapeSequence = true;
        } else if (c == '\n' || c == '\r') {
            s.println(); // Echo newline
            if (input.length() > 0) {
                addToHistory(input);
                handleCommand(input, s);
            }
            s.print(F("> ")); // Print prompt
            input = "";
        } else if (c == 8 || c == 127) { // Backspace
            if (input.length() > 0) {
                input.remove(input.length() - 1);
                s.print(F("\b \b")); // Move back, clear char, move back
            }
        } else if (input.length() < CMD_MAX_LENGTH) {
            input += c;
            s.print(c); // Echo character
        }
    }
}

void handleCommand(const String &line, Stream &out) {
  ErrorHandler::clearError();
  
  if (line.length() > MAX_INPUT_LENGTH) {
    ErrorHandler::reportError(out, ErrorHandler::COMMAND_TOO_LONG);
    return;
  }
  
  String tokens[3];
  int tokenCount = 0;
  int startPos = 0;
  int spacePos;
  
  while (tokenCount < 3 && (spacePos = line.indexOf(' ', startPos)) != -1) {
    tokens[tokenCount++] = line.substring(startPos, spacePos);
    startPos = spacePos + 1;
  }
  if (startPos < (int)line.length() && tokenCount < 3) {
    tokens[tokenCount++] = line.substring(startPos);
  }
  
  String &cmd = tokens[0];
  String arg1 = tokenCount > 1 ? tokens[1] : "";
  String arg2 = tokenCount > 2 ? tokens[2] : "";

  int i = findRelayByName(arg1);
  if (i == -1 && (cmd != "help" && cmd != "?" && cmd != "status" && 
      cmd != "save" && cmd != "load" && cmd != "reset" && 
      cmd != "logging" && cmd != "debug")) {
    ErrorHandler::reportError(out, ErrorHandler::INVALID_RELAY);
    return;
  }

  if (cmd == "set-timeout" && i != -1) {
    long seconds = arg2.toInt();
    if (seconds < 0) {
      ErrorHandler::reportError(out, ErrorHandler::INVALID_TIMEOUT);
    } else if (seconds == 0) {
      relays[i].timeout = DEFAULT_TIMEOUT;
      out.print(F("Timeout for "));
      out.print(relays[i].name);
      out.print(F(" set to default ("));
      out.print(DEFAULT_TIMEOUT / 1000);
      out.println(F(" seconds)"));
      settingsChanged = true;
    } else {
      relays[i].timeout = seconds * 1000UL;
      out.print(F("Timeout for "));
      out.print(relays[i].name); 
      out.print(F(" set to ")); 
      out.print(seconds);
      out.println(F(" seconds"));
      settingsChanged = true;
    }
  } else if (cmd == "set-debounce" && i != -1) {
    long debounce = arg2.toInt();
    if (debounce <= 0) {
      ErrorHandler::reportError(out, ErrorHandler::INVALID_DEBOUNCE);
    } else {
      relays[i].debounce = debounce;
      out.print(F("Debounce for "));
      out.print(relays[i].name);
      out.print(F(" set to "));
      out.print(relays[i].debounce);
      out.println(F(" ms"));
      settingsChanged = true;
    }
  } else if (cmd == "on" && i != -1) {
    turnOn(relays[i]);
    out.print(relays[i].name); out.println(F(" turned on"));
  } else if (cmd == "off" && i != -1) {
    turnOff(relays[i]);
    out.print(relays[i].name); out.println(F(" turned off"));
  } else if (cmd == "show-timeout" && i != -1) {
    out.print(F("Timeout for ")); 
    out.print(relays[i].name);
    out.print(F(": "));
    out.print(relays[i].timeout / 1000);
    out.println(F(" seconds"));
  } else if (cmd == "show-debounce" && i != -1) {
    out.print(F("Debounce for "));
    out.print(relays[i].name);
    out.print(F(": "));
    out.print(relays[i].debounce); 
    out.println(F(" ms"));
  } else if (cmd == "read-timeout" && i != -1) {
    out.print(F("Timeout for ")); 
    out.print(relays[i].name);
    out.print(F(": "));
    unsigned long value = readRelayTimeout(i);
    out.print(value / 1000);
    out.println(F(" seconds"));
  } else if (cmd == "read-debounce" && i != -1) {
    out.print(F("Debounce for ")); 
    out.print(relays[i].name);
    out.print(F(": "));
    unsigned long value = readRelayDebounce(i);
    out.print(value);
    out.println(F(" ms"));
  } else if (cmd == "status") {
    if (i != -1) {
      logRelayStatus(out);
    } else {
      logRelayStatus(out);
    }
  } else if (cmd == "save") {
    if (settingsChanged) {
      saveAllSettings(); 
      out.println(F("Settings saved to EEPROM"));
    } else {
      out.println(F("No changes to save"));
    }
  } else if (cmd == "load") {
    out.println(F("Loading settings from EEPROM"));
    if (EEPROMManager::loadSettings()) {
      for (int i = 0; i < NUM_RELAYS; i++) {
        loadRelaySettings(i);
      }
      out.println(F("Settings loaded successfully"));
    } else {
      out.println(F("Failed to load settings - using defaults"));
      for (int i = 0; i < NUM_RELAYS; i++) {
        relays[i].timeout = DEFAULT_TIMEOUT;
        relays[i].debounce = DEFAULT_DEBOUNCE;
      }
    }
  } else if ((cmd == "logging" || cmd == "log") && (arg1 == "on" || arg1 == "start")) {
    loggingEnabled = true; 
    out.println(F("Logging enabled"));
  } else if ((cmd == "logging" || cmd == "log") && (arg1 == "off" || arg1 == "stop")) {
    loggingEnabled = false; 
    out.println(F("Logging disabled"));
  } else if ((cmd == "debug") && (arg1 == "on" || arg1 == "start")) {
    debugEnabled = true; 
    out.println(F("Debug enabled"));
  } else if ((cmd == "debug") && (arg1 == "off" || arg1 == "stop")) {
    debugEnabled = false; 
    out.println(F("Debug disabled"));
  } else if (cmd == "help" || cmd == "?") {
    out.println(F("Available commands:"));
    out.println(F("  on <relay> - Turn on relay"));
    out.println(F("  off <relay> - Turn off relay"));
    out.println(F("  set-timeout <relay> <seconds> - Set timeout"));
    out.println(F("  set-debounce <relay> <ms> - Set debounce"));
    out.println(F("  show-timeout <relay> - Display current timeout"));
    out.println(F("  show-debounce <relay> - Display current debounce"));
    out.println(F("  read-timeout <relay> - Display saved timeout"));
    out.println(F("  read-debounce <relay> - Display saved debounce"));
    out.println(F("  status <relay> - Show relay status"));
    out.println(F("  save - Save settings to EEPROM"));
    out.println(F("  load - Load settings from EEPROM"));
    out.println(F("  reset - Reset device"));
    out.println(F("  logging on|off - Enable/disable status logging"));
    out.println(F("  debug on|off - Enable/disable debugging"));
    out.println(F("  help - Show this help"));
  } else {
    out.println(F("Unknown command or invalid relay name"));
    out.println(F("Type 'help' for available commands"));
  }
}