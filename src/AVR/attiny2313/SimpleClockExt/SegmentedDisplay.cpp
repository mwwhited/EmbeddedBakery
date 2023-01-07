#include "SegmentedDisplay.h"

static char SegmentedDisplay::DigitTo7Segment(int input) {

/* 
      _A_
     |   |
   F |   | B
     |_G_|
     |   |
   E |   | C
     |_D_|
         .Dp
*/

  switch (input) {
    //               0b_ABCDEFG
    case   0: return 0b01111110; // 0
    case   1: return 0b00110000; // 1
    case   2: return 0b01101101; // 2
    case   3: return 0b01111001; // 3
    case   4: return 0b00110011; // 4
    case   5: return 0b01011011; // 5
    case   6: return 0b01011111; // 6
    case   7: return 0b01110000; // 7
    case   8: return 0b01111111; // 8
    case   9: return 0b01111011; // 9
    case 0xa: return 0b01110111; // A 
    case 0xb: return 0b00011111; // b
    case 0xc: return 0b00001101; // c
    case 0xd: return 0b00111101; // d
    case 0xe: return 0b01001111; // E
    case 0xf: return 0b01000111; // F
    default:  return 0b10000000; // ERROR / Unknown
  }
}