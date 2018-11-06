.model tiny
.code
.startup
           Org 100h
           Jmp Short Start
Vector     Dw  2, 7, -1, 16, 15
N          Equ 5

Start:
           Xor  Bx, Bx
           Mov  Cx, N
S:
           Mov  Ax, Vector[Bx]   
           Add  Bx, 2
           Loop S

.exit 0
end