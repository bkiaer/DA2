/*
 * DA2T5_C.c
 *
 * Created: 3/8/2018 10:02:06 PM
 * Author : brian
 */ 

#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#define F_CPU8000000UL

int main(void)
{
	DDRB = 1<<2; //PB2 as an output 
    PORTD = 1 << 2; //pull-up activated 
	EIMSK = (1 << INT0); //enable external interrupt 
	sei(); 
	
	
    while (1) 
    {
    }
}

ISR(INT0_vect)
{
	PORTB ^= ( 1 << 2);
	_delay_ms(1000);	
	PORTB ^= (1<< 2);
	EIFR |= (1 << INTF0);
}
