.global F0
.extern printf // Import printf
.section .data

.section .text
unDebut:

bl exit

exit : //Fonction de sortie du programme 
mov x0,#0
mov x8,#93
svc #0
ret

aireRectangle :STP LR, X11, [SP, #-16]!
STP X10, XZR, [SP, #-16]!
SUB SP, SP, taille_locale
MOV x0, x0
ADD SP, SP, taille_locale
LDP X10, XZR, [SP], #16
LDP LR, X11, [SP], #16
RET

perimetreRectangle :STP LR, X11, [SP, #-16]!
STP X10, XZR, [SP, #-16]!
SUB SP, SP, taille_locale
MOV x0, x0
ADD SP, SP, taille_locale
LDP X10, XZR, [SP], #16
LDP LR, X11, [SP], #16
RET

