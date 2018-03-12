;
; DA2.asm
;
; Created: 2/26/2018 4:26:05 PM
; Author : Brian Kiaer
;

.org 0x0000 


START: 
	LDI R16, 0xFF; set output 2
	OUT DDRB, R16 ; set PB2 as an output 
TOP: 
	SBI PORTB, 2 ;set bit 2 immediate of port B
	RCALL delay_250ms
	CBI PORTB, 2 
	RCALL delay_250ms
	RJMP TOP

	delay_1ms: ; delay subroutine 
	push R16 
	LDI R16, 99 
delay_1ms1: 
	NOP //no operation to simulate a delay. 
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	DEC R16 //counter to decrement and loop to simulate a delay
	BRNE delay_1ms1 
	POP R16 
	RET

delay_250ms: 
	PUSH R16 
	LDI R16, 250 
delay_250ms1:
	RCALL delay_1ms
	DEC R16 
	BRNE delay_250ms1
	POP R16 
	RET
