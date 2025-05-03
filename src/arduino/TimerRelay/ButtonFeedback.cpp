#include "ButtonFeedback.h"

unsigned long ButtonFeedback::lastFlashTime = 0;
uint8_t ButtonFeedback::remainingFlashes = 0;
bool ButtonFeedback::ledState = false;

void ButtonFeedback::initialize() {
    pinMode(LED_BUILTIN, OUTPUT);
    digitalWrite(LED_BUILTIN, LOW);
}

void ButtonFeedback::flash(uint8_t count) {
    remainingFlashes = count * 2;  // Each flash needs on and off state
    lastFlashTime = millis();
    ledState = true;
    digitalWrite(LED_BUILTIN, HIGH);
}

void ButtonFeedback::update() {
    if (remainingFlashes > 0) {
        unsigned long now = millis();
        if (now - lastFlashTime >= FLASH_DURATION) {
            ledState = !ledState;
            digitalWrite(LED_BUILTIN, ledState ? HIGH : LOW);
            lastFlashTime = now;
            remainingFlashes--;
        }
    }
}