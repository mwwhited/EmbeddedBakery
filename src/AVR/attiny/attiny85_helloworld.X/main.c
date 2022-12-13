/*
 * File:   main.c
 * Author: mwwhi
 *
 * Created on December 10, 2022, 2:01 PM
 */


#include <stdio.h>
#include <stdlib.h>

#include <avr/io.h>

FUSES = {
	.low = 0x60, // LOW {SUT_CKSEL=EXTCLK_6CK_14CK_65MS, CKOUT=CLEAR, CKDIV8=SET}
	.high = 0xDF, // HIGH {BODLEVEL=DISABLED, EESAVE=CLEAR, WDTON=CLEAR, SPIEN=SET, DWEN=CLEAR, RSTDISBL=CLEAR}
	.extended = 0xFF, // EXTENDED {SELFPRGEN=CLEAR}
};

LOCKBITS = 0xFF; // {LB=NO_LOCK}


#include <xc.h>

int main(void) {
    while (1){
        //__delay_ms(250);        
    };
    return 0;
}
