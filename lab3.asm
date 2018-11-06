;1.var atrast minimalu elementu

.model tiny
.code
.startup
		Org 100h
		jmp Short Start
vector		Dw	1, 2, 3, 4, 5
N			Equ	5

Start:
		xor	bx,	bx
		mov	cx,	N
		mov	dx,	[vector]
S:
		mov	ax,	[vector+bx]		;
		cmp	ax,	dx		
		jnb	Short	cont	;if ax >= minimum (dx)
		mov	dx,	ax				;set dx to new minimum

cont:
		add	bx,	2				;i++
		loop S
		mov	ax,	ax

.exit 0
end