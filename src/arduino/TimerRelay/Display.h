#ifndef DISPLAY_H
#define DISPLAY_H

#include "Relay.h"

class Display {
public:
    virtual void initialize() = 0;
    virtual void clear() = 0;
    virtual void showRelayStatus(const Relay &relay) = 0;
    virtual void showSystemStatus() = 0;
    virtual void showMessage(const char* line1, const char* line2 = nullptr) = 0;
    virtual ~Display() {}
};

#endif // DISPLAY_H