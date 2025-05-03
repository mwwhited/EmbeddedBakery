#ifndef MOCK_DISPLAY_H
#define MOCK_DISPLAY_H

#include "../Display.h"

class MockDisplay : public Display {
public:
    virtual void initialize() override { initialized = true; }
    virtual void clear() override { lastMessage1 = lastMessage2 = ""; }
    
    virtual void showRelayStatus(const Relay &relay) override {
        lastRelay = &relay;
        lastMessage1 = relay.name;
        lastMessage2 = relay.ticks == 0 ? "OFF" : "ON";
    }
    
    virtual void showSystemStatus() override {
        lastMessage1 = "System Status";
    }
    
    virtual void showMessage(const char* line1, const char* line2 = nullptr) override {
        lastMessage1 = line1 ? line1 : "";
        lastMessage2 = line2 ? line2 : "";
    }

    bool initialized = false;
    const Relay* lastRelay = nullptr;
    String lastMessage1;
    String lastMessage2;
};