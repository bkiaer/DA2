;
; DA2T3_AVR.asm
;
; Created: 3/8/2018 9:40:09 AM
; Author : brian
;

.org 0 

	LDI R17, 0x03
	LDI R20, 0xFF	;set all pins on portb as an output
	OUT DDRB, R20  ;set Port B to output 
	SBI PORTB, 0x00 ;have led initially off
	LDI R18, 0b00001101
	STS TCCR0B, R18 ;set prescaler to 1024

	LDI R19, ( 1<< COM0A0) 
	STS TCCR0A, R19

	LDI R20, 0x00
	STS TCNT0, R20 
	LDI R20, 243
	STS OCR0A, R20

	
LOOP: 

	IN R20, TIFR0
	ANDI R20, 0b00000010
	CPI R20,2
	BRNE LOOP
	LDI R16,0xFF
	EOR R17,R16
	OUT PORTB,R17
	IN R20, TIFR1
	ORI R20,2
	OUT TIFR1,R20
	RJMP LOOP