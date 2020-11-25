/*
  Arduino LANC Library
  by Eddie Groshev
  Copyright (C) 2012

  My code is heavily based on Ariel Rocholl's code:
    http://micro.arocholl.com/index.php?view=article&id=19
  and Brady Marks' code:
    http://blog.furiousgreencloud.com/2008/08/arduino-speaks-to-lanc-devices-camera.html

  Pintout & list of LANC codes:
    http://www.boehmel.de/lanc.htm

  Feel free to share this source code, but include explicit mention to the author.
  Licensed under creative commons - see http://creativecommons.org/licenses/by-sa/3.0/

  https://raw.githubusercontent.com/EdsterG/LANC_Library/master/Lanc.cpp
  
  Modifications made by Matthew Whited @ 20190213
  	Updated to not lockup if no signal is detected
	Added the ability to generate lanc signals from scratch
*/

#include "Lanc.h"

#define bitWidth 104 //Default bit width (in micro seconds)
#define maxGap 416 // if there is more than 4 bits bit widths  between bytes abort read
//102  BAD for sony / good for canon,
//103 good for sony / good for canon,
//104 good for sony /  BAD for canon.

void Lanc::init(int lancPin, int debugPin){
  _lancPin=lancPin;
  _debugPin=debugPin; //Default value is NULL
  pinMode(_lancPin, INPUT); //Define pin mode for the lanc pin
  digitalWrite(_lancPin,HIGH); //Activate internal pullup resistor
  if (_debugPin) //Check if _debugPin is not NULL
    pinMode(_debugPin, OUTPUT); //Define pin mode for the debug pin
}

//------IMPORTANT, READ THIS IF YOU ARE HAVING TROUBLE------
//LANC requires the command to be repeated at least 5 times 
//before the camera can accept it. If you seem to have trouble
//with sending commands try adding a for loop which does this
//function at least 5 times.
//If that doesn't fix your problem, check your code and all
//the libraries that you are using, make sure there are no delays
//in your code. If there are, those delays could be messing up
//the time sensitive LANC protocol.
void Lanc::update(int type, int code){
  //Write the first 2 bytes
  _nextFrame();     //Find the beginning of the next frame
  _writeByte(type); //Send Sub-Command for Byte 1
  _nextByte();      //Find the beginning of the next byte
  _writeByte(code); //Send the actual Command-Code, Byte 1
  LANC_Frame[0]=type; //Store the written code type (This BYTE is reversed, significant bit was sent first, and the least significant bit was sent last)
  LANC_Frame[1]=code; //Store the written code (This BYTE is also reversed)

  //Read the last 6 remaining bytes
  for (int position = 2; position<8; position++){
    _nextByte();
    LANC_Frame[position]=_readByte();
  }
}

void Lanc::send(byte cmd0, byte cmd1, byte cmd2, byte cmd3, byte cmd4, byte cmd5, byte cmd6, byte cmd7) {  
  
  _writeByte2(cmd0);
  delayMicroseconds(bitWidth-10); 
  _writeByte2(cmd1);
  delayMicroseconds(bitWidth-10);  
  _writeByte2(cmd2);
  delayMicroseconds(bitWidth-10); 
  _writeByte2(cmd3);
  delayMicroseconds(bitWidth-10); 
  _writeByte2(cmd4);
  delayMicroseconds(bitWidth-10); 
  _writeByte2(cmd5);
  delayMicroseconds(bitWidth-10);  
  _writeByte2(cmd6);
  delayMicroseconds(bitWidth-10); 
  _writeByte2(cmd7);
  delayMicroseconds(bitWidth-10);  
}
void Lanc::_writeByte2(byte value){
  //Note: Bits are inverted in the LANC protocol
  //      GND(0v) = 1 and VCC(5v) = 0
  //Note that timming here is critical, Ariel Rocholl used a logic analyzer
  //to reverse engineering the right delay times. This guarantees closer to
  //LANC standard so it increases chances to work with any videocamera, but
  //you may need to fine tune these numbers for yours, hopefully not.
  pinMode(_lancPin, OUTPUT);
  digitalWrite(_lancPin,LOW);
  delayMicroseconds(bitWidth-20); //Ignore start bit
  for (int i = 0; i < 8; i++){
    boolean bit = value & 0x1;
    digitalWrite(_lancPin,!bit); //Remember, LANC bits are inverted
    value >>= 1;
    delayMicroseconds(bitWidth-10);
  }
  pinMode(_lancPin, INPUT);
  delayMicroseconds(bitWidth-10);
  digitalWrite(_lancPin,HIGH);
}

