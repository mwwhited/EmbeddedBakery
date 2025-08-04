#include <LedControl.h>

const int DEVICE_COUNT = 4;

// DIN = 11, CLK = 13, CS = 10
LedControl lc = LedControl(11, 13, 10, DEVICE_COUNT);

void setup() {
  for (int t = 0 ; t < DEVICE_COUNT; t++) {
    lc.shutdown(t, false);   // Turn on the display
    lc.setIntensity(t, 8);   // Set brightness
    lc.clearDisplay(t);      // Start with clear display  
  }
}

void loop() {
  // Row by row, column by column
  for (int row = 0; row < 8; row++) {
    for (int col = 0; col < 8; col++) {
      for (int t = 0 ; t < DEVICE_COUNT; t++) {
        lc.setLed(t, row, col, true);  // Turn on LED
      }
      delay(100);                     // Wait
      for (int t = 0 ; t < DEVICE_COUNT; t++) {
        lc.setLed(t, row, col, false); // Turn off LED
      }
    }
  }
}
