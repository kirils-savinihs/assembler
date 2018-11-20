;13.var atrast videjo aritmetisko visiem para (pec vertibas) elementiem katra matricas stabina

.model tiny
.code
.startup
        Org     100h
        Jmp Short Start
TROW		Equ 	2
TCLMN 		Equ	3

CLMN		Equ	2
ROW		Equ	6

Matrix		DW	8, 2, 4   
		DW	4, 4, 10   
CLMN_AVGS	DB	TCLMN Dup (?)

S	Equ	Type Matrix

;int[] clmn_sums = new int[TCLMN]
;
;for (int CLMN=0;i<TCLMN;i++)
;{
;	for (int ROW=0; y<TROW; y++)	
;	{
;		if (array[i][y] % 2=0)
;			clmn_sum+=array[i][y]
;
;	}
;	clmn_sums[CLMN]=clmn_sum
;}

Start:
	lea	di,	Word Ptr CLMN_AVGS
	mov	cx,	Word Ptr TCLMN
	xor	bx,	bx
	xor	si,	si
	xor	bp,	bp

outer_loop:
	push	cx				;Save what iteration outer loop is at
	xor	ax,	ax			;Clear Ax (Used for sum)
	xor	bx,	bx			;Clear Bx (Counts rows)
	mov	cx,	Word Ptr TROW			;Set number of iterations for inner loop
	xor	bp,	bp
inner_loop:
	mov	dx,	Matrix[bx][si]
	test	dx,	1
	jnz	odd				;If odd then skip
	add	ax,	dx
	inc	bp
odd:
	add	bx,	 Word Ptr ROW			;Increment Bx
	loop	inner_loop
	
	mov	bx,	bp
	div	bl				;Divide Ax by Bl
	mov	[di],	al		;Result is stored in Al, remainder in Dl
	inc	di
	add	si,	 Word Ptr CLMN
	pop	cx
	loop	outer_loop

.exit 0
end