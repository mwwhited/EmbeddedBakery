/*
 * Created: 9/25/2011
 *  Author: Mwhited
 */ 

/* Include useful pre-defined functions */
#include <avr/interrupt.h>    // Defines pins, ports, etc to make programs easier to read
#define F_CPU 800000UL	      // Sets up the default speed for delay.h
#include <util/delay.h>
#include <util/twi.h>

#define POT 10000

void InitADC()
{
	ADMUX |= (1<<REFS0);
	ADCSRA |= (1<<ADPS2)|(1<<ADPS1)|(1<<ADPS0)|(1<<ADEN);
}

uint16_t ReadADC(uint8_t ADCchannel)
{ 
	//select ADC channel with safety mask 
	ADMUX = (ADMUX & 0xF0) | (ADCchannel & 0x0F); 
	//single conversion mode 
	ADCSRA |= (1<<ADSC); 
	// wait until ADC conversion is complete 
	while( ADCSRA & (1<<ADSC) ); 
	return ADC;
}

int main()
{
	uint16_t potval;

	PORTB = (1<< PB0)|(1<<PB1)|(1<<PB2);
	DDRB  = (1<<DDB0)|(1<<DDB1)|(1<<DDB2);
	
	InitADC();
		
	while(1)
	{
		//reading potentiometer value and recalculating to Ohms 
		potval=ReadADC(0);

		PORTB = potval/128;
/*
		if (potval > 256)
			PORTB |= (1<<PB0);
		if (potval > 512)
			PORTB |= (1<<PB1);
*/
/*	
		PORTB |= _BV(PB0);// | _BV(PB1); 
		_delay_ms(500);

		PORTB &= ~_BV(PB0);// | ~_BV(PB1);	
	   _delay_ms(500);

		PORTB |= _BV(PB1);// | _BV(PB1); 
		_delay_ms(500);

		PORTB &= ~_BV(PB1);// | ~_BV(PB1);	
	   _delay_ms(500);
 */ 

	}

	return(0);
}
