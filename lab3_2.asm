;1.var atrast minimalu elementu
;bazes adresesana

.model tiny
.code
.startup
		Org 100h
		jmp Short Start
vector		Dw	2, 7, -1, 16, 15
N		Equ	5

Start:
		lea	bx,	vector
		mov	cx,	N
		mov	dx,	[bx]

S:
		mov	ax,	[bx]		
		cmp	dx,	ax		
		jle	Short	cont		;if ax >= minimum (dx)
		mov	dx,	ax		;set dx to new minimum

cont:
		add	bx,	2		;i++
		loop S
.exit 0
end