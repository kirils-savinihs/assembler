;1.var atrast minimalu elementu
;indeksa adresesana

.model tiny
.code
.startup
		Org 100h
		jmp Short Start
vector		Dw	2, 7, -1, 16, 15
N		Equ	5

Start:
		xor	bx,	bx
		mov	cx,	N
		mov	dx,	vector[bx]
S:
		mov	ax,	vector[bx]
		cmp	dx,	ax		
		jle	Short	cont		;if ax >= minimum (dx)
		mov	dx,	ax		;set dx to new minimum

cont:
		add	bx,	2		;i++
		loop S
.exit 0
end