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
STR x29, [sp]
SUB sp, sp, #32 // Déplacement du stack pointer pour fp et lr

// Définitions de la procédure nombre
// Declaration de la variable a
SUB sp, sp, #16 // Allocation de 16 octets pour la variable a

// Declaration de la variable b
SUB sp, sp, #16 // Allocation de 16 octets pour la variable b

// Declaration de la variable c
SUB sp, sp, #16 // Allocation de 16 octets pour la variable c

// Instructions de la procédure nombre
MOVZ X0, #0
MOVK X0, #0x0000, LSL #16
MOVK X0, #0x0064, LSL #0
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-48] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

// Printf
LDR x0, [x29, #-48] // On récupère la valeur de la variable a
SUB sp, sp, #16 // a Mise en pile var
STR x0, [sp] // a Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

MOVZ X0, #0
MOVK X0, #0x0000, LSL #16
MOVK X0, #0x03E8, LSL #0
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-48] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

// Printf
LDR x0, [x29, #-48] // On récupère la valeur de la variable a
SUB sp, sp, #16 // a Mise en pile var
STR x0, [sp] // a Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

MOVZ X0, #0
MOVK X0, #0x0000, LSL #16
MOVK X0, #0x2710, LSL #0
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-48] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

// Printf
LDR x0, [x29, #-48] // On récupère la valeur de la variable a
SUB sp, sp, #16 // a Mise en pile var
STR x0, [sp] // a Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

MOVZ X0, #0
MOVK X0, #0x0000, LSL #16
MOVK X0, #0x86A0, LSL #0
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-48] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

// Printf
LDR x0, [x29, #-48] // On récupère la valeur de la variable a
SUB sp, sp, #16 // a Mise en pile var
STR x0, [sp] // a Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

MOVZ X0, #0
MOVK X0, #0x0000, LSL #16
MOVK X0, #0x4240, LSL #0
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-48] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

// Printf
LDR x0, [x29, #-48] // On récupère la valeur de la variable a
SUB sp, sp, #16 // a Mise en pile var
STR x0, [sp] // a Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

MOVZ X0, #0
MOVK X0, #0x0000, LSL #16
MOVK X0, #0x9680, LSL #0
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-48] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

// Printf
LDR x0, [x29, #-48] // On récupère la valeur de la variable a
SUB sp, sp, #16 // a Mise en pile var
STR x0, [sp] // a Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

MOVZ X0, #0
MOVK X0, #0x0000, LSL #16
MOVK X0, #0xE100, LSL #0
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-48] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

// Printf
LDR x0, [x29, #-48] // On récupère la valeur de la variable a
SUB sp, sp, #16 // a Mise en pile var
STR x0, [sp] // a Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

MOVZ X0, #0
MOVK X0, #0x0000, LSL #16
MOVK X0, #0xCA00, LSL #0
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-48] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

// Printf
LDR x0, [x29, #-48] // On récupère la valeur de la variable a
SUB sp, sp, #16 // a Mise en pile var
STR x0, [sp] // a Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

MOVZ X0, #0
MOVK X0, #0x0000, LSL #16
MOVK X0, #0x0001, LSL #0
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x0, [sp] // Opération moins
NEG x0, x0 // Opération moins
STR x0, [sp] // Opération moins
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-64] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

// Printf
LDR x0, [x29, #-64] // On récupère la valeur de la variable b
SUB sp, sp, #16 // b Mise en pile var
STR x0, [sp] // b Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

MOVZ X0, #0
MOVK X0, #0x0000, LSL #16
MOVK X0, #0x000A, LSL #0
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x0, [sp] // Opération moins
NEG x0, x0 // Opération moins
STR x0, [sp] // Opération moins
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-64] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

// Printf
LDR x0, [x29, #-64] // On récupère la valeur de la variable b
SUB sp, sp, #16 // b Mise en pile var
STR x0, [sp] // b Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

MOVZ X0, #0
MOVK X0, #0x0000, LSL #16
MOVK X0, #0x0064, LSL #0
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x0, [sp] // Opération moins
NEG x0, x0 // Opération moins
STR x0, [sp] // Opération moins
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-64] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

