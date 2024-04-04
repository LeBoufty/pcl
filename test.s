.global F0
.extern printf // Import printf
.section .data

.section .text
F0 :

SUB sp, sp, #16 // On alloue de la place pour la variable 
STR x0, [x29, #4] // On stocke la valeur de la variable locale 
SUB sp, sp, #16 // On alloue de la place pour la variable 
STR x0, [x29, #4] // On stocke la valeur de la variable locale 
SUB sp, sp, #16 // On alloue de la place pour la variable 
STR x0, [x29, #4] // On stocke la valeur de la variable locale 
MOVZ x0, #5 // On met la constante en pile 
SUB sp, sp, #8 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x2, [sp] // On met la valeur de la variable droite dans x0 
STR x2, [x29, #-5] // On met la valeur de la variable droite dans la variable gauche 
MOVZ x0, #3 // On met la constante en pile 
SUB sp, sp, #8 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x2, [sp] // On met la valeur de la variable droite dans x0 
STR x2, [x29, #-4] // On met la valeur de la variable droite dans la variable gauche 

// Opération
MOVZ x0, #3 // On met la constante en pile 
SUB sp, sp, #8 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
MOVZ x0, #4 // On met la constante en pile 
SUB sp, sp, #8 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
POP {x1} // On met l'opérande droite dans x1
POP {x0} // On met l'opérande gauche dans x0
ADD x0, x0, x1 // On effectue l'opération
PUSH {x0} // On met le résultat en pile

LDR x2, [sp] // On met la valeur de la variable droite dans x0 
STR x2, [x29, #-3] // On met la valeur de la variable droite dans la variable gauche 

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

