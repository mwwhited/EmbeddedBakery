/*
LANC SNIFFER
Version 1.0
Finds out LANC commands from a REMOTE
For the interface ciruit see 
Feel free to use this code in any way you want.
2011, Martin Koch

"LANC" is a registered trademark of SONY.
CANON calls their LANC compatible port "REMOTE".

Modified by Matthew Whited to return camera status messages
*/

#define lancPin 11
#define recordPin 2

#define ULONG unsigned long long
#define cmdPinON (PORTD = B10000000)   // Set digtal pin 7 (PD7)
#define cmdPinOFF (PORTD = B00000000)  // Reset digtal pin 7 (PD7)
#define ledON (PORTB = B00100000)      // Set LED pin 13 (PB5)
#define ledOFF (PORTB = B00000000)     // Reset LED pin 13 (PB5)
#define lancPinREAD (PINB & B00001000) // Reads pin 11 (PB3)

int bitDuration = 104; //Duration of one LANC bit in microseconds. 
int lancBit[16 * 4];
unsigned short commandMessage = 0;
unsigned short lastMessage = 0;
unsigned long lastResponse = 0;

void setup() {
  DDRD = DDRD | B10000000;    // Config cmdPin as output
  DDRB = DDRB & B11110111;    // Config lancPin as input
  DDRB = DDRB | B00100000;    // Config ledPin as output
  pinMode(lancPin, INPUT);    // Listens to the LANC line, used for pulseIn function 
  cmdPinOFF;                  // Reset LANC control pin so that the LANC line is unaffected(HIGH)

  Serial.begin(57600); //open the serial port
  pinMode(lancPin, INPUT); //listens to the LANC line
  Serial.println("Waiting!");
  delay(5000); //Wait for camera to power up completly
  Serial.println("Go!");
  bitDuration = bitDuration - 8; //Reading the digital port takes about 8 microseconds so only 96 microseconds are left for each bit

  pinMode(recordPin, INPUT);
}

void loop() {
  if (!commandMessage && !digitalRead(recordPin)){
    int cmdBits[] = {0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0};
    commandMessage = 0x1833;
    toBits(commandMessage, cmdBits, 0);        
    sendLanc(4, cmdBits, lancBit);   
    commandMessage = 0x0;
  }
  ledON;
  readLancCommand();
  ledOFF;
  delay(250);
}

void readLancCommand() {

  if (commandMessage){
    toBits(commandMessage, lancBit, 0);
  }
     
  while (pulseIn(lancPin, HIGH) < 5000) {   
    //"pulseIn, HIGH" catches any 0V TO +5V TRANSITION and waits until the LANC line goes back to 0V 
    //"pulseIn" also returns the pulse duration so we can check if the previous +5V duration was long enough (>5ms) to be the pause before a new 8 byte data packet
    //Loop till pulse duration is >5ms
  }

  for (int b = 0; b < 8; b++){
    //LOW after long pause means the START bit is here
    delayMicroseconds(bitDuration);  //wait START bit duration   
    
    if (commandMessage && b < 2) {
         
      //Read the 8 bits
      //Note that the command bits come in in reverse order with the least significant, right-most bit (bit 0) first
      for (int i=7; i>-1; i--) {
        if (lancBit[i | (b << 3)])
        {
          cmdPinON;
        }
        else {
          cmdPinOFF;
        }
        delayMicroseconds(bitDuration/2); //wait until the middle of bit 0
        lancBit[i | (b << 3)] = digitalRead(lancPin);  //read bits. 
        delayMicroseconds(bitDuration/2); //wait until the middle of bit 0
      }
      cmdPinOFF;
      //Byte 0 is read  
      //delayMicroseconds(bitDuration/2); //wait until the middle of bit 0 
      delayMicroseconds(10); //make sure to be in the stop bit before   
      while (lancPinREAD) { 
        //Loop as long as the LANC line is +5V during the stop bit
      } 
      
      /*
      //Write the 8 bits
      for (int i=7; i>-1; i--) {
        if (lancBit[i | (b << 3)]) {
          cmdPinOFF;
        }  else {
          cmdPinON;
        }
        delayMicroseconds(bitDuration/2); //wait until the middle of bit 0   
        lancBit[i | (b << 3)] = lancPinREAD;  //read bits. 
        delayMicroseconds(bitDuration/2); //wait until the middle of bit 0   
      }  
      */
    } else { 
      delayMicroseconds(bitDuration/2); //wait until the middle of bit 0    
      //Read the 8 bits
      //Note that the command bits come in in reverse order with the least significant, right-most bit (bit 0) first
      for (int i=7; i>-1; i--) {
        //delayMicroseconds(bitDuration/2); //wait until the middle of bit 0
        lancBit[i | (b << 3)] = digitalRead(lancPin);  //read bits. 
        delayMicroseconds(bitDuration); //wait until the middle of bit 0
      }
      //Byte 0 is read  
      delayMicroseconds(10); //make sure to be in the stop bit before   
      while (lancPinREAD) { 
        //Loop as long as the LANC line is +5V during the stop bit
      } 
    }       
  }
 
  unsigned short message = toByte(lancBit,0) << 8 | toByte(lancBit,1);
  unsigned long response = 
    (ULONG)(toByte(lancBit,2)) << 40| 
    (ULONG)(toByte(lancBit,3)) << 32| 
    (ULONG)(toByte(lancBit,4)) << 24|
    (ULONG)(toByte(lancBit,5)) << 16| 
    (ULONG)(toByte(lancBit,6)) << 8 | 
    (ULONG)(toByte(lancBit,7)) << 0;    
    
  //if (lastMessage != message || lastResponse != response || 1) {    
    //Byte 1 is read
    //Print byte 0 and byte 1 to the Serial Monitor console of the Arduino developing environment
    Serial.print("*");
    Serial.print(message, HEX); 
    Serial.print("*");
    Serial.print(response & 0x00ffffff, HEX); 
    Serial.print("*");
    Serial.print(commandMessage, HEX);
    Serial.println("");
    //commandMessage = 0;
  //}
  lastMessage = message;
  lastResponse = response;
}

