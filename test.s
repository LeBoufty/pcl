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
MOV x0, #2 // On met la constante dans x0 
STR x0, [x29, #4] // On stocke la valeur de la variable locale 
stp x29, x30, [sp, #-16]! // Sauvegarde des registres
str x0, [sp, #0] // Mettre le paramètre 0 dans la pile
str x0, [sp, #16] // Mettre le paramètre 1 dans la pile
bl F1 // Appel de la fonction
ldp x29, x30, [sp], #16 // Restauration des registres
MOV x0, x1 // Affectation 
STR x0, [x29, #4] // On stocke la valeur de la variable locale 
MOV x1, x0
ADD x0, x1, x0
MOV x0, x1 // Affectation 
STR x0, [x29, #4] // On stocke la valeur de la variable locale 
MOV x0, #1 // On met la constante dans x0 
MOV x0, -1 // On met le déplacement de la variable dans x0 
MOV x1, #1 // On met le nombre de saut dans x1 
BL loop_search_var_global_515 // On cherche la variable globale 

bl exit

exit : //Fonction de sortie du programme 
mov x0,#0
mov x8,#93
svc #0
ret


loop_search_var_global_515: ADD BP, BP, #8 // On passe à la variable suivante, x0 depl, x1 nb_saut
SUBS x1, x1, #1 // On décrémente le nombre de saut
BNE loop_search_var_global_515 // On boucle tant que x1 != 0
LDR x0, [BP, x0] // On charge la valeur de la variable
RET

F1 : // Début de la fonction
STP LR, X11, [SP, #-16]! // Sauvegarde LR
STP X10, XZR, [SP, #-16]! // Sauvegarde X10
SUB SP, SP, 4 // Réserve de l'espace pour les variables locales
MOV x1, x0
MUL x0, x1, x0
MOV x0, x1 // Affectation 
STR x0, [x29, #4] // On stocke la valeur de la variable locale 
ADD SP, SP, 4 // Libération de l'espace pour les variables locales
LDP X10, XZR, [SP], #16 // Restauration de X10
LDP LR, X11, [SP], #16 // Restauration de LR
RET // Retour de la fonction

F2 : // Début de la fonction
STP LR, X11, [SP, #-16]! // Sauvegarde LR
STP X10, XZR, [SP, #-16]! // Sauvegarde X10
SUB SP, SP, 4 // Réserve de l'espace pour les variables locales
MOV x1, x0
ADD x0, x1, x0
MOV x0, x1 // Affectation 
STR x0, [x29, #4] // On stocke la valeur de la variable locale 
ADD SP, SP, 4 // Libération de l'espace pour les variables locales
LDP X10, XZR, [SP], #16 // Restauration de X10
LDP LR, X11, [SP], #16 // Restauration de LR
RET // Retour de la fonction

