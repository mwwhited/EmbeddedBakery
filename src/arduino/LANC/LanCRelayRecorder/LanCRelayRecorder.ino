#include "lanc.h"

Lanc lanc;
unsigned long _last;
bool _recording = false;
bool _trying = false;

#define deviceName "RECORDER"
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
  byte currentStatus = _recording ? 0x4 : 0x14;
  
  if (_last < millis()){
    writeMessage(currentStatus);
    _last =  millis() + period;
  } 
 
  lanc.send(0x00, 0x00, 0x0, 0x0, _recording ? 0x4 : 0x14, 0xB0, 0x1, 0x80);  delay(17);

  readSerialData();
}

void readSerialData() {  
  int readSize = Serial.available();
  if (readSize > 0) {
    byte readBuffer[readSize];
    int read = Serial.readBytes(readBuffer, readSize);
    for (int i = read; i > 0 ; i--){
      byte cmd = readBuffer[i];
      if (cmd == 0x52 /*R*/ || cmd == 0x72 /*r*/) {
            _recording = true;
        return;
        } else if (cmd == 0x53 /*S*/ || cmd == 0x73 /*s*/) {
        _recording = false;
        return;
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
