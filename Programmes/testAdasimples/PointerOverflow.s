.global main
.extern printf // Import printf
.section .data
format :
.string "%d\n"
erreur_division_msg :
.string "Erreur : division par zéro\n"

.section .text
main :

STP x29, lr, [sp, #-16] // Sauvegarde du pointeur de pile et du lien de retour
MOV x29, sp // Mise à jour du pointeur de pile
SUB sp, sp, #48 // Déplacement du stack pointer pour fp et lr

// Declaration de la variable a1
MOVZ x0, #1
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a2
MOVZ x0, #2
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a3
MOVZ x0, #3
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a4
MOVZ x0, #4
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a5
MOVZ x0, #5
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a6
MOVZ x0, #6
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a7
MOVZ x0, #7
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a8
MOVZ x0, #8
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a9
MOVZ x0, #9
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a10
MOVZ x0, #10
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a11
MOVZ x0, #11
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a12
MOVZ x0, #12
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a13
MOVZ x0, #13
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a14
MOVZ x0, #14
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a15
MOVZ x0, #15
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Instructions de la procédure pointeroverflow
// Printf
LDR x0, [x29, #-48] // On récupère la valeur de la variable a1
SUB sp, sp, #16 // a1 Mise en pile var
STR x0, [sp] // a1 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
LDR x0, [x29, #-64] // On récupère la valeur de la variable a2
SUB sp, sp, #16 // a2 Mise en pile var
STR x0, [sp] // a2 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
LDR x0, [x29, #-80] // On récupère la valeur de la variable a3
SUB sp, sp, #16 // a3 Mise en pile var
STR x0, [sp] // a3 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
LDR x0, [x29, #-96] // On récupère la valeur de la variable a4
SUB sp, sp, #16 // a4 Mise en pile var
STR x0, [sp] // a4 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
LDR x0, [x29, #-112] // On récupère la valeur de la variable a5
SUB sp, sp, #16 // a5 Mise en pile var
STR x0, [sp] // a5 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
LDR x0, [x29, #-128] // On récupère la valeur de la variable a6
SUB sp, sp, #16 // a6 Mise en pile var
STR x0, [sp] // a6 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
LDR x0, [x29, #-144] // On récupère la valeur de la variable a7
SUB sp, sp, #16 // a7 Mise en pile var
STR x0, [sp] // a7 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
LDR x0, [x29, #-160] // On récupère la valeur de la variable a8
SUB sp, sp, #16 // a8 Mise en pile var
STR x0, [sp] // a8 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
LDR x0, [x29, #-176] // On récupère la valeur de la variable a9
SUB sp, sp, #16 // a9 Mise en pile var
STR x0, [sp] // a9 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
LDR x0, [x29, #-192] // On récupère la valeur de la variable a10
SUB sp, sp, #16 // a10 Mise en pile var
STR x0, [sp] // a10 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
LDR x0, [x29, #-208] // On récupère la valeur de la variable a11
SUB sp, sp, #16 // a11 Mise en pile var
STR x0, [sp] // a11 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
LDR x0, [x29, #-224] // On récupère la valeur de la variable a12
SUB sp, sp, #16 // a12 Mise en pile var
STR x0, [sp] // a12 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
LDR x0, [x29, #-240] // On récupère la valeur de la variable a13
SUB sp, sp, #16 // a13 Mise en pile var
STR x0, [sp] // a13 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-0] // On récupère la valeur de la variable a14
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a14 Mise en pile var
STR x0, [sp] // a14 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-16] // On récupère la valeur de la variable a15
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a15 Mise en pile var
STR x0, [sp] // a15 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16


bl exit_program

exit_program : //Fonction de sortie du programme 
mov x0,#0
mov x8,#93
svc #0
ret


get_global_var : ADD x29, x29, #16 // On passe à la variable suivante, x0 depl, x1 nb_saut
SUBS x1, x1, #1 // On décrémente le nombre de saut
BNE get_global_var // On boucle tant que x1 != 0
LDR x0, [x29, x0] // On charge la valeur de la variable
SUB sp,sp, #16 // On fait de la place dans la pile pour le retour
STR x0, [sp] // On met la valeur de la variable en pile
RET

set_global_var : ADD x29, x29, #16 // On passe à la variable suivante, x0 depl, x1 nb_saut
SUBS x1, x1, #1 // On décrémente le nombre de saut
BNE set_global_var // On boucle tant que x1 != 0
STR x2, [x29, x0] // On charge la valeur de la variable
RET

erreur_division : // Fonction d'erreur de division
LDR x0, =erreur_division_msg // On charge le message d'erreur
BL printf // On affiche le message d'erreur
BL exit_program // On quitte le programme

