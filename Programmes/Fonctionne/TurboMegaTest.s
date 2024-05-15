.global main
.extern printf // Import printf
.section .data
format_char :
.string "%c\n"
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

// Définitions de la procédure turbomegatest
// Declaration de la variable a
MOVZ x0, #1
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable b
MOVZ x0, #2
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable c
MOVZ x0, #3
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable d
SUB sp, sp, #16 // Allocation de 16 octets pour la variable d

// Declaration de la variable e
MOVZ x0, #5
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable f
SUB sp, sp, #16 // Allocation de 16 octets pour la variable f

// Declaration de la variable g
MOVZ x0, #1
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 











// Instructions de la procédure turbomegatest
MOVZ x0, #1
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-48] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 


// Opération

// Opération
LDR x0, [x29, #-48] // On récupère la valeur de la variable a
SUB sp, sp, #16 // a Mise en pile var
STR x0, [sp] // a Mise en pile var
MOVZ x0, #1
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOVZ x0, #1
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
SUB x0, x0, x1 // Opération -
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-64] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

MOVZ x0, #2
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-80] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 


// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération
MOVZ x0, #3
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOVZ x0, #3
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOVZ x0, #4
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOVZ x0, #5
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOVZ x0, #6
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOVZ x0, #7
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOVZ x0, #8
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOVZ x0, #9
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOVZ x0, #10
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-80] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 


// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération
LDR x0, [x29, #-80] // On récupère la valeur de la variable c
SUB sp, sp, #16 // c Mise en pile var
STR x0, [sp] // c Mise en pile var
LDR x0, [x29, #-80] // On récupère la valeur de la variable c
SUB sp, sp, #16 // c Mise en pile var
STR x0, [sp] // c Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x0, [x29, #-80] // On récupère la valeur de la variable c
SUB sp, sp, #16 // c Mise en pile var
STR x0, [sp] // c Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x0, [x29, #-80] // On récupère la valeur de la variable c
SUB sp, sp, #16 // c Mise en pile var
STR x0, [sp] // c Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x0, [x29, #-80] // On récupère la valeur de la variable c
SUB sp, sp, #16 // c Mise en pile var
STR x0, [sp] // c Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x0, [x29, #-80] // On récupère la valeur de la variable c
SUB sp, sp, #16 // c Mise en pile var
STR x0, [sp] // c Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x0, [x29, #-80] // On récupère la valeur de la variable c
SUB sp, sp, #16 // c Mise en pile var
STR x0, [sp] // c Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x0, [x29, #-80] // On récupère la valeur de la variable c
SUB sp, sp, #16 // c Mise en pile var
STR x0, [sp] // c Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x0, [x29, #-80] // On récupère la valeur de la variable c
SUB sp, sp, #16 // c Mise en pile var
STR x0, [sp] // c Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x0, [x29, #-80] // On récupère la valeur de la variable c
SUB sp, sp, #16 // c Mise en pile var
STR x0, [sp] // c Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-48] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 


// Opération
LDR x0, [x29, #-48] // On récupère la valeur de la variable a
SUB sp, sp, #16 // a Mise en pile var
STR x0, [sp] // a Mise en pile var
LDR x0, [x29, #-80] // On récupère la valeur de la variable c
SUB sp, sp, #16 // c Mise en pile var
STR x0, [sp] // c Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-96] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 


// Opération
LDR x0, [x29, #-80] // On récupère la valeur de la variable c
SUB sp, sp, #16 // c Mise en pile var
STR x0, [sp] // c Mise en pile var
LDR x0, [x29, #-48] // On récupère la valeur de la variable a
SUB sp, sp, #16 // a Mise en pile var
STR x0, [sp] // a Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-112] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

// Printf

// Opération
LDR x0, [x29, #-48] // On récupère la valeur de la variable a
SUB sp, sp, #16 // a Mise en pile var
STR x0, [sp] // a Mise en pile var
MOVZ x0, #550
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération =
CSET x0, EQ // Opération =
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf

// Opération
LDR x0, [x29, #-64] // On récupère la valeur de la variable b
SUB sp, sp, #16 // b Mise en pile var
STR x0, [sp] // b Mise en pile var
MOVZ x0, #1
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération =
CSET x0, EQ // Opération =
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf

// Opération
LDR x0, [x29, #-80] // On récupère la valeur de la variable c
SUB sp, sp, #16 // c Mise en pile var
STR x0, [sp] // c Mise en pile var
MOVZ x0, #55
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération =
CSET x0, EQ // Opération =
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf

// Opération
LDR x0, [x29, #-96] // On récupère la valeur de la variable d
SUB sp, sp, #16 // d Mise en pile var
STR x0, [sp] // d Mise en pile var
MOVZ x0, #605
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération =
CSET x0, EQ // Opération =
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf

// Opération
LDR x0, [x29, #-112] // On récupère la valeur de la variable e
SUB sp, sp, #16 // e Mise en pile var
STR x0, [sp] // e Mise en pile var
MOVZ x0, #605
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération =
CSET x0, EQ // Opération =
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

MOVZ x0, #2
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-48] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 


// Opération
LDR x0, [x29, #-48] // On récupère la valeur de la variable a
SUB sp, sp, #16 // a Mise en pile var
STR x0, [sp] // a Mise en pile var
MOVZ x0, #1
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x0, [sp] // Opération moins
NEG x0, x0 // Opération moins
STR x0, [sp] // Opération moins
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-48] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

MOVZ x0, #2
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-64] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 


// Opération
MOVZ x0, #1
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x0, [sp] // Opération moins
NEG x0, x0 // Opération moins
STR x0, [sp] // Opération moins
LDR x0, [x29, #-64] // On récupère la valeur de la variable b
SUB sp, sp, #16 // b Mise en pile var
STR x0, [sp] // b Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-64] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

// Printf

// Opération
LDR x0, [x29, #-48] // On récupère la valeur de la variable a
SUB sp, sp, #16 // a Mise en pile var
STR x0, [sp] // a Mise en pile var
MOVZ x0, #1
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération =
CSET x0, EQ // Opération =
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf

// Opération
LDR x0, [x29, #-64] // On récupère la valeur de la variable b
SUB sp, sp, #16 // b Mise en pile var
STR x0, [sp] // b Mise en pile var
MOVZ x0, #1
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération =
CSET x0, EQ // Opération =
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

MOVZ x0, #2457
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-48] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

MOVZ x0, #76
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-64] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 


// Opération
LDR x0, [x29, #-48] // On récupère la valeur de la variable a
SUB sp, sp, #16 // a Mise en pile var
STR x0, [sp] // a Mise en pile var
LDR x0, [x29, #-64] // On récupère la valeur de la variable b
SUB sp, sp, #16 // b Mise en pile var
STR x0, [sp] // b Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x1, #0 // Opération /, on vérifie que le diviseur n'est pas nul
BEQ erreur_division // Opération /, on arrête le programme si c'est le cas
SDIV x0, x0, x1 // Opération /
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-80] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 


// Opération

// Opération
MOVZ x0, #10930
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x0, [x29, #-64] // On récupère la valeur de la variable b
SUB sp, sp, #16 // b Mise en pile var
STR x0, [sp] // b Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x1, #0 // Opération /, on vérifie que le diviseur n'est pas nul
BEQ erreur_division // Opération /, on arrête le programme si c'est le cas
SDIV x0, x0, x1 // Opération /
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x0, [x29, #-80] // On récupère la valeur de la variable c
SUB sp, sp, #16 // c Mise en pile var
STR x0, [sp] // c Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x1, #0 // Opération /, on vérifie que le diviseur n'est pas nul
BEQ erreur_division // Opération /, on arrête le programme si c'est le cas
SDIV x0, x0, x1 // Opération /
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-96] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 


// Opération
MOVZ x0, #25
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-112] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

// Printf

// Opération
LDR x0, [x29, #-48] // On récupère la valeur de la variable a
SUB sp, sp, #16 // a Mise en pile var
STR x0, [sp] // a Mise en pile var
MOVZ x0, #2457
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération =
CSET x0, EQ // Opération =
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf

// Opération
LDR x0, [x29, #-64] // On récupère la valeur de la variable b
SUB sp, sp, #16 // b Mise en pile var
STR x0, [sp] // b Mise en pile var
MOVZ x0, #76
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération =
CSET x0, EQ // Opération =
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf

// Opération
LDR x0, [x29, #-80] // On récupère la valeur de la variable c
SUB sp, sp, #16 // c Mise en pile var
STR x0, [sp] // c Mise en pile var
MOVZ x0, #32
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération =
CSET x0, EQ // Opération =
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf

// Opération
LDR x0, [x29, #-96] // On récupère la valeur de la variable d
SUB sp, sp, #16 // d Mise en pile var
STR x0, [sp] // d Mise en pile var
MOVZ x0, #4
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération =
CSET x0, EQ // Opération =
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf

// Opération
LDR x0, [x29, #-112] // On récupère la valeur de la variable e
SUB sp, sp, #16 // e Mise en pile var
STR x0, [sp] // e Mise en pile var
MOVZ x0, #25
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération =
CSET x0, EQ // Opération =
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

MOVZ x0, #2
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-48] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

MOVZ x0, #3
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-64] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 


// Opération
LDR x0, [x29, #-48] // On récupère la valeur de la variable a
SUB sp, sp, #16 // a Mise en pile var
STR x0, [sp] // a Mise en pile var
LDR x0, [x29, #-64] // On récupère la valeur de la variable b
SUB sp, sp, #16 // b Mise en pile var
STR x0, [sp] // b Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
MUL x0, x0, x1 // Opération *
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-80] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 


// Opération
LDR x0, [x29, #-64] // On récupère la valeur de la variable b
SUB sp, sp, #16 // b Mise en pile var
STR x0, [sp] // b Mise en pile var
LDR x0, [x29, #-48] // On récupère la valeur de la variable a
SUB sp, sp, #16 // a Mise en pile var
STR x0, [sp] // a Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
MUL x0, x0, x1 // Opération *
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-96] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 


// Opération
LDR x0, [x29, #-48] // On récupère la valeur de la variable a
SUB sp, sp, #16 // a Mise en pile var
STR x0, [sp] // a Mise en pile var
MOVZ x0, #50
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
MUL x0, x0, x1 // Opération *
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-112] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

// Printf

// Opération
LDR x0, [x29, #-48] // On récupère la valeur de la variable a
SUB sp, sp, #16 // a Mise en pile var
STR x0, [sp] // a Mise en pile var
MOVZ x0, #2
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération =
CSET x0, EQ // Opération =
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf

// Opération
LDR x0, [x29, #-64] // On récupère la valeur de la variable b
SUB sp, sp, #16 // b Mise en pile var
STR x0, [sp] // b Mise en pile var
MOVZ x0, #3
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération =
CSET x0, EQ // Opération =
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf

// Opération
LDR x0, [x29, #-80] // On récupère la valeur de la variable c
SUB sp, sp, #16 // c Mise en pile var
STR x0, [sp] // c Mise en pile var
MOVZ x0, #6
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération =
CSET x0, EQ // Opération =
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf

// Opération
LDR x0, [x29, #-96] // On récupère la valeur de la variable d
SUB sp, sp, #16 // d Mise en pile var
STR x0, [sp] // d Mise en pile var
MOVZ x0, #6
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération =
CSET x0, EQ // Opération =
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf

// Opération
LDR x0, [x29, #-112] // On récupère la valeur de la variable e
SUB sp, sp, #16 // e Mise en pile var
STR x0, [sp] // e Mise en pile var
MOVZ x0, #100
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération =
CSET x0, EQ // Opération =
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

MOVZ x0, #5
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-48] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

MOVZ x0, #2
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-64] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 


// Opération
LDR x0, [x29, #-48] // On récupère la valeur de la variable a
SUB sp, sp, #16 // a Mise en pile var
STR x0, [sp] // a Mise en pile var
LDR x0, [x29, #-64] // On récupère la valeur de la variable b
SUB sp, sp, #16 // b Mise en pile var
STR x0, [sp] // b Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x1, #0 // Opération rem, on vérifie que le diviseur n'est pas nul
BEQ erreur_division // Opération rem, on arrête le programme si c'est le cas
SDIV x2, x0, x1 // Opération rem
MUL x2, x2, x1 // Opération rem
SUB x0, x0, x2 // Opération rem
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-80] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 


// Opération
LDR x0, [x29, #-64] // On récupère la valeur de la variable b
SUB sp, sp, #16 // b Mise en pile var
STR x0, [sp] // b Mise en pile var
LDR x0, [x29, #-48] // On récupère la valeur de la variable a
SUB sp, sp, #16 // a Mise en pile var
STR x0, [sp] // a Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x1, #0 // Opération rem, on vérifie que le diviseur n'est pas nul
BEQ erreur_division // Opération rem, on arrête le programme si c'est le cas
SDIV x2, x0, x1 // Opération rem
MUL x2, x2, x1 // Opération rem
SUB x0, x0, x2 // Opération rem
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-96] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

// Printf

// Opération
LDR x0, [x29, #-48] // On récupère la valeur de la variable a
SUB sp, sp, #16 // a Mise en pile var
STR x0, [sp] // a Mise en pile var
MOVZ x0, #5
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération =
CSET x0, EQ // Opération =
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf

// Opération
LDR x0, [x29, #-64] // On récupère la valeur de la variable b
SUB sp, sp, #16 // b Mise en pile var
STR x0, [sp] // b Mise en pile var
MOVZ x0, #2
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération =
CSET x0, EQ // Opération =
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf

// Opération
LDR x0, [x29, #-80] // On récupère la valeur de la variable c
SUB sp, sp, #16 // c Mise en pile var
STR x0, [sp] // c Mise en pile var
MOVZ x0, #1
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération =
CSET x0, EQ // Opération =
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf

// Opération
LDR x0, [x29, #-96] // On récupère la valeur de la variable d
SUB sp, sp, #16 // d Mise en pile var
STR x0, [sp] // d Mise en pile var
MOVZ x0, #2
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération =
CSET x0, EQ // Opération =
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

MOVZ x0, #2
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-48] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

MOVZ x0, #3
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-64] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

MOVZ x0, #4
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-80] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 


// Opération
LDR x0, [x29, #-64] // On récupère la valeur de la variable b
SUB sp, sp, #16 // b Mise en pile var
STR x0, [sp] // b Mise en pile var

// Opération

// Opération
LDR x0, [x29, #-80] // On récupère la valeur de la variable c
SUB sp, sp, #16 // c Mise en pile var
STR x0, [sp] // c Mise en pile var
LDR x0, [x29, #-48] // On récupère la valeur de la variable a
SUB sp, sp, #16 // a Mise en pile var
STR x0, [sp] // a Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
MUL x0, x0, x1 // Opération *
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile

// Opération
LDR x0, [x29, #-48] // On récupère la valeur de la variable a
SUB sp, sp, #16 // a Mise en pile var
STR x0, [sp] // a Mise en pile var

// Opération
LDR x0, [x29, #-64] // On récupère la valeur de la variable b
SUB sp, sp, #16 // b Mise en pile var
STR x0, [sp] // b Mise en pile var
LDR x0, [x29, #-80] // On récupère la valeur de la variable c
SUB sp, sp, #16 // c Mise en pile var
STR x0, [sp] // c Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x1, #0 // Opération rem, on vérifie que le diviseur n'est pas nul
BEQ erreur_division // Opération rem, on arrête le programme si c'est le cas
SDIV x2, x0, x1 // Opération rem
MUL x2, x2, x1 // Opération rem
SUB x0, x0, x2 // Opération rem
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
MUL x0, x0, x1 // Opération *
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-96] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

// Printf

// Opération
LDR x0, [x29, #-48] // On récupère la valeur de la variable a
SUB sp, sp, #16 // a Mise en pile var
STR x0, [sp] // a Mise en pile var
MOVZ x0, #2
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération =
CSET x0, EQ // Opération =
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf

// Opération
LDR x0, [x29, #-64] // On récupère la valeur de la variable b
SUB sp, sp, #16 // b Mise en pile var
STR x0, [sp] // b Mise en pile var
MOVZ x0, #3
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération =
CSET x0, EQ // Opération =
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf

// Opération
LDR x0, [x29, #-80] // On récupère la valeur de la variable c
SUB sp, sp, #16 // c Mise en pile var
STR x0, [sp] // c Mise en pile var
MOVZ x0, #4
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération =
CSET x0, EQ // Opération =
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf

// Opération
LDR x0, [x29, #-96] // On récupère la valeur de la variable d
SUB sp, sp, #16 // d Mise en pile var
STR x0, [sp] // d Mise en pile var
MOVZ x0, #43
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération =
CSET x0, EQ // Opération =
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf

// Opération
MOVZ x0, #1
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf

// Opération
MOVZ x0, #0
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf

// Opération
MOVZ x0, #1
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf

// Opération
MOVZ x0, #0
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Opération

// Opération
MOVZ x0, #1
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile

// Opération
MOVZ x0, #1
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération /=
CSET x0, NE // Opération /=
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération =
CSET x0, EQ // Opération =
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

MOVZ x0, #1
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-128] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 


// Opération
LDR x0, [x29, #-128] // On récupère la valeur de la variable f
SUB sp, sp, #16 // f Mise en pile var
STR x0, [sp] // f Mise en pile var

// Opération

// Opération
MOVZ x0, #1
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile

// Opération
LDR x0, [x29, #-128] // On récupère la valeur de la variable f
SUB sp, sp, #16 // f Mise en pile var
STR x0, [sp] // f Mise en pile var
LDR x0, [x29, #-128] // On récupère la valeur de la variable f
SUB sp, sp, #16 // f Mise en pile var
STR x0, [sp] // f Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération =
CSET x0, EQ // Opération =
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération =
CSET x0, EQ // Opération =
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération =
CSET x0, EQ // Opération =
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-128] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

LDR x0, [x29, #-128] // On récupère la valeur de la variable f
SUB sp, sp, #16 // f Mise en pile var
STR x0, [sp] // f Mise en pile var
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-144] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

// Printf
LDR x0, [x29, #-128] // On récupère la valeur de la variable f
SUB sp, sp, #16 // f Mise en pile var
STR x0, [sp] // f Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf

// Opération
LDR x0, [x29, #-48] // On récupère la valeur de la variable a
SUB sp, sp, #16 // a Mise en pile var
STR x0, [sp] // a Mise en pile var
LDR x0, [x29, #-64] // On récupère la valeur de la variable b
SUB sp, sp, #16 // b Mise en pile var
STR x0, [sp] // b Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération <=
CSET x0, LE // Opération <=
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf

// Opération
LDR x0, [x29, #-64] // On récupère la valeur de la variable b
SUB sp, sp, #16 // b Mise en pile var
STR x0, [sp] // b Mise en pile var
LDR x0, [x29, #-48] // On récupère la valeur de la variable a
SUB sp, sp, #16 // a Mise en pile var
STR x0, [sp] // a Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération >=
CSET x0, GE // Opération >=
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf

// Opération
LDR x0, [x29, #-48] // On récupère la valeur de la variable a
SUB sp, sp, #16 // a Mise en pile var
STR x0, [sp] // a Mise en pile var
LDR x0, [x29, #-48] // On récupère la valeur de la variable a
SUB sp, sp, #16 // a Mise en pile var
STR x0, [sp] // a Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération >=
CSET x0, GE // Opération >=
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf

// Opération
LDR x0, [x29, #-48] // On récupère la valeur de la variable a
SUB sp, sp, #16 // a Mise en pile var
STR x0, [sp] // a Mise en pile var
LDR x0, [x29, #-48] // On récupère la valeur de la variable a
SUB sp, sp, #16 // a Mise en pile var
STR x0, [sp] // a Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération <=
CSET x0, LE // Opération <=
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf

// Opération

// Opération
LDR x0, [x29, #-48] // On récupère la valeur de la variable a
SUB sp, sp, #16 // a Mise en pile var
STR x0, [sp] // a Mise en pile var
LDR x0, [x29, #-64] // On récupère la valeur de la variable b
SUB sp, sp, #16 // b Mise en pile var
STR x0, [sp] // b Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération >=
CSET x0, GE // Opération >=
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOVZ x0, #1
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération =
CSET x0, EQ // Opération =
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf

// Opération
LDR x0, [x29, #-48] // On récupère la valeur de la variable a
SUB sp, sp, #16 // a Mise en pile var
STR x0, [sp] // a Mise en pile var
LDR x0, [x29, #-64] // On récupère la valeur de la variable b
SUB sp, sp, #16 // b Mise en pile var
STR x0, [sp] // b Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération <
CSET x0, LT // Opération <
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf

// Opération
MOVZ x0, #0
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Opération
LDR x0, [x29, #-48] // On récupère la valeur de la variable a
SUB sp, sp, #16 // a Mise en pile var
STR x0, [sp] // a Mise en pile var
LDR x0, [x29, #-64] // On récupère la valeur de la variable b
SUB sp, sp, #16 // b Mise en pile var
STR x0, [sp] // b Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération >
CSET x0, GT // Opération >
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération =
CSET x0, EQ // Opération =
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf

// Opération
MOVZ x0, #0
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Opération
LDR x0, [x29, #-48] // On récupère la valeur de la variable a
SUB sp, sp, #16 // a Mise en pile var
STR x0, [sp] // a Mise en pile var
LDR x0, [x29, #-64] // On récupère la valeur de la variable b
SUB sp, sp, #16 // b Mise en pile var
STR x0, [sp] // b Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération =
CSET x0, EQ // Opération =
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération =
CSET x0, EQ // Opération =
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf

// Opération
LDR x0, [x29, #-48] // On récupère la valeur de la variable a
SUB sp, sp, #16 // a Mise en pile var
STR x0, [sp] // a Mise en pile var
LDR x0, [x29, #-64] // On récupère la valeur de la variable b
SUB sp, sp, #16 // b Mise en pile var
STR x0, [sp] // b Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération /=
CSET x0, NE // Opération /=
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf

// Opération
LDR x0, [x29, #-48] // On récupère la valeur de la variable a
SUB sp, sp, #16 // a Mise en pile var
STR x0, [sp] // a Mise en pile var
LDR x0, [x29, #-48] // On récupère la valeur de la variable a
SUB sp, sp, #16 // a Mise en pile var
STR x0, [sp] // a Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération =
CSET x0, EQ // Opération =
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf

// Opération
MOVZ x0, #0
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Opération
LDR x0, [x29, #-48] // On récupère la valeur de la variable a
SUB sp, sp, #16 // a Mise en pile var
STR x0, [sp] // a Mise en pile var
LDR x0, [x29, #-48] // On récupère la valeur de la variable a
SUB sp, sp, #16 // a Mise en pile var
STR x0, [sp] // a Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération /=
CSET x0, NE // Opération /=
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération =
CSET x0, EQ // Opération =
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf

// Opération
LDR x0, [x29, #-128] // On récupère la valeur de la variable f
SUB sp, sp, #16 // f Mise en pile var
STR x0, [sp] // f Mise en pile var
LDR x0, [x29, #-144] // On récupère la valeur de la variable g
SUB sp, sp, #16 // g Mise en pile var
STR x0, [sp] // g Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération =
CSET x0, EQ // Opération =
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf

// Opération
LDR x0, [x29, #-128] // On récupère la valeur de la variable f
SUB sp, sp, #16 // f Mise en pile var
STR x0, [sp] // f Mise en pile var
LDR x0, [x29, #-144] // On récupère la valeur de la variable g
SUB sp, sp, #16 // g Mise en pile var
STR x0, [sp] // g Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
MUL x0, x0, x1 // Opération *
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
LDR x0, [x29, #-144] // On récupère la valeur de la variable g
SUB sp, sp, #16 // g Mise en pile var
STR x0, [sp] // g Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf

// Opération
// Appel de fonction fonction1
// Paramètre 0
MOVZ x0, #2
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
// Paramètre 1
MOVZ x0, #1
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
// Gestion du chainage statique
SUB sp, sp, #16 // Incrémentation du pointeur de pile
STR x29, [sp] // Sauvegarde du chainage statique
MOV x27, x29 // Mise à jour du chainage statique
BL F1 // Appel de la fonction
// Gestion du chainage statique
ADD sp, sp, #16 // Le chainage statique ça dégage
// Récupération du résultat
ADD sp, sp, #32 // Décrémentation du pointeur de pile de la taille des paramètres
SUB sp, sp, #16 // Réserve de l'espace pour le résultat
STR x26, [sp] // Sauvegarde du résultat
MOVZ x0, #3
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération =
CSET x0, EQ // Opération =
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

MOVZ x0, #1
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x0, [sp] // Opération moins
NEG x0, x0 // Opération moins
STR x0, [sp] // Opération moins
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-48] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

MOVZ x0, #2
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-64] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

// Paramètre 0
LDR x0, [x29, #-64] // On récupère la valeur de la variable b
SUB sp, sp, #16 // b Mise en pile var
STR x0, [sp] // b Mise en pile var
// Paramètre 1
LDR x0, [x29, #-48] // On récupère la valeur de la variable a
SUB sp, sp, #16 // a Mise en pile var
STR x0, [sp] // a Mise en pile var
// Gestion du chainage statique
SUB sp, sp, #16 // Incrémentation du pointeur de pile
STR x29, [sp] // Sauvegarde du chainage statique
MOV x27, x29 // Mise à jour du chainage statique
BL P2 // Appel de la procedure
// Gestion du chainage statique
ADD sp, sp, #16 // Le chainage statique ça dégage

// Printf

// Opération
// Appel de fonction fonction_recurive
// Paramètre 0
MOVZ x0, #5
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
// Gestion du chainage statique
SUB sp, sp, #16 // Incrémentation du pointeur de pile
STR x29, [sp] // Sauvegarde du chainage statique
MOV x27, x29 // Mise à jour du chainage statique
BL F3 // Appel de la fonction
// Gestion du chainage statique
ADD sp, sp, #16 // Le chainage statique ça dégage
// Récupération du résultat
ADD sp, sp, #16 // Décrémentation du pointeur de pile de la taille des paramètres
SUB sp, sp, #16 // Réserve de l'espace pour le résultat
STR x26, [sp] // Sauvegarde du résultat
MOVZ x0, #15
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération =
CSET x0, EQ // Opération =
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf

// Opération
// Appel de fonction fonction_recurive2
// Paramètre 0
MOVZ x0, #3
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
// Paramètre 1
MOVZ x0, #2
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
// Paramètre 2
MOVZ x0, #1
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
// Gestion du chainage statique
SUB sp, sp, #16 // Incrémentation du pointeur de pile
STR x29, [sp] // Sauvegarde du chainage statique
MOV x27, x29 // Mise à jour du chainage statique
BL F4 // Appel de la fonction
// Gestion du chainage statique
ADD sp, sp, #16 // Le chainage statique ça dégage
// Récupération du résultat
ADD sp, sp, #48 // Décrémentation du pointeur de pile de la taille des paramètres
SUB sp, sp, #16 // Réserve de l'espace pour le résultat
STR x26, [sp] // Sauvegarde du résultat
MOVZ x0, #4
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération =
CSET x0, EQ // Opération =
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf

// Opération
// Appel de fonction for_test
// Paramètre 0
MOVZ x0, #10
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
// Paramètre 1
MOVZ x0, #1
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
// Gestion du chainage statique
SUB sp, sp, #16 // Incrémentation du pointeur de pile
STR x29, [sp] // Sauvegarde du chainage statique
MOV x27, x29 // Mise à jour du chainage statique
BL F6 // Appel de la fonction
// Gestion du chainage statique
ADD sp, sp, #16 // Le chainage statique ça dégage
// Récupération du résultat
ADD sp, sp, #32 // Décrémentation du pointeur de pile de la taille des paramètres
SUB sp, sp, #16 // Réserve de l'espace pour le résultat
STR x26, [sp] // Sauvegarde du résultat
MOVZ x0, #55
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération =
CSET x0, EQ // Opération =
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf

// Opération
// Appel de fonction while_test
// Paramètre 0
MOVZ x0, #10
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
// Paramètre 1
MOVZ x0, #1
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
// Gestion du chainage statique
SUB sp, sp, #16 // Incrémentation du pointeur de pile
STR x29, [sp] // Sauvegarde du chainage statique
MOV x27, x29 // Mise à jour du chainage statique
BL F8 // Appel de la fonction
// Gestion du chainage statique
ADD sp, sp, #16 // Le chainage statique ça dégage
// Récupération du résultat
ADD sp, sp, #32 // Décrémentation du pointeur de pile de la taille des paramètres
SUB sp, sp, #16 // Réserve de l'espace pour le résultat
STR x26, [sp] // Sauvegarde du résultat
MOVZ x0, #55
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération =
CSET x0, EQ // Opération =
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf

// Opération
// Appel de fonction for_reverse_test
// Paramètre 0
MOVZ x0, #10
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
// Paramètre 1
MOVZ x0, #1
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
// Gestion du chainage statique
SUB sp, sp, #16 // Incrémentation du pointeur de pile
STR x29, [sp] // Sauvegarde du chainage statique
MOV x27, x29 // Mise à jour du chainage statique
BL F9 // Appel de la fonction
// Gestion du chainage statique
ADD sp, sp, #16 // Le chainage statique ça dégage
// Récupération du résultat
ADD sp, sp, #32 // Décrémentation du pointeur de pile de la taille des paramètres
SUB sp, sp, #16 // Réserve de l'espace pour le résultat
STR x26, [sp] // Sauvegarde du résultat
MOVZ x0, #55
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération =
CSET x0, EQ // Opération =
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf

// Opération
// Appel de fonction for_in_for
// Paramètre 0
MOVZ x0, #10
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
// Paramètre 1
MOVZ x0, #1
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
// Gestion du chainage statique
SUB sp, sp, #16 // Incrémentation du pointeur de pile
STR x29, [sp] // Sauvegarde du chainage statique
MOV x27, x29 // Mise à jour du chainage statique
BL F11 // Appel de la fonction
// Gestion du chainage statique
ADD sp, sp, #16 // Le chainage statique ça dégage
// Récupération du résultat
ADD sp, sp, #32 // Décrémentation du pointeur de pile de la taille des paramètres
SUB sp, sp, #16 // Réserve de l'espace pour le résultat
STR x26, [sp] // Sauvegarde du résultat
MOVZ x0, #550
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération =
CSET x0, EQ // Opération =
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf

// Opération
// Appel de fonction for_in_while
// Paramètre 0
MOVZ x0, #10
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
// Paramètre 1
MOVZ x0, #1
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
// Gestion du chainage statique
SUB sp, sp, #16 // Incrémentation du pointeur de pile
STR x29, [sp] // Sauvegarde du chainage statique
MOV x27, x29 // Mise à jour du chainage statique
BL F14 // Appel de la fonction
// Gestion du chainage statique
ADD sp, sp, #16 // Le chainage statique ça dégage
// Récupération du résultat
ADD sp, sp, #32 // Décrémentation du pointeur de pile de la taille des paramètres
SUB sp, sp, #16 // Réserve de l'espace pour le résultat
STR x26, [sp] // Sauvegarde du résultat
MOVZ x0, #55
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération =
CSET x0, EQ // Opération =
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf

// Opération
// Appel de fonction for_in_for_in_for_in_for
// Paramètre 0
MOVZ x0, #2
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
// Paramètre 1
MOVZ x0, #1
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
// Gestion du chainage statique
SUB sp, sp, #16 // Incrémentation du pointeur de pile
STR x29, [sp] // Sauvegarde du chainage statique
MOV x27, x29 // Mise à jour du chainage statique
BL F16 // Appel de la fonction
// Gestion du chainage statique
ADD sp, sp, #16 // Le chainage statique ça dégage
// Récupération du résultat
ADD sp, sp, #32 // Décrémentation du pointeur de pile de la taille des paramètres
SUB sp, sp, #16 // Réserve de l'espace pour le résultat
STR x26, [sp] // Sauvegarde du résultat
MOVZ x0, #24
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération =
CSET x0, EQ // Opération =
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
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

F1 : // Début de la fonction
STP x29, lr, [sp, #-16] // Sauvegarde du pointeur de pile et du lien de retour
MOV x29, sp // Mise à jour du pointeur de pile
SUB sp, sp, #32 // Déplacement du stack pointer pour fp et lr
// Définitions de la fonction fonction1
// Instructions de la fonction fonction1
// Return 

// Opération
LDR x0, [x29, #16] // On récupère la valeur de la variable a
SUB sp, sp, #16 // a Mise en pile var
STR x0, [sp] // a Mise en pile var
LDR x0, [x29, #32] // On récupère la valeur de la variable b
SUB sp, sp, #16 // b Mise en pile var
STR x0, [sp] // b Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x26, [sp] // Valeur de retour dans le registre x26
MOV sp, x29 // Restauration du pointeur de pile
LDP x29, lr, [sp, #-16] // Restauration du pointeur de pile et du lien de retour
RET // Retour de la fonction


// Procédure procedure1
P2 :
STP x29, lr, [sp, #-16] // Sauvegarde du pointeur de pile et du lien de retour
MOV x29, sp // Mise à jour du pointeur de pile
SUB sp, sp, #32 // Déplacement du stack pointer pour fp et lr
// Définitions de la procédure procedure1
// Instructions de la procédure procedure1
LDR x0, [x29, #16] // On récupère la valeur de la variable a
SUB sp, sp, #16 // a Mise en pile var
STR x0, [sp] // a Mise en pile var
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #16] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

// Printf

// Opération
LDR x0, [x29, #16] // On récupère la valeur de la variable a
SUB sp, sp, #16 // a Mise en pile var
STR x0, [sp] // a Mise en pile var
LDR x0, [x29, #32] // On récupère la valeur de la variable b
SUB sp, sp, #16 // b Mise en pile var
STR x0, [sp] // b Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

MOV sp, x29 // Restauration du pointeur de pile
LDP x29, lr, [sp, #-16] // Restauration du pointeur de pile et du lien de retour
RET // Retour de la fonction

F3 : // Début de la fonction
STP x29, lr, [sp, #-16] // Sauvegarde du pointeur de pile et du lien de retour
MOV x29, sp // Mise à jour du pointeur de pile
SUB sp, sp, #32 // Déplacement du stack pointer pour fp et lr
// Définitions de la fonction fonction_recurive
// Instructions de la fonction fonction_recurive
// if 20132171

// Opération
LDR x0, [x29, #16] // On récupère la valeur de la variable a
SUB sp, sp, #16 // a Mise en pile var
STR x0, [sp] // a Mise en pile var
MOVZ x0, #0
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération =
CSET x0, EQ // Opération =
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x0, [sp] // Chargement de la condition
ADD sp, sp, #16 // Décrémentation du pointeur de pile
CMP x0, #0 // Comparaison de la condition
BNE then20132171 // Branchement si la condition est vraie
// Return 

// Opération
LDR x0, [x29, #16] // On récupère la valeur de la variable a
SUB sp, sp, #16 // a Mise en pile var
STR x0, [sp] // a Mise en pile var
// Appel de fonction fonction_recurive
// Paramètre 0

// Opération
LDR x0, [x29, #16] // On récupère la valeur de la variable a
SUB sp, sp, #16 // a Mise en pile var
STR x0, [sp] // a Mise en pile var
MOVZ x0, #1
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
SUB x0, x0, x1 // Opération -
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
// Gestion du chainage statique
SUB sp, sp, #16 // Incrémentation du pointeur de pile
STR x27, [sp] // Sauvegarde du chainage statique
BL F3 // Appel de la fonction
// Gestion du chainage statique
ADD sp, sp, #16 // Le chainage statique ça dégage
// Récupération du résultat
ADD sp, sp, #16 // Décrémentation du pointeur de pile de la taille des paramètres
SUB sp, sp, #16 // Réserve de l'espace pour le résultat
STR x26, [sp] // Sauvegarde du résultat
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x26, [sp] // Valeur de retour dans le registre x26
MOV sp, x29 // Restauration du pointeur de pile
LDP x29, lr, [sp, #-16] // Restauration du pointeur de pile et du lien de retour
RET // Retour de la fonction
B end20132171 // Branchement à la fin du if
then20132171 :
// Return 
MOVZ x0, #0
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x26, [sp] // Valeur de retour dans le registre x26
MOV sp, x29 // Restauration du pointeur de pile
LDP x29, lr, [sp, #-16] // Restauration du pointeur de pile et du lien de retour
RET // Retour de la fonction
end20132171 :

// Return 
MOVZ x0, #0
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x26, [sp] // Valeur de retour dans le registre x26
MOV sp, x29 // Restauration du pointeur de pile
LDP x29, lr, [sp, #-16] // Restauration du pointeur de pile et du lien de retour
RET // Retour de la fonction


F5 : // Début de la fonction
STP x29, lr, [sp, #-16] // Sauvegarde du pointeur de pile et du lien de retour
MOV x29, sp // Mise à jour du pointeur de pile
SUB sp, sp, #32 // Déplacement du stack pointer pour fp et lr
// Définitions de la fonction fonction_recurive3
// Declaration de la variable d
MOVZ x0, #2
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Instructions de la fonction fonction_recurive3
// if 186370029

// Opération
LDR x0, [x29, #48] // On récupère la valeur de la variable c
SUB sp, sp, #16 // c Mise en pile var
STR x0, [sp] // c Mise en pile var
MOVZ x0, #0
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération =
CSET x0, EQ // Opération =
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x0, [sp] // Chargement de la condition
ADD sp, sp, #16 // Décrémentation du pointeur de pile
CMP x0, #0 // Comparaison de la condition
BNE then186370029 // Branchement si la condition est vraie
// Return 

// Opération
MOVZ x0, #1
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
// Appel de fonction fonction_recurive3
// Paramètre 0

// Opération
LDR x0, [x29, #48] // On récupère la valeur de la variable c
SUB sp, sp, #16 // c Mise en pile var
STR x0, [sp] // c Mise en pile var
MOVZ x0, #1
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
SUB x0, x0, x1 // Opération -
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
// Paramètre 1
LDR x0, [x29, #32] // On récupère la valeur de la variable b
SUB sp, sp, #16 // b Mise en pile var
STR x0, [sp] // b Mise en pile var
// Paramètre 2
LDR x0, [x29, #16] // On récupère la valeur de la variable a
SUB sp, sp, #16 // a Mise en pile var
STR x0, [sp] // a Mise en pile var
// Gestion du chainage statique
SUB sp, sp, #16 // Incrémentation du pointeur de pile
STR x27, [sp] // Sauvegarde du chainage statique
BL F5 // Appel de la fonction
// Gestion du chainage statique
ADD sp, sp, #16 // Le chainage statique ça dégage
// Récupération du résultat
ADD sp, sp, #48 // Décrémentation du pointeur de pile de la taille des paramètres
SUB sp, sp, #16 // Réserve de l'espace pour le résultat
STR x26, [sp] // Sauvegarde du résultat
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x26, [sp] // Valeur de retour dans le registre x26
MOV sp, x29 // Restauration du pointeur de pile
LDP x29, lr, [sp, #-16] // Restauration du pointeur de pile et du lien de retour
RET // Retour de la fonction
B end186370029 // Branchement à la fin du if
then186370029 :
// Return 
MOVZ x0, #0
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x26, [sp] // Valeur de retour dans le registre x26
MOV sp, x29 // Restauration du pointeur de pile
LDP x29, lr, [sp, #-16] // Restauration du pointeur de pile et du lien de retour
RET // Retour de la fonction
end186370029 :

// Return 
LDR x0, [x29, #-48] // On récupère la valeur de la variable d
SUB sp, sp, #16 // d Mise en pile var
STR x0, [sp] // d Mise en pile var
LDR x26, [sp] // Valeur de retour dans le registre x26
MOV sp, x29 // Restauration du pointeur de pile
LDP x29, lr, [sp, #-16] // Restauration du pointeur de pile et du lien de retour
RET // Retour de la fonction


F4 : // Début de la fonction
STP x29, lr, [sp, #-16] // Sauvegarde du pointeur de pile et du lien de retour
MOV x29, sp // Mise à jour du pointeur de pile
SUB sp, sp, #32 // Déplacement du stack pointer pour fp et lr
// Définitions de la fonction fonction_recurive2
// Declaration de la variable d
MOVZ x0, #1
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 


// Instructions de la fonction fonction_recurive2
// Return 

// Opération
MOVZ x0, #1
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
// Appel de fonction fonction_recurive3
// Paramètre 0
LDR x0, [x29, #48] // On récupère la valeur de la variable c
SUB sp, sp, #16 // c Mise en pile var
STR x0, [sp] // c Mise en pile var
// Paramètre 1
LDR x0, [x29, #32] // On récupère la valeur de la variable b
SUB sp, sp, #16 // b Mise en pile var
STR x0, [sp] // b Mise en pile var
// Paramètre 2
LDR x0, [x29, #16] // On récupère la valeur de la variable a
SUB sp, sp, #16 // a Mise en pile var
STR x0, [sp] // a Mise en pile var
// Gestion du chainage statique
SUB sp, sp, #16 // Incrémentation du pointeur de pile
STR x29, [sp] // Sauvegarde du chainage statique
MOV x27, x29 // Mise à jour du chainage statique
BL F5 // Appel de la fonction
// Gestion du chainage statique
ADD sp, sp, #16 // Le chainage statique ça dégage
// Récupération du résultat
ADD sp, sp, #48 // Décrémentation du pointeur de pile de la taille des paramètres
SUB sp, sp, #16 // Réserve de l'espace pour le résultat
STR x26, [sp] // Sauvegarde du résultat
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x26, [sp] // Valeur de retour dans le registre x26
MOV sp, x29 // Restauration du pointeur de pile
LDP x29, lr, [sp, #-16] // Restauration du pointeur de pile et du lien de retour
RET // Retour de la fonction


F6 : // Début de la fonction
STP x29, lr, [sp, #-16] // Sauvegarde du pointeur de pile et du lien de retour
MOV x29, sp // Mise à jour du pointeur de pile
SUB sp, sp, #32 // Déplacement du stack pointer pour fp et lr
// Définitions de la fonction for_test
// Declaration de la variable res
MOVZ x0, #0
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Instructions de la fonction for_test
// Gestion du chainage statique (oui un chainage statique dans un for)
SUB sp, sp, #16 // Incrémentation du pointeur de pile
STR x29, [sp] // Sauvegarde du chainage statique
MOV x29, sp // Mise à jour du pointeur de pile
MOV x27, x29 // Mise à jour du chainage statique
SUB sp, sp, #48 // Déplacement du stack pointer pour fp, lr et l'itéareur
MOVZ x0, #0 // On met le deplacement en pile 
ADD x0, x0, #-16 // On met le deplacement en pile 
MOVZ x1, #1 // a Nb saut VAR GLOBALE
MOV x28,x29 // Copie du frame pointer dans x28 (temporaire)
BL get_global_var // a Mise en pile var
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-48] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

// while 2094548358
while2094548358 :

// Opération
LDR x0, [x29, #-48] // On récupère la valeur de la variable i
SUB sp, sp, #16 // i Mise en pile var
STR x0, [sp] // i Mise en pile var
MOVZ x0, #0 // On met le deplacement en pile 
ADD x0, x0, #-32 // On met le deplacement en pile 
MOVZ x1, #1 // b Nb saut VAR GLOBALE
MOV x28,x29 // Copie du frame pointer dans x28 (temporaire)
BL get_global_var // b Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération <=
CSET x0, LE // Opération <=
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x0, [sp] // Chargement de la condition
ADD sp, sp, #16 // Dépilement de la condition
CMP x0, #0

BNE whilecontinue2094548358
B whileend2094548358
whilecontinue2094548358 :

// Opération
MOVZ x0, #48 // Deplacement en pile VAR GLOBALE 
MOVZ x1, #1 // res Nb saut VAR GLOBALE
MOV x28,x29 // Copie du frame pointer dans x28 (temporaire)
BL get_global_var // res Mise en pile var
LDR x0, [x29, #-48] // On récupère la valeur de la variable i
SUB sp, sp, #16 // i Mise en pile var
STR x0, [sp] // i Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
MOVZ x0, #48 // On met le deplacement en pile 
MOVZ x1, #1 // On met le nombre de saut en pile 
MOV x28,x29 // Copie du frame pointer dans x28 (temporaire)
BL set_global_var // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

// Opération
LDR x0, [x29, #-48] // On récupère la valeur de la variable i
SUB sp, sp, #16 // i Mise en pile var
STR x0, [sp] // i Mise en pile var
MOVZ x0, #1
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-48] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 
B while2094548358
whileend2094548358 :
ADD sp, sp, #48 // Décrémentation du pointeur de pile
LDR x29, [sp] // Restauration du chainage statique
ADD sp, sp, #16 // Le chainage statique ça dégage

// Return 
LDR x0, [x29, #-48] // On récupère la valeur de la variable res
SUB sp, sp, #16 // res Mise en pile var
STR x0, [sp] // res Mise en pile var
LDR x26, [sp] // Valeur de retour dans le registre x26
MOV sp, x29 // Restauration du pointeur de pile
LDP x29, lr, [sp, #-16] // Restauration du pointeur de pile et du lien de retour
RET // Retour de la fonction


F8 : // Début de la fonction
STP x29, lr, [sp, #-16] // Sauvegarde du pointeur de pile et du lien de retour
MOV x29, sp // Mise à jour du pointeur de pile
SUB sp, sp, #32 // Déplacement du stack pointer pour fp et lr
// Définitions de la fonction while_test
// Declaration de la variable res
MOVZ x0, #0
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable i
LDR x0, [x29, #16] // On récupère la valeur de la variable a
SUB sp, sp, #16 // a Mise en pile var
STR x0, [sp] // a Mise en pile var

// Instructions de la fonction while_test
// while 51228289
while51228289 :

// Opération
LDR x0, [x29, #-64] // On récupère la valeur de la variable i
SUB sp, sp, #16 // i Mise en pile var
STR x0, [sp] // i Mise en pile var
LDR x0, [x29, #32] // On récupère la valeur de la variable b
SUB sp, sp, #16 // b Mise en pile var
STR x0, [sp] // b Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération <=
CSET x0, LE // Opération <=
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x0, [sp] // Chargement de la condition
ADD sp, sp, #16 // Dépilement de la condition
CMP x0, #0

BNE whilecontinue51228289
B whileend51228289
whilecontinue51228289 :

// Opération
LDR x0, [x29, #-48] // On récupère la valeur de la variable res
SUB sp, sp, #16 // res Mise en pile var
STR x0, [sp] // res Mise en pile var
LDR x0, [x29, #-64] // On récupère la valeur de la variable i
SUB sp, sp, #16 // i Mise en pile var
STR x0, [sp] // i Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-48] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

// Opération
LDR x0, [x29, #-64] // On récupère la valeur de la variable i
SUB sp, sp, #16 // i Mise en pile var
STR x0, [sp] // i Mise en pile var
MOVZ x0, #1
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-64] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 
B while51228289
whileend51228289 :

// Return 
LDR x0, [x29, #-48] // On récupère la valeur de la variable res
SUB sp, sp, #16 // res Mise en pile var
STR x0, [sp] // res Mise en pile var
LDR x26, [sp] // Valeur de retour dans le registre x26
MOV sp, x29 // Restauration du pointeur de pile
LDP x29, lr, [sp, #-16] // Restauration du pointeur de pile et du lien de retour
RET // Retour de la fonction


F9 : // Début de la fonction
STP x29, lr, [sp, #-16] // Sauvegarde du pointeur de pile et du lien de retour
MOV x29, sp // Mise à jour du pointeur de pile
SUB sp, sp, #32 // Déplacement du stack pointer pour fp et lr
// Définitions de la fonction for_reverse_test
// Declaration de la variable res
MOVZ x0, #0
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Instructions de la fonction for_reverse_test
// Gestion du chainage statique (oui un chainage statique dans un for)
SUB sp, sp, #16 // Incrémentation du pointeur de pile
STR x29, [sp] // Sauvegarde du chainage statique
MOV x29, sp // Mise à jour du pointeur de pile
MOV x27, x29 // Mise à jour du chainage statique
SUB sp, sp, #48 // Déplacement du stack pointer pour fp, lr et l'itéareur
MOVZ x0, #0 // On met le deplacement en pile 
ADD x0, x0, #-16 // On met le deplacement en pile 
MOVZ x1, #1 // a Nb saut VAR GLOBALE
MOV x28,x29 // Copie du frame pointer dans x28 (temporaire)
BL get_global_var // a Mise en pile var
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-48] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

// while 455896770
while455896770 :

// Opération
LDR x0, [x29, #-48] // On récupère la valeur de la variable i
SUB sp, sp, #16 // i Mise en pile var
STR x0, [sp] // i Mise en pile var
MOVZ x0, #0 // On met le deplacement en pile 
ADD x0, x0, #-32 // On met le deplacement en pile 
MOVZ x1, #1 // b Nb saut VAR GLOBALE
MOV x28,x29 // Copie du frame pointer dans x28 (temporaire)
BL get_global_var // b Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération <=
CSET x0, LE // Opération <=
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x0, [sp] // Chargement de la condition
ADD sp, sp, #16 // Dépilement de la condition
CMP x0, #0

BNE whilecontinue455896770
B whileend455896770
whilecontinue455896770 :

// Opération
MOVZ x0, #48 // Deplacement en pile VAR GLOBALE 
MOVZ x1, #1 // res Nb saut VAR GLOBALE
MOV x28,x29 // Copie du frame pointer dans x28 (temporaire)
BL get_global_var // res Mise en pile var
LDR x0, [x29, #-48] // On récupère la valeur de la variable i
SUB sp, sp, #16 // i Mise en pile var
STR x0, [sp] // i Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
MOVZ x0, #48 // On met le deplacement en pile 
MOVZ x1, #1 // On met le nombre de saut en pile 
MOV x28,x29 // Copie du frame pointer dans x28 (temporaire)
BL set_global_var // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

// Opération
LDR x0, [x29, #-48] // On récupère la valeur de la variable i
SUB sp, sp, #16 // i Mise en pile var
STR x0, [sp] // i Mise en pile var
MOVZ x0, #1
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-48] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 
B while455896770
whileend455896770 :
ADD sp, sp, #48 // Décrémentation du pointeur de pile
LDR x29, [sp] // Restauration du chainage statique
ADD sp, sp, #16 // Le chainage statique ça dégage

// Return 
LDR x0, [x29, #-48] // On récupère la valeur de la variable res
SUB sp, sp, #16 // res Mise en pile var
STR x0, [sp] // res Mise en pile var
LDR x26, [sp] // Valeur de retour dans le registre x26
MOV sp, x29 // Restauration du pointeur de pile
LDP x29, lr, [sp, #-16] // Restauration du pointeur de pile et du lien de retour
RET // Retour de la fonction


F11 : // Début de la fonction
STP x29, lr, [sp, #-16] // Sauvegarde du pointeur de pile et du lien de retour
MOV x29, sp // Mise à jour du pointeur de pile
SUB sp, sp, #32 // Déplacement du stack pointer pour fp et lr
// Définitions de la fonction for_in_for
// Declaration de la variable res
MOVZ x0, #0
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Instructions de la fonction for_in_for
// Gestion du chainage statique (oui un chainage statique dans un for)
SUB sp, sp, #16 // Incrémentation du pointeur de pile
STR x29, [sp] // Sauvegarde du chainage statique
MOV x29, sp // Mise à jour du pointeur de pile
MOV x27, x29 // Mise à jour du chainage statique
SUB sp, sp, #48 // Déplacement du stack pointer pour fp, lr et l'itéareur
MOVZ x0, #0 // On met le deplacement en pile 
ADD x0, x0, #-16 // On met le deplacement en pile 
MOVZ x1, #1 // a Nb saut VAR GLOBALE
MOV x28,x29 // Copie du frame pointer dans x28 (temporaire)
BL get_global_var // a Mise en pile var
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-48] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

// while 1323165413
while1323165413 :

// Opération
LDR x0, [x29, #-48] // On récupère la valeur de la variable i
SUB sp, sp, #16 // i Mise en pile var
STR x0, [sp] // i Mise en pile var
MOVZ x0, #0 // On met le deplacement en pile 
ADD x0, x0, #-32 // On met le deplacement en pile 
MOVZ x1, #1 // b Nb saut VAR GLOBALE
MOV x28,x29 // Copie du frame pointer dans x28 (temporaire)
BL get_global_var // b Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération <=
CSET x0, LE // Opération <=
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x0, [sp] // Chargement de la condition
ADD sp, sp, #16 // Dépilement de la condition
CMP x0, #0

BNE whilecontinue1323165413
B whileend1323165413
whilecontinue1323165413 :
// Gestion du chainage statique (oui un chainage statique dans un for)
SUB sp, sp, #16 // Incrémentation du pointeur de pile
STR x29, [sp] // Sauvegarde du chainage statique
MOV x29, sp // Mise à jour du pointeur de pile
MOV x27, x29 // Mise à jour du chainage statique
SUB sp, sp, #48 // Déplacement du stack pointer pour fp, lr et l'itéareur
MOVZ x0, #0 // On met le deplacement en pile 
ADD x0, x0, #-16 // On met le deplacement en pile 
MOVZ x1, #2 // a Nb saut VAR GLOBALE
MOV x28,x29 // Copie du frame pointer dans x28 (temporaire)
BL get_global_var // a Mise en pile var
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-48] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

// while 1880587981
while1880587981 :

// Opération
LDR x0, [x29, #-48] // On récupère la valeur de la variable j
SUB sp, sp, #16 // j Mise en pile var
STR x0, [sp] // j Mise en pile var
MOVZ x0, #0 // On met le deplacement en pile 
ADD x0, x0, #-32 // On met le deplacement en pile 
MOVZ x1, #2 // b Nb saut VAR GLOBALE
MOV x28,x29 // Copie du frame pointer dans x28 (temporaire)
BL get_global_var // b Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération <=
CSET x0, LE // Opération <=
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x0, [sp] // Chargement de la condition
ADD sp, sp, #16 // Dépilement de la condition
CMP x0, #0

BNE whilecontinue1880587981
B whileend1880587981
whilecontinue1880587981 :

// Opération

// Opération
MOVZ x0, #48 // Deplacement en pile VAR GLOBALE 
MOVZ x1, #2 // res Nb saut VAR GLOBALE
MOV x28,x29 // Copie du frame pointer dans x28 (temporaire)
BL get_global_var // res Mise en pile var
MOVZ x0, #48 // Deplacement en pile VAR GLOBALE 
MOVZ x1, #1 // i Nb saut VAR GLOBALE
MOV x28,x29 // Copie du frame pointer dans x28 (temporaire)
BL get_global_var // i Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x0, [x29, #-48] // On récupère la valeur de la variable j
SUB sp, sp, #16 // j Mise en pile var
STR x0, [sp] // j Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
MOVZ x0, #48 // On met le deplacement en pile 
MOVZ x1, #2 // On met le nombre de saut en pile 
MOV x28,x29 // Copie du frame pointer dans x28 (temporaire)
BL set_global_var // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

// Opération
LDR x0, [x29, #-48] // On récupère la valeur de la variable j
SUB sp, sp, #16 // j Mise en pile var
STR x0, [sp] // j Mise en pile var
MOVZ x0, #1
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-48] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 
B while1880587981
whileend1880587981 :
ADD sp, sp, #48 // Décrémentation du pointeur de pile
LDR x29, [sp] // Restauration du chainage statique
ADD sp, sp, #16 // Le chainage statique ça dégage

// Opération
LDR x0, [x29, #-48] // On récupère la valeur de la variable i
SUB sp, sp, #16 // i Mise en pile var
STR x0, [sp] // i Mise en pile var
MOVZ x0, #1
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-48] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 
B while1323165413
whileend1323165413 :
ADD sp, sp, #48 // Décrémentation du pointeur de pile
LDR x29, [sp] // Restauration du chainage statique
ADD sp, sp, #16 // Le chainage statique ça dégage

// Return 
LDR x0, [x29, #-48] // On récupère la valeur de la variable res
SUB sp, sp, #16 // res Mise en pile var
STR x0, [sp] // res Mise en pile var
LDR x26, [sp] // Valeur de retour dans le registre x26
MOV sp, x29 // Restauration du pointeur de pile
LDP x29, lr, [sp, #-16] // Restauration du pointeur de pile et du lien de retour
RET // Retour de la fonction


F14 : // Début de la fonction
STP x29, lr, [sp, #-16] // Sauvegarde du pointeur de pile et du lien de retour
MOV x29, sp // Mise à jour du pointeur de pile
SUB sp, sp, #32 // Déplacement du stack pointer pour fp et lr
// Définitions de la fonction for_in_while
// Declaration de la variable res
MOVZ x0, #0
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable i
LDR x0, [x29, #16] // On récupère la valeur de la variable a
SUB sp, sp, #16 // a Mise en pile var
STR x0, [sp] // a Mise en pile var

// Instructions de la fonction for_in_while
// Gestion du chainage statique (oui un chainage statique dans un for)
SUB sp, sp, #16 // Incrémentation du pointeur de pile
STR x29, [sp] // Sauvegarde du chainage statique
MOV x29, sp // Mise à jour du pointeur de pile
MOV x27, x29 // Mise à jour du chainage statique
SUB sp, sp, #48 // Déplacement du stack pointer pour fp, lr et l'itéareur
MOVZ x0, #0 // On met le deplacement en pile 
ADD x0, x0, #-16 // On met le deplacement en pile 
MOVZ x1, #1 // a Nb saut VAR GLOBALE
MOV x28,x29 // Copie du frame pointer dans x28 (temporaire)
BL get_global_var // a Mise en pile var
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-48] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

// while 511754216
while511754216 :

// Opération
LDR x0, [x29, #-48] // On récupère la valeur de la variable i
SUB sp, sp, #16 // i Mise en pile var
STR x0, [sp] // i Mise en pile var
MOVZ x0, #0 // On met le deplacement en pile 
ADD x0, x0, #-32 // On met le deplacement en pile 
MOVZ x1, #1 // b Nb saut VAR GLOBALE
MOV x28,x29 // Copie du frame pointer dans x28 (temporaire)
BL get_global_var // b Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération <=
CSET x0, LE // Opération <=
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x0, [sp] // Chargement de la condition
ADD sp, sp, #16 // Dépilement de la condition
CMP x0, #0

BNE whilecontinue511754216
B whileend511754216
whilecontinue511754216 :
// while 1721931908
while1721931908 :

// Opération
LDR x0, [x29, #-48] // On récupère la valeur de la variable i
SUB sp, sp, #16 // i Mise en pile var
STR x0, [sp] // i Mise en pile var
MOVZ x0, #0 // On met le deplacement en pile 
ADD x0, x0, #-32 // On met le deplacement en pile 
MOVZ x1, #1 // b Nb saut VAR GLOBALE
MOV x28,x29 // Copie du frame pointer dans x28 (temporaire)
BL get_global_var // b Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération <=
CSET x0, LE // Opération <=
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x0, [sp] // Chargement de la condition
ADD sp, sp, #16 // Dépilement de la condition
CMP x0, #0

BNE whilecontinue1721931908
B whileend1721931908
whilecontinue1721931908 :

// Opération
MOVZ x0, #48 // Deplacement en pile VAR GLOBALE 
MOVZ x1, #1 // res Nb saut VAR GLOBALE
MOV x28,x29 // Copie du frame pointer dans x28 (temporaire)
BL get_global_var // res Mise en pile var
LDR x0, [x29, #-48] // On récupère la valeur de la variable i
SUB sp, sp, #16 // i Mise en pile var
STR x0, [sp] // i Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
MOVZ x0, #48 // On met le deplacement en pile 
MOVZ x1, #1 // On met le nombre de saut en pile 
MOV x28,x29 // Copie du frame pointer dans x28 (temporaire)
BL set_global_var // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 
B while1721931908
whileend1721931908 :

// Opération
LDR x0, [x29, #-48] // On récupère la valeur de la variable i
SUB sp, sp, #16 // i Mise en pile var
STR x0, [sp] // i Mise en pile var
MOVZ x0, #1
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-48] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 
B while511754216
whileend511754216 :
ADD sp, sp, #48 // Décrémentation du pointeur de pile
LDR x29, [sp] // Restauration du chainage statique
ADD sp, sp, #16 // Le chainage statique ça dégage

// Return 
LDR x0, [x29, #-48] // On récupère la valeur de la variable res
SUB sp, sp, #16 // res Mise en pile var
STR x0, [sp] // res Mise en pile var
LDR x26, [sp] // Valeur de retour dans le registre x26
MOV sp, x29 // Restauration du pointeur de pile
LDP x29, lr, [sp, #-16] // Restauration du pointeur de pile et du lien de retour
RET // Retour de la fonction


F16 : // Début de la fonction
STP x29, lr, [sp, #-16] // Sauvegarde du pointeur de pile et du lien de retour
MOV x29, sp // Mise à jour du pointeur de pile
SUB sp, sp, #32 // Déplacement du stack pointer pour fp et lr
// Définitions de la fonction for_in_for_in_for_in_for
// Declaration de la variable res
MOVZ x0, #0
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Instructions de la fonction for_in_for_in_for_in_for
// Gestion du chainage statique (oui un chainage statique dans un for)
SUB sp, sp, #16 // Incrémentation du pointeur de pile
STR x29, [sp] // Sauvegarde du chainage statique
MOV x29, sp // Mise à jour du pointeur de pile
MOV x27, x29 // Mise à jour du chainage statique
SUB sp, sp, #48 // Déplacement du stack pointer pour fp, lr et l'itéareur
MOVZ x0, #0 // On met le deplacement en pile 
ADD x0, x0, #-16 // On met le deplacement en pile 
MOVZ x1, #1 // a Nb saut VAR GLOBALE
MOV x28,x29 // Copie du frame pointer dans x28 (temporaire)
BL get_global_var // a Mise en pile var
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-48] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

// while 1198108795
while1198108795 :

// Opération
LDR x0, [x29, #-48] // On récupère la valeur de la variable i
SUB sp, sp, #16 // i Mise en pile var
STR x0, [sp] // i Mise en pile var
MOVZ x0, #0 // On met le deplacement en pile 
ADD x0, x0, #-32 // On met le deplacement en pile 
MOVZ x1, #1 // b Nb saut VAR GLOBALE
MOV x28,x29 // Copie du frame pointer dans x28 (temporaire)
BL get_global_var // b Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération <=
CSET x0, LE // Opération <=
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x0, [sp] // Chargement de la condition
ADD sp, sp, #16 // Dépilement de la condition
CMP x0, #0

BNE whilecontinue1198108795
B whileend1198108795
whilecontinue1198108795 :
// Gestion du chainage statique (oui un chainage statique dans un for)
SUB sp, sp, #16 // Incrémentation du pointeur de pile
STR x29, [sp] // Sauvegarde du chainage statique
MOV x29, sp // Mise à jour du pointeur de pile
MOV x27, x29 // Mise à jour du chainage statique
SUB sp, sp, #48 // Déplacement du stack pointer pour fp, lr et l'itéareur
MOVZ x0, #0 // On met le deplacement en pile 
ADD x0, x0, #-16 // On met le deplacement en pile 
MOVZ x1, #2 // a Nb saut VAR GLOBALE
MOV x28,x29 // Copie du frame pointer dans x28 (temporaire)
BL get_global_var // a Mise en pile var
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-48] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

// while 214126413
while214126413 :

// Opération
LDR x0, [x29, #-48] // On récupère la valeur de la variable j
SUB sp, sp, #16 // j Mise en pile var
STR x0, [sp] // j Mise en pile var
MOVZ x0, #0 // On met le deplacement en pile 
ADD x0, x0, #-32 // On met le deplacement en pile 
MOVZ x1, #2 // b Nb saut VAR GLOBALE
MOV x28,x29 // Copie du frame pointer dans x28 (temporaire)
BL get_global_var // b Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération <=
CSET x0, LE // Opération <=
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x0, [sp] // Chargement de la condition
ADD sp, sp, #16 // Dépilement de la condition
CMP x0, #0

BNE whilecontinue214126413
B whileend214126413
whilecontinue214126413 :
// Gestion du chainage statique (oui un chainage statique dans un for)
SUB sp, sp, #16 // Incrémentation du pointeur de pile
STR x29, [sp] // Sauvegarde du chainage statique
MOV x29, sp // Mise à jour du pointeur de pile
MOV x27, x29 // Mise à jour du chainage statique
SUB sp, sp, #48 // Déplacement du stack pointer pour fp, lr et l'itéareur
MOVZ x0, #0 // On met le deplacement en pile 
ADD x0, x0, #-16 // On met le deplacement en pile 
MOVZ x1, #3 // a Nb saut VAR GLOBALE
MOV x28,x29 // Copie du frame pointer dans x28 (temporaire)
BL get_global_var // a Mise en pile var
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-48] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

// while 396873410
while396873410 :

// Opération
LDR x0, [x29, #-48] // On récupère la valeur de la variable k
SUB sp, sp, #16 // k Mise en pile var
STR x0, [sp] // k Mise en pile var
MOVZ x0, #0 // On met le deplacement en pile 
ADD x0, x0, #-32 // On met le deplacement en pile 
MOVZ x1, #3 // b Nb saut VAR GLOBALE
MOV x28,x29 // Copie du frame pointer dans x28 (temporaire)
BL get_global_var // b Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération <=
CSET x0, LE // Opération <=
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x0, [sp] // Chargement de la condition
ADD sp, sp, #16 // Dépilement de la condition
CMP x0, #0

BNE whilecontinue396873410
B whileend396873410
whilecontinue396873410 :
// Gestion du chainage statique (oui un chainage statique dans un for)
SUB sp, sp, #16 // Incrémentation du pointeur de pile
STR x29, [sp] // Sauvegarde du chainage statique
MOV x29, sp // Mise à jour du pointeur de pile
MOV x27, x29 // Mise à jour du chainage statique
SUB sp, sp, #48 // Déplacement du stack pointer pour fp, lr et l'itéareur
MOVZ x0, #0 // On met le deplacement en pile 
ADD x0, x0, #-16 // On met le deplacement en pile 
MOVZ x1, #4 // a Nb saut VAR GLOBALE
MOV x28,x29 // Copie du frame pointer dans x28 (temporaire)
BL get_global_var // a Mise en pile var
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-48] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

// while 1706234378
while1706234378 :

// Opération
LDR x0, [x29, #-48] // On récupère la valeur de la variable l
SUB sp, sp, #16 // l Mise en pile var
STR x0, [sp] // l Mise en pile var
MOVZ x0, #0 // On met le deplacement en pile 
ADD x0, x0, #-32 // On met le deplacement en pile 
MOVZ x1, #4 // b Nb saut VAR GLOBALE
MOV x28,x29 // Copie du frame pointer dans x28 (temporaire)
BL get_global_var // b Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération <=
CSET x0, LE // Opération <=
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x0, [sp] // Chargement de la condition
ADD sp, sp, #16 // Dépilement de la condition
CMP x0, #0

BNE whilecontinue1706234378
B whileend1706234378
whilecontinue1706234378 :

// Opération

// Opération

// Opération

// Opération
MOVZ x0, #48 // Deplacement en pile VAR GLOBALE 
MOVZ x1, #4 // res Nb saut VAR GLOBALE
MOV x28,x29 // Copie du frame pointer dans x28 (temporaire)
BL get_global_var // res Mise en pile var
MOVZ x0, #48 // Deplacement en pile VAR GLOBALE 
MOVZ x1, #3 // i Nb saut VAR GLOBALE
MOV x28,x29 // Copie du frame pointer dans x28 (temporaire)
BL get_global_var // i Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOVZ x0, #48 // Deplacement en pile VAR GLOBALE 
MOVZ x1, #2 // j Nb saut VAR GLOBALE
MOV x28,x29 // Copie du frame pointer dans x28 (temporaire)
BL get_global_var // j Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOVZ x0, #48 // Deplacement en pile VAR GLOBALE 
MOVZ x1, #1 // k Nb saut VAR GLOBALE
MOV x28,x29 // Copie du frame pointer dans x28 (temporaire)
BL get_global_var // k Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x0, [x29, #-48] // On récupère la valeur de la variable l
SUB sp, sp, #16 // l Mise en pile var
STR x0, [sp] // l Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
MOVZ x0, #48 // On met le deplacement en pile 
MOVZ x1, #4 // On met le nombre de saut en pile 
MOV x28,x29 // Copie du frame pointer dans x28 (temporaire)
BL set_global_var // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

// Opération
LDR x0, [x29, #-48] // On récupère la valeur de la variable l
SUB sp, sp, #16 // l Mise en pile var
STR x0, [sp] // l Mise en pile var
MOVZ x0, #1
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-48] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 
B while1706234378
whileend1706234378 :
ADD sp, sp, #48 // Décrémentation du pointeur de pile
LDR x29, [sp] // Restauration du chainage statique
ADD sp, sp, #16 // Le chainage statique ça dégage

// Opération
LDR x0, [x29, #-48] // On récupère la valeur de la variable k
SUB sp, sp, #16 // k Mise en pile var
STR x0, [sp] // k Mise en pile var
MOVZ x0, #1
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-48] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 
B while396873410
whileend396873410 :
ADD sp, sp, #48 // Décrémentation du pointeur de pile
LDR x29, [sp] // Restauration du chainage statique
ADD sp, sp, #16 // Le chainage statique ça dégage

// Opération
LDR x0, [x29, #-48] // On récupère la valeur de la variable j
SUB sp, sp, #16 // j Mise en pile var
STR x0, [sp] // j Mise en pile var
MOVZ x0, #1
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-48] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 
B while214126413
whileend214126413 :
ADD sp, sp, #48 // Décrémentation du pointeur de pile
LDR x29, [sp] // Restauration du chainage statique
ADD sp, sp, #16 // Le chainage statique ça dégage

// Opération
LDR x0, [x29, #-48] // On récupère la valeur de la variable i
SUB sp, sp, #16 // i Mise en pile var
STR x0, [sp] // i Mise en pile var
MOVZ x0, #1
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-48] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 
B while1198108795
whileend1198108795 :
ADD sp, sp, #48 // Décrémentation du pointeur de pile
LDR x29, [sp] // Restauration du chainage statique
ADD sp, sp, #16 // Le chainage statique ça dégage

// Return 
LDR x0, [x29, #-48] // On récupère la valeur de la variable res
SUB sp, sp, #16 // res Mise en pile var
STR x0, [sp] // res Mise en pile var
LDR x26, [sp] // Valeur de retour dans le registre x26
MOV sp, x29 // Restauration du pointeur de pile
LDP x29, lr, [sp, #-16] // Restauration du pointeur de pile et du lien de retour
RET // Retour de la fonction


