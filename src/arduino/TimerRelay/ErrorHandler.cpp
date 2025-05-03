#include "ErrorHandler.h"

ErrorHandler::ErrorCode ErrorHandler::lastError = ErrorHandler::NO_ERROR;

void ErrorHandler::reportError(Stream &out, ErrorCode code) {
    lastError = code;
    switch (code) {
        case INVALID_RELAY:
            out.println(F("Error: Invalid relay specified"));
            break;
        case INVALID_TIMEOUT:
            out.println(F("Error: Invalid timeout value"));
            break;
        case INVALID_DEBOUNCE:
            out.println(F("Error: Invalid debounce value"));
            break;
        case EEPROM_ERROR:
            out.println(F("Error: EEPROM operation failed"));
            break;
        case COMMAND_TOO_LONG:
            out.println(F("Error: Command too long"));
            break;
        case INVALID_COMMAND:
            out.println(F("Error: Invalid command"));
            break;
        default:
            out.println(F("Unknown error"));
    }
}

bool ErrorHandler::hasError() {
    return lastError != NO_ERROR;
}

ErrorHandler::ErrorCode ErrorHandler::getLastError() {
    return lastError;
}

void ErrorHandler::clearError() {
    lastError = NO_ERROR;
}