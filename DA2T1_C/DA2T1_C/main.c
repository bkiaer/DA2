/*
 * DA2T1_C.c
 *
 * Created: 3/7/2018 6:35:13 PM
 * Author : brian
 */ 

#include <avr/io.h>
#include <util/delay.h>

int main(void)
{
    DDRB = 0xFF; //set PB2 as an output
    while (1) 
    {
		PORTB ^= (1<< 2); //toggle PB2 
		_delay_ms(250); //delay for 500ms for a 50% DC 
    }
}

