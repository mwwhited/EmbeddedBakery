int led = 13;

void setup()
{
	pinMode(led, OUTPUT);
  /* add setup code here */

}

void loop()
{
  /* add main program code here */
	digitalWrite(led, HIGH);
	delay(950);
	digitalWrite(led, LOW);
	delay(50);
}
