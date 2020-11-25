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
  
  https://raw.githubusercontent.com/EdsterG/LANC_Library/master/Lanc.h
*/

#ifndef LANC_H
#define LANC_H 
#if (ARDUINO >= 100)
  #include <Arduino.h>
#else
  #include <WProgram.h>
#endif

class Lanc
{
  public:
    byte LANC_Frame[8];
    void init(int lancPin, int debugPin = NULL);
    void update(int type = 0x00, int code = 0x00);
    void send(byte cmd0, byte cmd1, byte cmd2, byte cmd3, byte cmd4, byte cmd5, byte cmd6, byte cmd7);
    int pin();
  private:
    int _lancPin;
    int _debugPin;
    void _nextFrame();
    void _nextByte();
    byte _readByte();
    void _writeByte(byte value);
    void _writeByte2(byte value);
};

#endif