void Lanc::_nextFrame(){
  bool longEnough=false;
  int count;

  if (_debugPin)
    digitalWrite(_debugPin,HIGH);

  //Search for a 3ms gap (at least), being HIGH continuosly.
  //This worked extraordinarily well in PAL/NTSC Sony video cameras.
  //You may need to reduce the loop limit for your camera, hopefully not.

  while (!longEnough){
    for (count=0; count<100; count++){
      delayMicroseconds(25);
      if (digitalRead(_lancPin)==LOW)
        break;
    }
    if (count==100) { //Checks if total gap length greater than 2500 uS
      longEnough=true;
    }
  }

  //Now wait till we get the first start bit (low)
  while (digitalRead(_lancPin)==HIGH)
    delayMicroseconds(20);

  if (_debugPin)
    digitalWrite(_debugPin,LOW);
}

void Lanc::_nextByte(){
  if (_debugPin)
    digitalWrite(_debugPin,HIGH);

  //Now wait till we get the first start bit (low)
  while(1)
  {
    //Note: this can cause a lockup if the stream never goes low;
    unsigned long watchWidth = micros() + maxGap;
    //this will look for the first LOW signal with abou 5uS precission
    while (digitalRead(_lancPin)==HIGH) {
      if (watchWidth < micros()){
        return;
      }
      delayMicroseconds(1); 
    }

    //And this guarantees it was actually a LOW, to ignore glitches and noise
    delayMicroseconds(7);
    if (digitalRead(_lancPin)==LOW) 
      break;
  }
  if (_debugPin)
    digitalWrite(_debugPin,LOW);
}

void Lanc::_writeByte(byte value){
  //Note: Bits are inverted in the LANC protocol
  //      GND(0v) = 1 and VCC(5v) = 0
  //Note that timming here is critical, Ariel Rocholl used a logic analyzer
  //to reverse engineering the right delay times. This guarantees closer to
  //LANC standard so it increases chances to work with any videocamera, but
  //you may need to fine tune these numbers for yours, hopefully not.
  pinMode(_lancPin, OUTPUT);

  delayMicroseconds(bitWidth-20); //Ignore start bit
  for (int i = 0; i < 8; i++){
    boolean bit = value & 0x1;
    digitalWrite(_lancPin,!bit); //Remember, LANC bits are inverted
    value >>= 1;
    delayMicroseconds(bitWidth-10);
  }
  pinMode(_lancPin, INPUT);
  digitalWrite(_lancPin,HIGH);
}

byte Lanc::_readByte(){
  //Timming here is not as critical as when writing, actually it is a bit delayed
  //when compared to start edge of the signal, but this is good as it increases
  //chances to read in the center of the bit status, thus it is more immune to noise
  //Using this I didn't need any hardware filter such as RC bass filter.
  unsigned char nByte=0;

  delayMicroseconds(bitWidth*1.5); //ignore start bit
  for (int i = 0; i<8; i++){
    nByte|= digitalRead(_lancPin) << i;
    delayMicroseconds(bitWidth-10);
  }
  delayMicroseconds(bitWidth*0.6);

  nByte = nByte ^ 255;  //invert bits, we got LANC LOWs for logic HIGHs
  return nByte;
}

int Lanc::pin(){
  return _lancPin;
}
