.global F0
.extern printf // Import printf
.section .data

.section .text
F0 :

// Declaration de la variable a
SUB sp, sp, #8 // Allocation de 8 octets pour la variable a

// Declaration de la variable y
MOVZ x0, #100 // On met la constante en pile 
SUB sp, sp, #8 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable z
SUB sp, sp, #8 // Allocation de 8 octets pour la variable z

// Instructions de la procédure addition1
MOVZ x0, #5 // On met la constante en pile 
SUB sp, sp, #8 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x2, [sp] // On met la valeur de la variable droite dans x0 
STR x2, [x29, #-40] // On met la valeur de la variable droite dans la variable gauche 

MOVZ x0, #3 // On met la constante en pile 
SUB sp, sp, #8 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x2, [sp] // On met la valeur de la variable droite dans x0 
STR x2, [x29, #-32] // On met la valeur de la variable droite dans la variable gauche 


// Opération
MOVZ x0, #3 // On met la constante en pile 
SUB sp, sp, #8 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
MOVZ x0, #4 // On met la constante en pile 
SUB sp, sp, #8 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #8 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #8 // On décrémente le pointeur de pile
ADD x0, x0, x1 // On effectue l'opération
SUB sp, sp, #8 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x2, [sp] // On met la valeur de la variable droite dans x0 
STR x2, [x29, #-24] // On met la valeur de la variable droite dans la variable gauche 

// Printf
LDR x0, [x29, #-32] // y Mise en pile var
SUB sp, sp, #8 // y Mise en pile var
STR x0, [sp] // y Mise en pile var
bl printf
ADD sp, sp, #8 // On dépile la valeur


bl exit

exit : //Fonction de sortie du programme 
mov x0,#0
mov x8,#93
svc #0
ret


get_global_var : ADD fp, fp, #8 // On passe à la variable suivante, x0 depl, x1 nb_saut
SUBS x1, x1, #1 // On décrémente le nombre de saut
BNE get_global_var // On boucle tant que x1 != 0
LDR x0, [fp, x0] // On charge la valeur de la variable
SUB sp,sp, #8 // On fait de la place dans la pile pour le retour
STR x0, [sp] // On met la valeur de la variable en pile
RET

set_global_var : ADD fp, fp, #8 // On passe à la variable suivante, x0 depl, x1 nb_saut
SUBS x1, x1, #1 // On décrémente le nombre de saut
BNE set_global_var // On boucle tant que x1 != 0
STR x2, [fp, x0] // On charge la valeur de la variable
RET

