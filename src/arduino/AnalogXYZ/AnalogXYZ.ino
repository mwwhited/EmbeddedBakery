const int xPin = 3;
const int yPin = 5;
const int zPin = 6;

const float frequency = 1; // Frequency of the wave
const int amplitude = 127;   // Amplitude (max value is 127 for 8-bit PWM)
const int offset = 127;      // Offset to center the wave (127 for 8-bit PWM)
const int resolution = 900;  // Number of steps in the wave
const int delayMs = 0;      // Delay between each step (controls speed)

void setup() {
  pinMode(xPin, OUTPUT);
  pinMode(yPin, OUTPUT);
  pinMode(zPin, OUTPUT);
}

int zp=0 ;

void loop() {
  zp+=7;
  for (int i = 0; i < resolution; i+=11) {
    // Calculate the angle in radians for the current step
    float angle = 2.0 * PI * frequency * (i / (float)resolution);

    // Generate X and Y values using sine and cosine
    int xValue =(int)((double)offset + (double)amplitude * sin(angle));
    int yValue = (double)offset + (double)amplitude * cos(angle);
    int zValue = (zp+i)%255-127;

    analogWrite(xPin, xValue);
    analogWrite(yPin, yValue);
    analogWrite(zPin, zValue);

    // Small delay to control the speed of the wave
    //delay(delayMs);
  }
}
