.global main
.extern printf // Import printf
.section .data
format :
.string "%d\n"

.section .text
main :

STP x29, lr, [sp, #-16]! // Sauvegarde du pointeur de pile et du lien de retour
MOV x29, sp // Mise à jour du pointeur de pile

// Declaration de la variable a
SUB sp, sp, #16 // Allocation de 8 octets pour la variable a

// Declaration de la variable b
SUB sp, sp, #16 // Allocation de 8 octets pour la variable b

// Declaration de la variable c
SUB sp, sp, #16 // Allocation de 8 octets pour la variable c

// Instructions de la procédure rem1
MOVZ x0, #2
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x2, [sp] // On met la valeur de la variable droite dans x0 
STR x2, [x29, #-24] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 


// Opération
MOVZ x0, #54
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
MOVZ x0, #10
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
SDIV x0, x0, x1 // Opération rem
MUL x0, x0, x1 // Opération rem
SUB x0, x0, x1 // Opération rem
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x2, [sp] // On met la valeur de la variable droite dans x0 
STR x2, [x29, #-24] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

// Printf
LDR x0, [x29, #-24] // a Mise en pile var
SUB sp, sp, #16 // a Mise en pile var
STR x0, [sp] // a Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16


// Opération
LDR x0, [x29, #-24] // a Mise en pile var
SUB sp, sp, #16 // a Mise en pile var
STR x0, [sp] // a Mise en pile var
MOVZ x0, #3
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
SDIV x0, x0, x1 // Opération rem
MUL x0, x0, x1 // Opération rem
SUB x0, x0, x1 // Opération rem
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x2, [sp] // On met la valeur de la variable droite dans x0 
STR x2, [x29, #-32] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

// Printf
LDR x0, [x29, #-32] // b Mise en pile var
SUB sp, sp, #16 // b Mise en pile var
STR x0, [sp] // b Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16


// Opération
LDR x0, [x29, #-32] // b Mise en pile var
SUB sp, sp, #16 // b Mise en pile var
STR x0, [sp] // b Mise en pile var
MOVZ x0, #54
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
SDIV x0, x0, x1 // Opération rem
MUL x0, x0, x1 // Opération rem
SUB x0, x0, x1 // Opération rem
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x2, [sp] // On met la valeur de la variable droite dans x0 
STR x2, [x29, #-40] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

// Printf
LDR x0, [x29, #-40] // c Mise en pile var
SUB sp, sp, #16 // c Mise en pile var
STR x0, [sp] // c Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

MOVZ x0, #60283
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x2, [sp] // On met la valeur de la variable droite dans x0 
STR x2, [x29, #-24] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

MOVZ x0, #82
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x2, [sp] // On met la valeur de la variable droite dans x0 
STR x2, [x29, #-32] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 


// Opération
LDR x0, [x29, #-24] // a Mise en pile var
SUB sp, sp, #16 // a Mise en pile var
STR x0, [sp] // a Mise en pile var
LDR x0, [x29, #-32] // b Mise en pile var
SUB sp, sp, #16 // b Mise en pile var
STR x0, [sp] // b Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
SDIV x0, x0, x1 // Opération rem
MUL x0, x0, x1 // Opération rem
SUB x0, x0, x1 // Opération rem
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x2, [sp] // On met la valeur de la variable droite dans x0 
STR x2, [x29, #-40] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

// Printf
LDR x0, [x29, #-40] // c Mise en pile var
SUB sp, sp, #16 // c Mise en pile var
STR x0, [sp] // c Mise en pile var
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

