/*
 * Created: 9/19/2011 9:57:43 PM
 *  Author: Mwhited
 */ 

/* Include useful pre-defined functions */
#include <avr/interrupt.h>    // Defines pins, ports, etc to make programs easier to read
#define F_CPU 800000UL	      // Sets up the default speed for delay.h
#include <util/delay.h>

int main(){

	PORTB = (1<< PB0)|(1<<PB1);
	DDRB  = (1<<DDB0)|(1<<DDB1);
	
	while(1){
	
    PORTB |= _BV(PB0);// | _BV(PB1); 
    _delay_ms(500);

    PORTB &= ~_BV(PB0);// | ~_BV(PB1);	
   _delay_ms(500);

    PORTB |= _BV(PB1);// | _BV(PB1); 
    _delay_ms(500);

    PORTB &= ~_BV(PB1);// | ~_BV(PB1);	
   _delay_ms(500);
   

	}

	return(0);
}
