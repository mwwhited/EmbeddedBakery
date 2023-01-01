// Robo India Tutorial 
// Digital Input and Output on LED 
// Hardware: NodeMCU

void setup() {
  Serial.begin(115200);                  
  Serial.print("Hello World\r\n");  
}

int x = 0;

void loop() {
  Serial.printf("x=%i\r\n", x++);  
  delay(1000);
 }
