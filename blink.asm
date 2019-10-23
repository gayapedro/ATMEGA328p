; blink.asm
; Autor: Pedro Gaya (pedrogaya@gmail.com)
; github: gayapedro

.include "./m328Pdef.inc"
.equ LED = PB5
.ORG 0x0000

inicio:
LDI r16,0xFF
OUT DDRB,r16

main:
SBI PortB,LED
RCALL atraso
CBI PortB,LED
RCALL atraso
RJMP main

atraso:
LDI r19,32

delay:
DEC r17
BRNE delay
DEC r18
BRNE delay
DEC r19
BRNE delay
RET