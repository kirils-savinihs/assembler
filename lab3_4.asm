;1.var atrast minimalu elementu
;Bāzes-indeksa adresēšana 

.model tiny
.code
.startup
		Org 100h
		jmp Short Start
vector		Dw	2, 7, -1, 16, 15
N		Equ	5

Start:
		xor	bx,	bx
		xor	si,	si
		mov	cx,	N
		mov	dx,	vector[bx][si]

S:
		mov	ax,	vector[bx][si]	
		cmp	dx,	ax		
		jle	Short	cont		;if ax >= minimum (dx)
		mov	dx,	ax		;set dx to new minimum

cont:
		inc	si
		inc	bx		;i++
		loop S
.exit 0
end