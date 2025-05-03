#ifndef BUTTON_HANDLER_H
#define BUTTON_HANDLER_H

#include "Menu.h"
#include <Arduino.h>

class ButtonHandler {
public:
    ButtonHandler(Menu& menu);
    void begin();
    void checkButtons();
    
private:
    static const uint8_t MENU_BUTTON_PIN = A6;    // Menu/Enter
    static const uint8_t UP_BUTTON_PIN = A7;      // Up/Previous
    static const uint8_t DOWN_BUTTON_PIN = A8;    // Down/Next
    static const uint8_t BACK_BUTTON_PIN = A9;    // Back/Exit
    
    Menu& menu;
    unsigned long lastDebounceTime;
    static const unsigned long debounceDelay = 50;
    
    bool readButton(uint8_t pin);
};

#endif // BUTTON_HANDLER_H