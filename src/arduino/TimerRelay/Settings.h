#ifndef SETTINGS_H
#define SETTINGS_H

#include <Arduino.h>

class Settings {
public:
    static void load();
    static void save();
    static void reset();
    
    // System settings
    static bool getLoggingEnabled();
    static void setLoggingEnabled(bool enabled);
    static bool getDebugEnabled();
    static void setDebugEnabled(bool enabled);
    
    // Timing settings
    static unsigned long getDefaultTimeout();
    static unsigned long getDefaultDebounce();
    static unsigned long getMaxTimeout();
    static unsigned long getMinDebounce();
    static unsigned long getMaxDebounce();
    
    // Serial settings
    static unsigned long getBaudRate();
    static uint8_t getCommandHistorySize();
    static uint8_t getMaxInputLength();

private:
    static bool loggingEnabled;
    static bool debugEnabled;
    static const unsigned long DEFAULT_TIMEOUT;
    static const unsigned long DEFAULT_DEBOUNCE;
    static const unsigned long MAX_TIMEOUT;
    static const unsigned long MIN_DEBOUNCE;
    static const unsigned long MAX_DEBOUNCE;
    static const unsigned long BAUD_RATE;
    static const uint8_t COMMAND_HISTORY_SIZE;
    static const uint8_t MAX_INPUT_LENGTH;
};

#endif