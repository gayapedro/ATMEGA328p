; blink.asm
; Autor: Pedro Gaya (pedrogaya@gmail.com)
; github: gayapedro

.include "./m328Pdef.inc"
.equ LED = PD0
.ORG 0x00

inicio:
LDI r16,r10
STS UCSR0B,r16
LDI r16,0xFF
OUT DDRD,r16

main:
SBI PortD,LED
RCALL atraso
CBI PortD,LED
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