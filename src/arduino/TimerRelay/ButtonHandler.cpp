#include "ButtonHandler.h"
#include "ButtonFeedback.h"

ButtonHandler::ButtonHandler(Menu& m) : menu(m), lastDebounceTime(0) {}

void ButtonHandler::begin() {
    pinMode(MENU_BUTTON_PIN, INPUT_PULLUP);
    pinMode(UP_BUTTON_PIN, INPUT_PULLUP);
    pinMode(DOWN_BUTTON_PIN, INPUT_PULLUP);
    pinMode(BACK_BUTTON_PIN, INPUT_PULLUP);
    ButtonFeedback::initialize();
}

bool ButtonHandler::readButton(uint8_t pin) {
    unsigned long now = millis();
    if ((now - lastDebounceTime) > debounceDelay) {
        if (digitalRead(pin) == LOW) {
            lastDebounceTime = now;
            ButtonFeedback::flash();
            return true;
        }
    }
    return false;
}

void ButtonHandler::checkButtons() {
    ButtonFeedback::update();
    
    if (readButton(MENU_BUTTON_PIN)) {
        if (!menu.isActive()) {
            menu.handleAction(ENTER_MENU);
        } else {
            menu.handleAction(SELECT_ITEM);
        }
    }
    
    if (menu.isActive()) {
        if (readButton(UP_BUTTON_PIN)) {
            menu.handleAction(PREV_ITEM);
        }
        if (readButton(DOWN_BUTTON_PIN)) {
            menu.handleAction(NEXT_ITEM);
        }
        if (readButton(BACK_BUTTON_PIN)) {
            menu.handleAction(EXIT_MENU);
        }
    }
}