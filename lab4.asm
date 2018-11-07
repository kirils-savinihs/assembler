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

Matrix		DW	1, 2, 3   
		DW	4, 5, 6   
CLMN_SUMS	DW	TCLMN Dup (?)

S	Equ	Type Matrix

;int[] clmn_sums = new int[TCLMN]
;
;for (int CLMN=0;i<TCLMN;i++)
;{
;	int clmn_sum=0
;	for (int ROW=0; y<TROW; y++)	
;	{
;		if (array[i][y] % 2=0)
;			clmn_sum+=array[i][y]
;
;	}
;	clmn_sums[CLMN]=clmn_sum
;}

Start:
	xor	bx,	bx
	mov	cx,	TROW
	lea	di,	CLMN_SUMS


for_clmns:
	xor	ax,	ax
	push	cx
	jmp	for_rows


for_rows:
	add	ax,	Matrix[][]
	


.exit 0
end