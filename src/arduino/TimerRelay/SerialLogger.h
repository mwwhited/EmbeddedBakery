#ifndef SERIAL_LOGGER_H
#define SERIAL_LOGGER_H

#include <Stream.h>
#include "Relay.h"
#include "Settings.h"

void logRelayStatus(Stream &s);

#endif