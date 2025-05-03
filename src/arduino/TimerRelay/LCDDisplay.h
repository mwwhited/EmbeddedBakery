#ifndef LCD_DISPLAY_H
#define LCD_DISPLAY_H

#include "Display.h"
#include <LiquidCrystal.h>

class LCDDisplay : public Display {
public:
    LCDDisplay(uint8_t rs, uint8_t en, uint8_t d4, uint8_t d5, uint8_t d6, uint8_t d7);
    virtual void initialize() override;
    virtual void clear() override;
    virtual void showRelayStatus(const Relay &relay) override;
    virtual void showSystemStatus() override;
    virtual void showMessage(const char* line1, const char* line2 = nullptr) override;

private:
    LiquidCrystal lcd;
    void printCentered(const char* text, uint8_t row);
};

#endif // LCD_DISPLAY_H