#ifndef SYSTEM_INFO_H
#define SYSTEM_INFO_H

#include <Arduino.h>

class SystemInfo {
public:
    static unsigned long getUptime();
    static unsigned long getFreeMemory();
    static float getCPULoad();
    static void update();
    static void resetStats();

private:
    static unsigned long lastUpdate;
    static unsigned long loopCount;
    static float cpuLoad;
    static const unsigned long UPDATE_INTERVAL = 1000;  // Update stats every second
};

#endif // SYSTEM_INFO_H