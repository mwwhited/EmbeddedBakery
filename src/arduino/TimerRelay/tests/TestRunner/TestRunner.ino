#include "../ArduinoUnitTests.h"
#include "../TestEEPROMManager.cpp"
#include "../TestRelayManager.cpp"
#include "../TestCommandHandler.cpp"
#include "../TestErrorHandler.cpp"
#include "../TestCircularBuffer.cpp"
#include "../TestCommandHistory.cpp"
#include "../TestSettings.cpp"
#include "../TestDisplay.cpp"
#include "../TestMenuSystem.cpp"
#include "../TestMenuItemManager.cpp"
#include "../TestButtonFeedback.cpp"
#include "../TestSystemInfo.cpp"
#include "../TestMenuIntegration.cpp"

void setup() {
  Serial.begin(9600);
  while (!Serial) { ; }  // Wait for serial port to connect
  
  Serial.println(F("Starting unit tests..."));
  
  RUN_TEST(TestEEPROMManager);
  RUN_TEST(TestRelayManager);
  RUN_TEST(TestCommandHandler);
  RUN_TEST(TestErrorHandler);
  RUN_TEST(TestCircularBuffer);
  RUN_TEST(TestCommandHistory);
  RUN_TEST(TestSettings);
  RUN_TEST(TestDisplay);
  RUN_TEST(TestMenuSystem);
  RUN_TEST(TestMenuItemManager);
  RUN_TEST(TestButtonFeedback);
  RUN_TEST(TestSystemInfo);
  RUN_TEST(TestMenuIntegration);
  
  Serial.println(F("All tests completed"));
}

void loop() {
  // Empty loop
}