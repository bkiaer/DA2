;
; DA2T5_AVR.asm
;
; Created: 3/12/2018 11:54:49 AM
; Author : Brian Kiaer
;

.org 0x00 
	JMP MAIN 
.org 0x02 
	JMP EX0_ISR
MAIN:
	SBI DDRB, 2 ; set as an output
	SBI PORTD, 2 ; pull-up activated
	
	LDI R20,  1 << INT0 ; enable external interrupt
	OUT  EIMSK, R20 

	SEI
HERE: 
	JMP HERE
EX0_ISR: 

	IN R16, PORTB 
	LDI R17, 0xFF;
	EOR R16, R17 ; XOR PORTB 
	OUT PORTB, R16 
	RCALL delay_250ms
	RCALL delay_250ms
	RCALL delay_250ms
	RCALL delay_250ms
	EOR R16, R17
	OUT PORTB, R16
	LDI R20, 1 << INTF0 ; clear flag
	OUT EIFR, R20
	RETI
	
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
