#ifndef ERROR_HANDLER_H
#define ERROR_HANDLER_H

#include <Arduino.h>
#include <Stream.h>

class ErrorHandler {
public:
    enum ErrorCode {
        NO_ERROR = 0,
        INVALID_RELAY = 1,
        INVALID_TIMEOUT = 2,
        INVALID_DEBOUNCE = 3,
        EEPROM_ERROR = 4,
        COMMAND_TOO_LONG = 5,
        INVALID_COMMAND = 6
    };

    static void reportError(Stream &out, ErrorCode code);
    static bool hasError();
    static ErrorCode getLastError();
    static void clearError();

private:
    static ErrorCode lastError;
};

#endif