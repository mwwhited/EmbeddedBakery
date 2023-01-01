
int red_led = 9;
int green_led = 10;
int blue_led = 11;

int isRGB_switch = 7;

int delay_time = 1;
int step = 5;

int h_pot = A0;
int s_pot = A1;
int v_pot = A2;

int deadZone = 0;
int debug = 1;

struct ColorRgb {
  uint8_t red;
  uint8_t green;
  uint8_t blue;
};

double potMax = 0x3fa;
int downsample = 0;
int downsampleRGB = 2;

#define abs(x) ((x)>0?(x):-(x))

ColorRgb fromHsv(int h, int s, int v){

  if (h > potMax) h = potMax; 
  if (s > potMax) s = potMax; 
  if (v > potMax) v = potMax; 

  double hDegree = (h / potMax) * 359.99;
  double sPercent = s / potMax;
  double vPercent = v / potMax;

  double c = vPercent * sPercent;
  double hPrime = hDegree / 60.0;

  double hMod = hPrime;
  while(hMod > 2.0) hMod /= 2.0;

  double x = c * (1 - abs(hMod - 1.0));
  double m = vPercent - c;

  ColorRgb result;

  if (debug){
    Serial.print(" hDegree=");
    Serial.print(hDegree);
    Serial.print("  sPercent=");
    Serial.print(sPercent);
    Serial.print("  vPercent=");
    Serial.print(vPercent);
    
    Serial.print(" c=");
    Serial.print(c);
    Serial.print(" hPrime=");
    Serial.print(hPrime);
    Serial.print(" hMod=");
    Serial.print(hMod);
    Serial.print(" x=");
    Serial.print(x);
    Serial.print(" m=");
    Serial.print(m);
  }

  double cm = c+m;
  double xm = x+m;

       if (0.0 <= hPrime && hPrime < 1.0) result = {(byte)(cm *255),(byte)(xm *255),(byte)(m *255)};
  else if (1.0 <= hPrime && hPrime < 2.0) result = {(byte)(xm *255),(byte)(cm *255),(byte)(m *255)};
  
  else if (2.0 <= hPrime && hPrime < 3.0) result = {(byte)(m *255),(byte)(cm *255),(byte)(xm *255)};
  else if (3.0 <= hPrime && hPrime < 4.0) result = {(byte)(m *255),(byte)(xm *255),(byte)(cm *255)};
    
  else if (4.0 <= hPrime && hPrime < 5.0) result = {(byte)(xm *255),(byte)(m *255),(byte)(cm *255)};
  else if (5.0 <= hPrime && hPrime < 6.0) result = {(byte)(cm *255),(byte)(m *255),(byte)(xm *255)};

  else result = {m,m,m};

  return result;
}

// the setup function runs once when you press reset or power the board
void setup() {
  // initialize digital pin LED_BUILTIN as an output.

  pinMode(red_led, OUTPUT);
  pinMode(green_led, OUTPUT);
  pinMode(blue_led, OUTPUT);
  
  pinMode(isRGB_switch, INPUT);

  if (debug){
    Serial.begin(9600);
  }
}


// the loop function runs over and over again forever
void loop() {

  int isRGB = digitalRead(isRGB_switch);

  int h = analogRead(h_pot);
  int s = analogRead(s_pot);
  int v = analogRead(v_pot);
  
  if (debug){
    Serial.print(" isRGB ");
    Serial.print(isRGB, HEX);

    Serial.print(" AIN ");
    Serial.print(h, HEX);
    Serial.print(" ");
    Serial.print(s, HEX);
    Serial.print(" ");
    Serial.print(v, HEX);  
  }


  if (isRGB){
    if (deadZone == 0) {
      h = h >> downsample;
      s = s >> downsample;
      v = v >> downsample;
    }
    else {
      if (h < deadZone) h = 0;
      if (s < deadZone) s = 0;
      if (v < deadZone) v = 0;
    }
  } else {
    Serial.print(" XXX ");
    h = h >> downsampleRGB;
    s = s >> downsampleRGB;
    v = v >> downsampleRGB;
  }

  ColorRgb rgb;
  
  if (!isRGB)
    rgb = {h,s,v};
  else 
    rgb = fromHsv(h,s,v);
  
  analogWrite(red_led,255 - rgb.red);
  analogWrite(green_led, 255 - rgb.green);
  analogWrite(blue_led,255 -  rgb.blue);
  
  if (debug){
    Serial.print(" HSV ");
    Serial.print(h, HEX);
    Serial.print(" ");
    Serial.print(s, HEX);
    Serial.print(" ");
    Serial.print(v, HEX);  

    Serial.print(" RGB ");
    Serial.print(rgb.red, HEX);
    Serial.print(" ");
    Serial.print(rgb.green, HEX);
    Serial.print(" ");
    Serial.print(rgb.blue, HEX);
    Serial.println("");

    delay(100);
    }

}
