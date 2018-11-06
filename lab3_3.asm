;1.var atrast minimalu elementu
;Indeksa adresēšana ar mērogošanu

.model tiny
.code
.startup
		Org 100h
		jmp Short Start
Vector		Label  Word
Array		Label  Word
		Dw	2, 7, -1, 16, 15
N		Equ	5
Step		Equ 2
.386
Start:
		xor	ebx,	ebx
		mov	cx,	N
		mov	dx,	Array[ebx*Step]

S:
		mov	ax,	Array[ebx*Step]
		cmp	dx,	ax		
		jle	Short	cont		;if ax >= minimum (dx)
		mov	dx,	ax		;set dx to new minimum

cont:
		inc	ebx	;i++
		loop S
.exit 0
end