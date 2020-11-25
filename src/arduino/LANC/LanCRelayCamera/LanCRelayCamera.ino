#include "lanc.h"

Lanc lanc;
unsigned long _last;
bool _recording = false;
bool _trying = false;

#define deviceName "CAMREA"
#define lancPin 11
#define direction 2
#define period 200

void setup() {
  // put your setup code here, to run once:
  Serial.begin(57600);
  lanc.init(lancPin, 0);
   
  pinMode(direction, OUTPUT);
  sendMessage(deviceName);
  Serial.println(deviceName);
}

void loop() {
  byte currentStatus = lanc.LANC_Frame[4];
  
  if (_trying) {
    _trying = false;
    if (currentStatus == 0x00) {
        for(int i = 0; i < 5 ; i++){
            lanc.update(0x18, 0x2A); //Mode Toggle
        }
    } else {       
      if (currentStatus == 0x04 /*recording*/ && !_recording) {
          for(int i = 0; i < 5 ; i++){
              lanc.update(0x18, 0x33); //Toggle
          }
      }
      if (currentStatus != 0x04 && _recording) {
        for(int i = 0; i < 5 ; i++){
          lanc.update(0x18, 0x3a); //Force record
        }
      } 
    }
  }
    
  if (_last < millis()) {
    writeMessage(lanc.LANC_Frame[4]);
    lanc.update();
    _last =  millis() + period;
  } 
  
  readSerialData();
}

void readSerialData() {  
  int readSize = Serial.available();
  if (readSize > 0) {
    byte readBuffer[readSize];
    int read = Serial.readBytes(readBuffer, readSize);
    if (!_trying) {
      for (int i = read; i > 0 ; i--){
        byte cmd = readBuffer[i];
        if (cmd == 0x52 /*R*/ || cmd == 0x72 /*r*/) {
          if (!_recording) {
            _recording = true;
            _trying = true;
          }
          return;
        } else if (cmd == 0x53 /*S*/ || cmd == 0x73 /*s*/) {
          if (_recording) {
            _recording = false;
            _trying = true;
          }
          return;
        }
      }
    }
  }
}

void writeMessage(byte statusCode) {
  if (statusCode == 0x00) {
    sendMessage("P");
  } else if (statusCode == 0x04) {
    sendMessage("R");
  } else if (statusCode == 0x14) {
    sendMessage("S");
  } else {
    sendMessage("U");
  }
}

void sendMessage(String message){
  digitalWrite(direction, HIGH);
  Serial.println(message);
  delay(5);
  digitalWrite(direction, LOW);
}
