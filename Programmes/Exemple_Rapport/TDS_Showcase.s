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

// Définitions de la procédure tds_showcase


// Instructions de la procédure tds_showcase
// Paramètre 0
MOVZ x0, #5
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
// Gestion du chainage statique
SUB sp, sp, #16 // Incrémentation du pointeur de pile
STR x29, [sp] // Sauvegarde du chainage statique
MOV x27, x29 // Mise à jour du chainage statique
BL P2 // Appel de la procedure
// Gestion du chainage statique
ADD sp, sp, #16 // Le chainage statique ça dégage

MOVZ x0, #1
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-48] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

// while 159413332
while159413332 :

// Opération
LDR x0, [x29, #-48] // On récupère la valeur de la variable i
SUB sp, sp, #16 // i Mise en pile var
STR x0, [sp] // i Mise en pile var
MOVZ x0, #10
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

BNE whilecontinue159413332
B whileend159413332
whilecontinue159413332 :
// Appel de fonction fonction_a
// Paramètre 0
LDR x0, [x29, #-48] // On récupère la valeur de la variable i
SUB sp, sp, #16 // i Mise en pile var
STR x0, [sp] // i Mise en pile var
// Gestion du chainage statique
SUB sp, sp, #16 // Incrémentation du pointeur de pile
STR x29, [sp] // Sauvegarde du chainage statique
MOV x27, x29 // Mise à jour du chainage statique
BL F1 // Appel de la fonction
// Gestion du chainage statique
ADD sp, sp, #16 // Le chainage statique ça dégage
// Récupération du résultat
ADD sp, sp, #16 // Décrémentation du pointeur de pile de la taille des paramètres
SUB sp, sp, #16 // Réserve de l'espace pour le résultat
STR x26, [sp] // Sauvegarde du résultat
// Printf
// Appel de fonction fonction_a
// Paramètre 0
LDR x0, [x29, #-48] // On récupère la valeur de la variable i
SUB sp, sp, #16 // i Mise en pile var
STR x0, [sp] // i Mise en pile var
// Gestion du chainage statique
SUB sp, sp, #16 // Incrémentation du pointeur de pile
STR x29, [sp] // Sauvegarde du chainage statique
MOV x27, x29 // Mise à jour du chainage statique
BL F1 // Appel de la fonction
// Gestion du chainage statique
ADD sp, sp, #16 // Le chainage statique ça dégage
// Récupération du résultat
ADD sp, sp, #16 // Décrémentation du pointeur de pile de la taille des paramètres
SUB sp, sp, #16 // Réserve de l'espace pour le résultat
STR x26, [sp] // Sauvegarde du résultat
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

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
B while159413332
whileend159413332 :


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
// Définitions de la fonction fonction_a
// Declaration de la variable variable_a
MOVZ x0, #0
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Instructions de la fonction fonction_a
// Return 

// Opération
LDR x0, [x29, #-48] // On récupère la valeur de la variable variable_a
SUB sp, sp, #16 // variable_a Mise en pile var
STR x0, [sp] // variable_a Mise en pile var
LDR x0, [x29, #16] // On récupère la valeur de la variable parametre_a
SUB sp, sp, #16 // parametre_a Mise en pile var
STR x0, [sp] // parametre_a Mise en pile var
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


F3 : // Début de la fonction
STP x29, lr, [sp, #-16] // Sauvegarde du pointeur de pile et du lien de retour
MOV x29, sp // Mise à jour du pointeur de pile
SUB sp, sp, #32 // Déplacement du stack pointer pour fp et lr
// Définitions de la fonction fonction_c
// Declaration de la variable variable_c
MOVZ x0, #0
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Instructions de la fonction fonction_c
// Return 

// Opération
LDR x0, [x29, #-48] // On récupère la valeur de la variable variable_c
SUB sp, sp, #16 // variable_c Mise en pile var
STR x0, [sp] // variable_c Mise en pile var
LDR x0, [x29, #16] // On récupère la valeur de la variable parametre_c
SUB sp, sp, #16 // parametre_c Mise en pile var
STR x0, [sp] // parametre_c Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
SUB x0, x0, x1 // Opération -
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x26, [sp] // Valeur de retour dans le registre x26
MOV sp, x29 // Restauration du pointeur de pile
LDP x29, lr, [sp, #-16] // Restauration du pointeur de pile et du lien de retour
RET // Retour de la fonction


// Procédure procedure_b
P2 :
STP x29, lr, [sp, #-16] // Sauvegarde du pointeur de pile et du lien de retour
MOV x29, sp // Mise à jour du pointeur de pile
SUB sp, sp, #32 // Déplacement du stack pointer pour fp et lr
// Définitions de la procédure procedure_b
// Declaration de la variable variable_b
MOVZ x0, #0
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 


// Instructions de la procédure procedure_b
// Appel de fonction fonction_a
// Paramètre 0
LDR x0, [x29, #16] // On récupère la valeur de la variable parametre_b
SUB sp, sp, #16 // parametre_b Mise en pile var
STR x0, [sp] // parametre_b Mise en pile var
// Gestion du chainage statique
SUB sp, sp, #16 // Incrémentation du pointeur de pile
STR x29, [sp] // Sauvegarde du chainage statique
MOV x27, x29 // Mise à jour du chainage statique
BL F1 // Appel de la fonction
// Gestion du chainage statique
ADD sp, sp, #16 // Le chainage statique ça dégage
// Récupération du résultat
ADD sp, sp, #16 // Décrémentation du pointeur de pile de la taille des paramètres
SUB sp, sp, #16 // Réserve de l'espace pour le résultat
STR x26, [sp] // Sauvegarde du résultat
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-48] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 


// Opération
LDR x0, [x29, #-48] // On récupère la valeur de la variable variable_b
SUB sp, sp, #16 // variable_b Mise en pile var
STR x0, [sp] // variable_b Mise en pile var
// Appel de fonction fonction_c
// Paramètre 0
LDR x0, [x29, #16] // On récupère la valeur de la variable parametre_b
SUB sp, sp, #16 // parametre_b Mise en pile var
STR x0, [sp] // parametre_b Mise en pile var
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

// Printf
LDR x0, [x29, #-48] // On récupère la valeur de la variable variable_b
SUB sp, sp, #16 // variable_b Mise en pile var
STR x0, [sp] // variable_b Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

MOV sp, x29 // Restauration du pointeur de pile
LDP x29, lr, [sp, #-16] // Restauration du pointeur de pile et du lien de retour
RET // Retour de la fonction