// Printf
LDR x0, [x29, #-64] // On récupère la valeur de la variable b
SUB sp, sp, #16 // b Mise en pile var
STR x0, [sp] // b Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

MOVZ X0, #0
MOVK X0, #0x0000, LSL #16
MOVK X0, #0x03E8, LSL #0
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x0, [sp] // Opération moins
NEG x0, x0 // Opération moins
STR x0, [sp] // Opération moins
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-64] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

// Printf
LDR x0, [x29, #-64] // On récupère la valeur de la variable b
SUB sp, sp, #16 // b Mise en pile var
STR x0, [sp] // b Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

MOVZ X0, #0
MOVK X0, #0x0000, LSL #16
MOVK X0, #0x2710, LSL #0
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x0, [sp] // Opération moins
NEG x0, x0 // Opération moins
STR x0, [sp] // Opération moins
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-64] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

// Printf
LDR x0, [x29, #-64] // On récupère la valeur de la variable b
SUB sp, sp, #16 // b Mise en pile var
STR x0, [sp] // b Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

MOVZ X0, #0
MOVK X0, #0x0000, LSL #16
MOVK X0, #0x86A0, LSL #0
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x0, [sp] // Opération moins
NEG x0, x0 // Opération moins
STR x0, [sp] // Opération moins
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-64] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

// Printf
LDR x0, [x29, #-64] // On récupère la valeur de la variable b
SUB sp, sp, #16 // b Mise en pile var
STR x0, [sp] // b Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

MOVZ X0, #0
MOVK X0, #0x0000, LSL #16
MOVK X0, #0x4240, LSL #0
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x0, [sp] // Opération moins
NEG x0, x0 // Opération moins
STR x0, [sp] // Opération moins
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-64] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

// Printf
LDR x0, [x29, #-64] // On récupère la valeur de la variable b
SUB sp, sp, #16 // b Mise en pile var
STR x0, [sp] // b Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

MOVZ X0, #0
MOVK X0, #0x0000, LSL #16
MOVK X0, #0x9680, LSL #0
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x0, [sp] // Opération moins
NEG x0, x0 // Opération moins
STR x0, [sp] // Opération moins
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-64] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

// Printf
LDR x0, [x29, #-64] // On récupère la valeur de la variable b
SUB sp, sp, #16 // b Mise en pile var
STR x0, [sp] // b Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

MOVZ X0, #0
MOVK X0, #0x0000, LSL #16
MOVK X0, #0xE100, LSL #0
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x0, [sp] // Opération moins
NEG x0, x0 // Opération moins
STR x0, [sp] // Opération moins
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-64] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

// Printf
LDR x0, [x29, #-64] // On récupère la valeur de la variable b
SUB sp, sp, #16 // b Mise en pile var
STR x0, [sp] // b Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16


B exit_program

exit_program : //Fonction de sortie du programme 
mov x0,#0
mov x8,#93
svc #0
ret

get_global_var : LDR x28, [x28] // On saute de chainage statique, x0 depl, x1 nb_saut
SUBS x1, x1, #1 // On décrémente le nombre de saut
BNE get_global_var // On boucle tant que x1 != 0
SUB x28, x28, x0 // On déplace le pointeur de la variable
LDR x0, [x28] // On charge la valeur de la variable
SUB sp,sp, #16 // On fait de la place dans la pile pour le retour
STR x0, [sp] // On met la valeur de la variable en pile
RET

set_global_var : LDR x28, [x28] // On saute de chainage statique, x0 depl, x1 nb_saut
SUBS x1, x1, #1 // On décrémente le nombre de saut
BNE set_global_var // On boucle tant que x1 != 0
SUB x28, x28, x0 // On déplace le pointeur de la variable
STR x2, [x28] // On charge la valeur de la variable
RET

erreur_division : // Fonction d'erreur de division
LDR x0, =erreur_division_msg // On charge le message d'erreur
BL printf // On affiche le message d'erreur
B exit_program // On quitte le programme

