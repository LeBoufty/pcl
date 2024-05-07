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

// Instructions de la procédure forr
MOVZ x0, #1
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x2, [sp] // On met la valeur de la variable droite dans x0 
SUB sp, sp, #16 // On décrémente le pointeur de pile 
MOVZ x0, #48 // On met le deplacement en pile 
MOVZ x1, #1 // On met le nombre de saut en pile 

// while 363771819
while363771819 :

// Opération
MOVZ x0, #48 // Deplacement en pile VAR GLOBALE 
MOVZ x1, #1 // i Nb saut VAR GLOBALE
BL get_global_var // i Mise en pile var
STR x2, [sp, #0] // i Mise en pile var depuis le registre de retours des fonctions :)
MOVZ x0, #5
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
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

BNE whilecontinue363771819
B whileend363771819
whilecontinue363771819 :
// Printf
MOVZ x0, #48 // Deplacement en pile VAR GLOBALE 
MOVZ x1, #1 // i Nb saut VAR GLOBALE
BL get_global_var // i Mise en pile var
STR x2, [sp, #0] // i Mise en pile var depuis le registre de retours des fonctions :)
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Opération
MOVZ x0, #48 // Deplacement en pile VAR GLOBALE 
MOVZ x1, #1 // i Nb saut VAR GLOBALE
BL get_global_var // i Mise en pile var
STR x2, [sp, #0] // i Mise en pile var depuis le registre de retours des fonctions :)
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
LDR x2, [sp] // On met la valeur de la variable droite dans x0 
SUB sp, sp, #16 // On décrémente le pointeur de pile 
MOVZ x0, #48 // On met le deplacement en pile 
MOVZ x1, #1 // On met le nombre de saut en pile 
B while363771819
whileend363771819 :


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

