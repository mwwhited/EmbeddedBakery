/*
http://www.circuitbasics.com/arduino-ir-remote-receiver-tutorial/
https://www.adafruit.com/product/157
https://learn.sparkfun.com/tutorials/ir-control-kit-hookup-guide/all
*/

#include <IRremote.h>

unsigned long codes[] = {
  0x0,
  0x1FEA05F,
  0x1FEE01F,
  0x1FE10EF,
  0x1FE906F,
  0x1FED827,
  0x0,
  0xFFFFFFFF
};

const int RECV_PIN = 11;
IRsend irsend;

void setup() {
	Serial.begin(9600);
  Serial.println("HDMI");

  pinMode(2, INPUT);
  pinMode(4, INPUT);
  pinMode(5, INPUT);
  pinMode(6, INPUT);
  pinMode(7, INPUT);
}

byte _lastRead = 0;
unsigned long _nextPoll = 0;
#define POLLING_PERIOD 1000

String GetInput(byte input){
  switch(input & B11110100){
    case B00000100: return "HDMI1";
    case B00010000: return "HDMI2";
    case B00100000: return "HDMI3";
    case B01000000: return "HDMI4";
    case B10000000: return "HDMI5";
  }
}

void Notify() {
  byte readD = PIND & B11110100;
  if (_lastRead != readD) {
    Serial.print(GetInput(readD));
    Serial.println(";");
    _lastRead = readD;
  }
}

byte ReadSerial() {
  int bufferLen = Serial.available();
  byte readBuffer[bufferLen];
  int readLen = Serial.readBytes(readBuffer, bufferLen);
  return readBuffer[readLen-1] & 0x0f;
}

void SendIrRequest(unsigned long code) {
  if (code && code != REPEAT) {
    irsend.sendNEC(code, 32);
  }
}

void PollInputs(){
  if (_nextPoll < millis()){
    _nextPoll = millis() + POLLING_PERIOD;
    Notify();
  }
}

void loop() {
  PollInputs();
	if (Serial.available() > 0) {
		byte incomingByte = ReadSerial();
    unsigned long code = codes[incomingByte % 8];
		SendIrRequest(code);
    byte input = PIND;
    String port = GetInput(input);
    Serial.print(port);
    Serial.print(";");
    Serial.print(incomingByte, HEX);
    Serial.print(";");
    Serial.print(code, HEX);
    Serial.print(";");
    Serial.print(input, HEX);
    Serial.println(";");
	}
}
