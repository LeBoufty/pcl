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
SUB sp, sp, #32 // Déplacement du stack pointer pour fp et lr

// Declaration de la variable a
SUB sp, sp, #16 // Allocation de 16 octets pour la variable a


// Instructions de la procédure fonction
MOVZ x0, #10
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x2, [sp] // On met la valeur de la variable droite dans x0 
STR x2, [x29, #-48] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

stp x29, x30, [sp, #-16]! // Sauvegarde des registres
str x0, [sp, #0] // Mettre le paramètre 0 dans la pile
bl F1 // Appel de la fonction
ldp x29, x30, [sp], #16 // Restauration des registres
LDR x2, [sp] // On met la valeur de la variable droite dans x0 
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

F1 : // Début de la fonction
STP x29, lr, [sp, #-16] // Sauvegarde du pointeur de pile et du lien de retour
MOV x29, sp // Mise à jour du pointeur de pile
SUB sp, sp, #32 // Déplacement du stack pointer pour fp et lr
SUB SP, SP, 0 // Réserve de l'espace pour les variables locales
// Instructions de la fonction add100
// Printf
MOVN x0, #16 // Deplacement en pile VAR GLOBALE 
MOVZ x1, #1 // x Nb saut VAR GLOBALE
BL get_global_var // x Mise en pile var
STR x2, [sp, #0] // x Mise en pile var depuis le registre de retours des fonctions :)
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16


// Opération
MOVN x0, #16 // Deplacement en pile VAR GLOBALE 
MOVZ x1, #1 // x Nb saut VAR GLOBALE
BL get_global_var // x Mise en pile var
STR x2, [sp, #0] // x Mise en pile var depuis le registre de retours des fonctions :)
MOVZ x0, #100
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x2, [sp] // On met la valeur de la variable droite dans x0 
SUB sp, sp, #16 // On décrémente le pointeur de pile 
MOVN x0, #16 // On met le deplacement en pile 
MOVZ x1, #1 // On met le nombre de saut en pile 


ADD SP, SP, 0 // Libération de l'espace pour les variables locales
MOV sp, x29 // Restauration du pointeur de pile
LDP x29, lr, [sp, #16] // Restauration du pointeur de pile et du lien de retour
RET // Retour de la fonction

