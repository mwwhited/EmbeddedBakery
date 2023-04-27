#include <Arduino.h>

class MatrixKeypad {
public:
  MatrixKeypad(
    int rows[],
    int cols[],
    char map[]) {
    rows = keypad_rows;
    cols = keypad_cols;
    map = keypad_map;
    keypad_row_count = sizeof(rows) / sizeof(int);
    keypad_col_count = sizeof(cols) / sizeof(int);
    keypad_map_count = sizeof(map) / sizeof(char);
  }
  void init();
  long readScan();

private:
  int scanIndex = 0;
  int keypad_row_count;
  int keypad_col_count;
  int keypad_map_count;
  int keypad_cols[];
  int keypad_rows[];
  char keypad_map[];
};

void
MatrixKeypad::init() {
  for (int i = 0; i < keypad_row_count; i++) {
    pinMode(keypad_rows[i], INPUT_PULLUP);
  }

  for (int i = 0; i < keypad_col_count; i++) {
    pinMode(keypad_cols[i], OUTPUT);
  }
}

long MatrixKeypad::readScan() {
  //TODO: incerment scan
  //TODO: read inputs
  //TODO: if invalid or more press return 0
  return 0;
}

// void setup() {

//   for (int i = 0; i < 4; i++) {
//     pinMode(cols[i], OUTPUT);
//   }

//   for (int i = 0; i < 12; i++) {
//     pinMode(rows[i], INPUT_PULLUP);
//   }
// }

// long last[] = { 0xFFF, 0xFFF, 0xFFF, 0xFFF };
// long colIndex = 0;

// void loop() {
//   // put your main code here, to run repeatedly:

//   colIndex = setColumn(colIndex);
//   long read = readRow();
//   if (read != last[colIndex]) {
//     last[colIndex] = read;
//     int ret = simpler(colIndex, read);

// #ifdef DEBUG
//     Serial.print("b");
//     Serial.print(ret, BIN);
//     // Serial.print(" o");
//     // Serial.print(ret, OCT);
//     // Serial.print(" h");
//     // Serial.print(ret, HEX);
//     Serial.print(" d");
//     Serial.print(ret);
//     Serial.print(" a");
//     Serial.print(keyMap[ret & 0x7f]);

//     Serial.println();
// #endif

//     if (ret) {
//       if (keyMap[ret & 0x7f] == '\\') {
//         lcd.home();
//         Serial.println();
//       } else {
//         char key = keyMap[ret & 0x7f];
//         Serial.print(key);
//         lcd.print(key);
//         // Keyboard.press(key);
//       }
//     }
//   }
// }

// /*
// 10KKCCRR

// MM  -> Keypad
// CCC -> Column
// RRR -> Row
// */
// int simpler(int colVal, long rowVal) {
//   for (int i = 0; i < 3; i++) {
//     int n = nibble(rowVal >> (4 * i));
//     if (n) {
//       long ret = 0b10000000;
//       ret |= (n & 0b0011);
//       ret |= (colVal << 2);
//       ret |= ((long)i) << 4;
//       return ret;
//     }
//   }

//   return 0;
// }

// /*
// KKCCCRRR

// MM  -> Keypad
// CCC -> Column
// RRR -> Row
// */
// int simple(int colVal, long rowVal) {
//   for (int i = 0; i < 3; i++) {
//     int n = nibble(rowVal >> (4 * i));
//     if (n) {
//       long ret = 0;
//       ret |= (n);
//       ret |= (colVal << 3);
//       ret |= ((long)i) << 6;
//       return ret;
//     }
//   }

//   return 0;
// }

// int nibble(int val) {
//   switch (val & 0x0f) {
//     case 0b1110: return 0b0100;
//     case 0b1101: return 0b0101;
//     case 0b1011: return 0b0110;
//     case 0b0111: return 0b0111;
//     default: return 0b0000;
//   }
// }

// int setColumn(int colVal) {
//   for (int i = 0; i < 4; i++) {
//     digitalWrite(cols[i], colVal == i ? 0 : 1);
//   }
//   return (colVal + 1) % 4;
// }

// long readRow() {
//   long outValue = 0;
//   for (int i = 0; i < 12; i++) {
//     outValue |= (digitalRead(rows[i]) << i);
//   }
//   return outValue;
// }