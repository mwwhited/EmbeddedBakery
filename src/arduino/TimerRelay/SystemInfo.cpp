#include "SystemInfo.h"

unsigned long SystemInfo::lastUpdate = 0;
unsigned long SystemInfo::loopCount = 0;
float SystemInfo::cpuLoad = 0;

unsigned long SystemInfo::getUptime() {
    return millis() / 1000UL;  // Convert to seconds
}

unsigned long SystemInfo::getFreeMemory() {
    extern int __heap_start, *__brkval;
    int v;
    return (unsigned long) &v - (__brkval == 0 ? (unsigned long) &__heap_start : (unsigned long) __brkval);
}

float SystemInfo::getCPULoad() {
    return cpuLoad;
}

void SystemInfo::update() {
    loopCount++;
    unsigned long now = millis();
    
    if (now - lastUpdate >= UPDATE_INTERVAL) {
        // Calculate CPU load based on loop count
        cpuLoad = (float)loopCount / (UPDATE_INTERVAL / 1000.0f);
        loopCount = 0;
        lastUpdate = now;
    }
}

void SystemInfo::resetStats() {
    loopCount = 0;
    cpuLoad = 0;
    lastUpdate = millis();
}