byte toByte(int bits[], int offset)
{
  int realOffset = offset << 3;
  const int check = 1;
  byte bools = (byte)(
    ((bits[realOffset + 0] == check ? 0 : 1) << 7) |
    ((bits[realOffset + 1] == check ? 0 : 1) << 6) |
    ((bits[realOffset + 2] == check ? 0 : 1) << 5) |
    ((bits[realOffset + 3] == check ? 0 : 1) << 4) |
    ((bits[realOffset + 4] == check ? 0 : 1) << 3) |
    ((bits[realOffset + 5] == check ? 0 : 1) << 2) |
    ((bits[realOffset + 6] == check ? 0 : 1) << 1) |
    ((bits[realOffset + 7] == check ? 0 : 1) << 0)
  );
  return bools;
}

#define outMap ? 1 : 0
void toBits(unsigned short message, int* bits, int offset)
{
  bits[offset +  0] = ((message & 0x8000) == 0x8000) outMap;
  bits[offset +  1] = ((message & 0x4000) == 0x4000) outMap;
  bits[offset +  2] = ((message & 0x2000) == 0x2000) outMap;
  bits[offset +  3] = ((message & 0x1000) == 0x1000) outMap;
  bits[offset +  4] = ((message & 0x0800) == 0x0800) outMap;
  bits[offset +  5] = ((message & 0x0400) == 0x0400) outMap;
  bits[offset +  6] = ((message & 0x0200) == 0x0200) outMap;
  bits[offset +  7] = ((message & 0x0100) == 0x0100) outMap;

  bits[offset +  8] = ((message & 0x0080) == 0x0080) outMap;
  bits[offset +  9] = ((message & 0x0040) == 0x0040) outMap;
  bits[offset + 10] = ((message & 0x0020) == 0x0020) outMap;
  bits[offset + 11] = ((message & 0x0010) == 0x0010) outMap;
  bits[offset + 12] = ((message & 0x0008) == 0x0008) outMap;
  bits[offset + 13] = ((message & 0x0004) == 0x0004) outMap;
  bits[offset + 14] = ((message & 0x0002) == 0x0002) outMap;
  bits[offset + 15] = ((message & 0x0001) == 0x0001) outMap;
}


void sendLanc(byte repeats, int* lancCmd, int* lancMessage) {
  // This function is time critical and optimized for Arduino Pro Mini
  // It takes ~3.2us for the arduino to set a pin state with the digitalWrite command
  // It takes ~80ns for the arduino to set pin state using the direct register method
  // delayMicroseconds(50) ~ 49us, delayMicroseconds(100) ~ 99us
  
  int i = 0;
  int bytenr = 0;
  
  while (pulseIn(lancPin, HIGH) < 5000) {   
    // Sync to next LANC message
    // "pulseIn, HIGH" catches any 0V TO +5V TRANSITION and waits until the LANC line goes back to 0V 
    // "pulseIn" also returns the pulse duration so we can check if the previous +5V duration was long enough (>5ms) to be the pause before a new 8 byte data packet
  }

  for (int r = 0; r < repeats; repeats--){ 
    i = 0;
    bytenr = 0;
    
    ledON;                                       // LANC message LED indicator on
    
    for ( ; bytenr<8 ; bytenr++) {
      delayMicroseconds(bitDuration-7);              // LOW after long pause means the START bit of Byte 0 is here, wait START bit duration
      for ( ; i<(8*(bytenr+1)) ; i++) {
        if (bytenr<2) {
          if (lancCmd[i]) {                      // During the first two bytes the adapter controls the line and puts out data
            cmdPinON;                            
          }
          else {
            cmdPinOFF;
          }
        }
        delayMicroseconds(bitDuration/2);
        lancMessage[i] = !lancPinREAD;           // Read data line during middle of bit
        delayMicroseconds(bitDuration/2); 
      }
      cmdPinOFF;
      if (bytenr == 7) {
        ledOFF;
      }
      delayMicroseconds(bitDuration/2);            // Make sure to be in the stop bit before waiting for next byte
      while (lancPinREAD) {                      // Loop as long as the LANC line is +5V during the stop bit or between messages
      }
    }
  }                     
}
