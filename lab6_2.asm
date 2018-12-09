print		Macro _TCLMN, _Vector
		local print

	push	cx
	push	bx
	push	ax

	xor	bx,	bx
	xor	ax,	ax
	mov	cx,	_TCLMN
	lea	di,	_Vector
print:
	mov	al,	[di+bx]
	inc	bx
	loop	print

	pop	ax
	pop	bx
	pop	cx
	EndM