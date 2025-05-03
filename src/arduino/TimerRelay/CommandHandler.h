#ifndef COMMAND_HANDLER_H
#define COMMAND_HANDLER_H

#include <Stream.h>
#include "CircularBuffer.h"

#define HISTORY_SIZE 4
#define CMD_MAX_LENGTH 32

class CommandHandler {
public:
    static void handleCommand(const String &line, Stream &out);
    static void handleSerial(Stream &s);
    static void addToHistory(const String &cmd);
    static String getPreviousCommand();
    static String getNextCommand();

private:
    static CircularBuffer<String, HISTORY_SIZE> history;
    static int historyIndex;
};

#endif