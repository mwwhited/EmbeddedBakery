/*
see readme for pin outs
*/

int cols[] = { 12,11,10,9 };
int rows[] = { 7,6,5,4, 3,2,A5,A4, A3,A2,A1,A0 };

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);

  for(int i = 0; i < 4; i++){
    pinMode(cols[i], OUTPUT);
  }

  for(int i = 0; i < 12; i++){
    pinMode(rows[i], INPUT_PULLUP);
  }
}

long last[]={0xFFF,0xFFF,0xFFF,0xFFF};
long colIndex = 0;

void loop() {
  // put your main code here, to run repeatedly:

  colIndex = setColumn(colIndex);
  long read = readRow();
  if (read != last[colIndex]) {
    last[colIndex] = read;
    int ret = simple(colIndex, read);

    //Serial.print(colIndex, HEX);    
    // Serial.print(" - ");
    // Serial.print(last[0], HEX);
    // Serial.print(" ");
    // Serial.print(last[1], HEX);
    // Serial.print(" ");
    // Serial.print(last[2], HEX);
    // Serial.print(" ");
    // Serial.print(last[3], HEX);    
    //Serial.print(" - "
    Serial.print("b");
    Serial.print(ret, BIN);
    Serial.print(" o");
    Serial.print(ret, OCT);
    Serial.print(" h");
    Serial.print(ret, HEX);
    Serial.print(" d");
    Serial.print(ret);

    Serial.println();
  }
}

/*
KKCCCRRR

MM  -> Keypad
CCC -> Column
RRR -> Row
*/
int simple(int colVal, long rowVal){
  for(int i = 0; i < 3; i++){
    int n = nibble(rowVal >> (4 * i));
    if (n){
      long ret = 0;
      ret |= (n);
      ret |= (colVal << 3);
      ret |= ((long)i)<<6;
      return ret;
    }
  }

  return 0;
}

int nibble(int val) {
  switch (val & 0x0f){
    case 0b1110: return 0b0100;
    case 0b1101: return 0b0101;
    case 0b1011: return 0b0110;
    case 0b0111: return 0b0111;
    default:     return 0b0000;
  }
}

int setColumn(int colVal){  
  for(int i = 0; i < 4; i++){
    digitalWrite(cols[i], colVal == i ? 0 : 1);
  }
  return (colVal + 1) % 4;
}

long readRow(){  
  long outValue = 0;
  for(int i = 0; i < 12; i++){
    outValue |= (digitalRead(rows[i]) << i);
  }
  return outValue;
}
