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

// Définitions de la procédure fonction_extended
// Declaration de la variable a
SUB sp, sp, #16 // Allocation de 16 octets pour la variable a




// Instructions de la procédure fonction_extended
MOVZ x0, #0
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-48] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

// Appel de fonction add100
// Paramètre 0
LDR x0, [x29, #-48] // On récupère la valeur de la variable a
SUB sp, sp, #16 // a Mise en pile var
STR x0, [sp] // a Mise en pile var
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

// Printf
LDR x0, [x29, #-48] // On récupère la valeur de la variable a
SUB sp, sp, #16 // a Mise en pile var
STR x0, [sp] // a Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Appel de fonction add
// Paramètre 0
MOVZ x0, #10
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
// Paramètre 1
LDR x0, [x29, #-48] // On récupère la valeur de la variable a
SUB sp, sp, #16 // a Mise en pile var
STR x0, [sp] // a Mise en pile var
// Gestion du chainage statique
SUB sp, sp, #16 // Incrémentation du pointeur de pile
STR x29, [sp] // Sauvegarde du chainage statique
MOV x27, x29 // Mise à jour du chainage statique
BL F3 // Appel de la fonction
// Gestion du chainage statique
ADD sp, sp, #16 // Le chainage statique ça dégage
// Récupération du résultat
ADD sp, sp, #32 // Décrémentation du pointeur de pile de la taille des paramètres
SUB sp, sp, #16 // Réserve de l'espace pour le résultat
STR x26, [sp] // Sauvegarde du résultat
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

MOVZ x0, #17
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

// Appel de fonction times515
// Paramètre 0
LDR x0, [x29, #-48] // On récupère la valeur de la variable a
SUB sp, sp, #16 // a Mise en pile var
STR x0, [sp] // a Mise en pile var
// Gestion du chainage statique
SUB sp, sp, #16 // Incrémentation du pointeur de pile
STR x29, [sp] // Sauvegarde du chainage statique
MOV x27, x29 // Mise à jour du chainage statique
BL F4 // Appel de la fonction
// Gestion du chainage statique
ADD sp, sp, #16 // Le chainage statique ça dégage
// Récupération du résultat
ADD sp, sp, #16 // Décrémentation du pointeur de pile de la taille des paramètres
SUB sp, sp, #16 // Réserve de l'espace pour le résultat
STR x26, [sp] // Sauvegarde du résultat
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


B exit_program

exit_program : //Fonction de sortie du programme 
mov x0,#0
mov x8,#93
svc #0
ret

get_global_var : LDR x28, [x28] // On saute de chainage statique, x0 depl, x1 nb_saut
SUBS x1, x1, #1 // On décrémente le nombre de saut
BNE get_global_var // On boucle tant que x1 != 0
LDR x0, [x28, x0] // On charge la valeur de la variable
SUB sp,sp, #16 // On fait de la place dans la pile pour le retour
STR x0, [sp] // On met la valeur de la variable en pile
RET

set_global_var : LDR x28, [x28] // On saute de chainage statique, x0 depl, x1 nb_saut
SUBS x1, x1, #1 // On décrémente le nombre de saut
BNE set_global_var // On boucle tant que x1 != 0
STR x2, [x28, x0] // On charge la valeur de la variable
RET

erreur_division : // Fonction d'erreur de division
LDR x0, =erreur_division_msg // On charge le message d'erreur
BL printf // On affiche le message d'erreur
B exit_program // On quitte le programme

F2 : // Début de la fonction
STP x29, lr, [sp, #-16] // Sauvegarde du pointeur de pile et du lien de retour
MOV x29, sp // Mise à jour du pointeur de pile
SUB sp, sp, #32 // Déplacement du stack pointer pour fp et lr
// Définitions de la fonction add1
// Declaration de la variable res
SUB sp, sp, #16 // Allocation de 16 octets pour la variable res

// Instructions de la fonction add1
// if 793589513

// Opération
LDR x0, [x29, #32] // On récupère la valeur de la variable n
SUB sp, sp, #16 // n Mise en pile var
STR x0, [sp] // n Mise en pile var
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
BNE then793589513 // Branchement si la condition est vraie
// Appel de fonction add1
// Paramètre 0

// Opération
LDR x0, [x29, #32] // On récupère la valeur de la variable n
SUB sp, sp, #16 // n Mise en pile var
STR x0, [sp] // n Mise en pile var
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
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
// Gestion du chainage statique
SUB sp, sp, #16 // Incrémentation du pointeur de pile
STR x27, [sp] // Sauvegarde du chainage statique
BL F2 // Appel de la fonction
// Gestion du chainage statique
ADD sp, sp, #16 // Le chainage statique ça dégage
// Récupération du résultat
ADD sp, sp, #32 // Décrémentation du pointeur de pile de la taille des paramètres
SUB sp, sp, #16 // Réserve de l'espace pour le résultat
STR x26, [sp] // Sauvegarde du résultat
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-48] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 
B end793589513 // Branchement à la fin du if
then793589513 :
LDR x0, [x29, #16] // On récupère la valeur de la variable a
SUB sp, sp, #16 // a Mise en pile var
STR x0, [sp] // a Mise en pile var
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-48] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 
end793589513 :

// Return 
LDR x0, [x29, #-48] // On récupère la valeur de la variable res
SUB sp, sp, #16 // res Mise en pile var
STR x0, [sp] // res Mise en pile var
LDR x26, [sp] // Valeur de retour dans le registre x26
MOV sp, x29 // Restauration du pointeur de pile
LDP x29, lr, [sp, #-16] // Restauration du pointeur de pile et du lien de retour
RET // Retour de la fonction


F1 : // Début de la fonction
STP x29, lr, [sp, #-16] // Sauvegarde du pointeur de pile et du lien de retour
MOV x29, sp // Mise à jour du pointeur de pile
SUB sp, sp, #32 // Déplacement du stack pointer pour fp et lr
// Définitions de la fonction add100

// Instructions de la fonction add100
// Return 
// Appel de fonction add1
// Paramètre 0
MOVZ x0, #100
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
// Paramètre 1
LDR x0, [x29, #16] // On récupère la valeur de la variable a
SUB sp, sp, #16 // a Mise en pile var
STR x0, [sp] // a Mise en pile var
// Gestion du chainage statique
SUB sp, sp, #16 // Incrémentation du pointeur de pile
STR x29, [sp] // Sauvegarde du chainage statique
MOV x27, x29 // Mise à jour du chainage statique
BL F2 // Appel de la fonction
// Gestion du chainage statique
ADD sp, sp, #16 // Le chainage statique ça dégage
// Récupération du résultat
ADD sp, sp, #32 // Décrémentation du pointeur de pile de la taille des paramètres
SUB sp, sp, #16 // Réserve de l'espace pour le résultat
STR x26, [sp] // Sauvegarde du résultat
LDR x26, [sp] // Valeur de retour dans le registre x26
MOV sp, x29 // Restauration du pointeur de pile
LDP x29, lr, [sp, #-16] // Restauration du pointeur de pile et du lien de retour
RET // Retour de la fonction


F3 : // Début de la fonction
STP x29, lr, [sp, #-16] // Sauvegarde du pointeur de pile et du lien de retour
MOV x29, sp // Mise à jour du pointeur de pile
SUB sp, sp, #32 // Déplacement du stack pointer pour fp et lr
// Définitions de la fonction add
// Declaration de la variable pas
SUB sp, sp, #16 // Allocation de 16 octets pour la variable pas

// Declaration de la variable res
SUB sp, sp, #16 // Allocation de 16 octets pour la variable res

// Instructions de la fonction add
MOVZ x0, #1
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-48] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

// if 1349393271

// Opération
LDR x0, [x29, #32] // On récupère la valeur de la variable n
SUB sp, sp, #16 // n Mise en pile var
STR x0, [sp] // n Mise en pile var
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
BNE then1349393271 // Branchement si la condition est vraie
// Appel de fonction add
// Paramètre 0

// Opération
LDR x0, [x29, #32] // On récupère la valeur de la variable n
SUB sp, sp, #16 // n Mise en pile var
STR x0, [sp] // n Mise en pile var
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

// Opération
LDR x0, [x29, #16] // On récupère la valeur de la variable a
SUB sp, sp, #16 // a Mise en pile var
STR x0, [sp] // a Mise en pile var
LDR x0, [x29, #-48] // On récupère la valeur de la variable pas
SUB sp, sp, #16 // pas Mise en pile var
STR x0, [sp] // pas Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
// Gestion du chainage statique
SUB sp, sp, #16 // Incrémentation du pointeur de pile
STR x27, [sp] // Sauvegarde du chainage statique
BL F3 // Appel de la fonction
// Gestion du chainage statique
ADD sp, sp, #16 // Le chainage statique ça dégage
// Récupération du résultat
ADD sp, sp, #32 // Décrémentation du pointeur de pile de la taille des paramètres
SUB sp, sp, #16 // Réserve de l'espace pour le résultat
STR x26, [sp] // Sauvegarde du résultat
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-64] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 
B end1349393271 // Branchement à la fin du if
then1349393271 :
LDR x0, [x29, #16] // On récupère la valeur de la variable a
SUB sp, sp, #16 // a Mise en pile var
STR x0, [sp] // a Mise en pile var
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-64] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 
end1349393271 :

// Return 
LDR x0, [x29, #-64] // On récupère la valeur de la variable res
SUB sp, sp, #16 // res Mise en pile var
STR x0, [sp] // res Mise en pile var
LDR x26, [sp] // Valeur de retour dans le registre x26
MOV sp, x29 // Restauration du pointeur de pile
LDP x29, lr, [sp, #-16] // Restauration du pointeur de pile et du lien de retour
RET // Retour de la fonction


F5 : // Début de la fonction
STP x29, lr, [sp, #-16] // Sauvegarde du pointeur de pile et du lien de retour
MOV x29, sp // Mise à jour du pointeur de pile
SUB sp, sp, #32 // Déplacement du stack pointer pour fp et lr
// Définitions de la fonction add515
// Instructions de la fonction add515
// if 1338668845

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
BNE then1338668845 // Branchement si la condition est vraie
// Return 

// Opération
MOVZ x0, #48 // Deplacement en pile VAR GLOBALE 
MOVZ x1, #1 // b Nb saut VAR GLOBALE
MOV x28,x29 // Copie du frame pointer dans x28 (temporaire)
BL get_global_var // b Mise en pile var
// Appel de fonction add515
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
BL F5 // Appel de la fonction
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
B end1338668845 // Branchement à la fin du if
then1338668845 :
// Return 
MOVZ x0, #0
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x26, [sp] // Valeur de retour dans le registre x26
MOV sp, x29 // Restauration du pointeur de pile
LDP x29, lr, [sp, #-16] // Restauration du pointeur de pile et du lien de retour
RET // Retour de la fonction
end1338668845 :

// Return 
MOVZ x0, #0
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x26, [sp] // Valeur de retour dans le registre x26
MOV sp, x29 // Restauration du pointeur de pile
LDP x29, lr, [sp, #-16] // Restauration du pointeur de pile et du lien de retour
RET // Retour de la fonction


F4 : // Début de la fonction
STP x29, lr, [sp, #-16] // Sauvegarde du pointeur de pile et du lien de retour
MOV x29, sp // Mise à jour du pointeur de pile
SUB sp, sp, #32 // Déplacement du stack pointer pour fp et lr
// Définitions de la fonction times515
// Declaration de la variable b
SUB sp, sp, #16 // Allocation de 16 octets pour la variable b


// Instructions de la fonction times515
MOVZ x0, #515
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-48] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

// Return 
// Appel de fonction add515
// Paramètre 0
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
ADD sp, sp, #16 // Décrémentation du pointeur de pile de la taille des paramètres
SUB sp, sp, #16 // Réserve de l'espace pour le résultat
STR x26, [sp] // Sauvegarde du résultat
LDR x26, [sp] // Valeur de retour dans le registre x26
MOV sp, x29 // Restauration du pointeur de pile
LDP x29, lr, [sp, #-16] // Restauration du pointeur de pile et du lien de retour
RET // Retour de la fonction


