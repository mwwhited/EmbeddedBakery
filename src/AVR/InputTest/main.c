/*
 * Created: 9/19/2011 9:57:43 PM
 *  Author: Mwhited
 */ 

/* Include useful pre-defined functions */
#include <avr/interrupt.h>    // Defines pins, ports, etc to make programs easier to read
#define F_CPU 800000UL	      // Sets up the default speed for delay.h
#include <util/delay.h>

int main(){

	PORTB = 1<< PB0;
	DDRB  = 1<<DDB0;
	
	unsigned char i;
  
	
	while(1){
		i = PINB;
		PORTB = (i >> PB1) << PB0;
	}

	return(0);
}
