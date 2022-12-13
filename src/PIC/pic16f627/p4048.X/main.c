/*
 * File:   main.c
 * Author: Matthew Whited
 *
 * Created on December 8, 2022, 4:25 PM
 */

/*
 * LD1 = Pin6  (INT/RB0)
 * LD2 = Pin7  (RB1)
 * LD3 = Pin8  (RB2)
 * LD4 = Pin9  (RB3)
 * LD5 = Pin10 (RB4) // https://electronics.stackexchange.com/questions/644328/proteus-pic16f628a-rb4-not-working
 * LD6 = Pin11 (RB5)
 * 
 * SW1 = Pin17 (RA0)
 * SW2 = Pin18 (RA1)
 * SW3 = Pin1  (RA2)
 * SW4 = Pin2  (RA3)
 * 
 */

#include <stdio.h>
#include <stdlib.h>

#define _XTAL_FREQ 4000000

// CONFIG
#pragma config FOSC = HS        // Oscillator Selection bits (HS oscillator: High-speed crystal/resonator on RA6/OSC2/CLKOUT and RA7/OSC1/CLKIN)
#pragma config WDTE = OFF       // Watchdog Timer Enable bit (WDT disabled)
#pragma config PWRTE = OFF      // Power-up Timer Enable bit (PWRT disabled)
#pragma config MCLRE = ON       // RA5/MCLR pin function select (RA5/MCLR pin function is MCLR)
#pragma config BOREN = ON       // Brown-out Reset Enable bit (BOD Reset enabled)
#pragma config LVP = OFF        // Low-Voltage Programming Enable bit (RB4/PGM pin has PGM function, low-voltage programming enabled)
#pragma config CPD = OFF        // Data Code Protection bit (Data memory code protection off)
#pragma config CP = OFF         // Code Protection bits (Program memory code protection off)

// #pragma config statements should precede project file includes.
// Use project enums instead of #define for ON and OFF.

#include <xc.h>

void main(void) {
    
    CMCON = 0x0F; //enable input mask
    
    TRISA = 1; //set port a as inputs
    TRISB = 0; //set port b as outputs
    
    //TRISB = 0x00;
    
    char x=0x01;
    char dir = 0x0;
    char z = 0;
    
    PORTB = 0x01;
    while (1){ 
        
        z = PORTA;
        if (z !=0) {
            x = z;
        }
        
        if (dir == 0){
            x = x << 1;        
        } else {
            x = x >> 1;        
        }
        
        if (x > 0x3F)
        {
            x = 0x20;        
            dir = 1;
        } else if (dir == 1 && x == 0) {
            x=1;
            dir = 0;
        }
        PORTB = x;
        __delay_ms(250);
        
        //PORTB = PORTA;
        //__delay_ms(1000);
       
        /*
        PORTB = 0xff;
        __delay_ms(1000);
        PORTB = 0x00;
        __delay_ms(1000);
        */
        /*
        //RA0=1;
        RB0=0;
        //RA0=0;
        RB0=1;
        __delay_ms(1000);
        */
    };
}
