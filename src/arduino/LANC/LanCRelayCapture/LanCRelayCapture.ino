#include "lanc.h"

Lanc lanc;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(57600);
  lanc.init(11, 0);
  
  Serial.println("started");
  delay(100);
}

unsigned long long lastMessage = 0;

void loop() {  
  if (Serial.available()> 1) {
    byte command[2];
    Serial.readBytes(command, 2);
/*
    Serial.print("#");
    Serial.print(command[0], HEX);
    Serial.println(command[1], HEX);
    */
    for(int i = 0; i < 5 ; i++) {
      lanc.update(command[0],command[1]);
    }
  }
  else {
    lanc.update();
  }

  unsigned long long message = 
    (unsigned long long)lanc.LANC_Frame[0] << 56 | 
    (unsigned long long)lanc.LANC_Frame[1] << 48 | 
    (unsigned long long)lanc.LANC_Frame[2] << 40 | 
    (unsigned long long)lanc.LANC_Frame[3] << 32 | 
    (unsigned long long)lanc.LANC_Frame[4] << 24 | 
    (unsigned long long)lanc.LANC_Frame[5] << 16 | 
    (unsigned long long)lanc.LANC_Frame[6] <<  8 | 
    (unsigned long long)lanc.LANC_Frame[7] <<  0 ;
 
  if (message != lastMessage){
    /*
    Serial.print(">");
    Serial.print(lanc.LANC_Frame[0], HEX);
    Serial.print("-");
    Serial.print(lanc.LANC_Frame[1], HEX);
    Serial.print("*");
    */
    Serial.print(lanc.LANC_Frame[2], HEX);
    Serial.print("-");
    Serial.print(lanc.LANC_Frame[3], HEX);
    Serial.print("-");
    Serial.print(lanc.LANC_Frame[4], HEX);
    Serial.print("-");
    Serial.print(lanc.LANC_Frame[5], HEX);
    Serial.print("-");
    Serial.print(lanc.LANC_Frame[6], HEX);
    Serial.print("-");
    Serial.print(lanc.LANC_Frame[7], HEX);
    Serial.print("-");
    Serial.print(millis());
    Serial.println("<");
  }
  lastMessage = message;
}
