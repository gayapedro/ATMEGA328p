; interruptint0.asm
; Autor: Pedro Gaya (pedrogaya@gmail.com)
; github: gayapedro

.include "./m328Pdef.inc"
.org 0x00						
rjmp reset
.org INT0addr
rjmp INT0_vect
				 
reset:
	ldi r16, (1<<ISC01)|(1<<ISC00)	
	sts EICRA, r16					
	
	ldi r16, (1<<INT0)				
	out EIMSK, r16					

	ldi r16, (1<<INTF0)
	out EIFR, r16

	; Sets PORTB as output
	ser r16							
	out DDRB, r16					

	; Sets PORTD as input						
 	clr r17							
	out DDRD, r17

	; Resets r18 and PORTB
	clr r18
	out PORTB, r18

	; Global Enable Interrupt
	sei								

	; Main Loop
main:								
	rjmp main							

	; Interrupt Vector
INT0_vect:
	inc r18
	out PORTB, r18
	reti