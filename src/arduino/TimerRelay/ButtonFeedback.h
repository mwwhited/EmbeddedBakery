#ifndef BUTTON_FEEDBACK_H
#define BUTTON_FEEDBACK_H

#include <Arduino.h>

class ButtonFeedback {
public:
    static void initialize();
    static void flash(uint8_t count = 1);
    static void update();
    
private:
    static const unsigned long FLASH_DURATION = 50;  // 50ms flash
    static unsigned long lastFlashTime;
    static uint8_t remainingFlashes;
    static bool ledState;
};