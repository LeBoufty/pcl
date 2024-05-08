.global main
.extern printf // Import printf
.section .data
format :
.string "%d\n"
erreur_division_msg :
.string "Erreur : division par zéro\n"

format_char :
.string "%c\n"

.section .text
main :

STP x29, lr, [sp, #-16] // Sauvegarde du pointeur de pile et du lien de retour
MOV x29, sp // Mise à jour du pointeur de pile
STR x29, [sp]
SUB sp, sp, #32 // Déplacement du stack pointer pour fp et lr

// Définitions de la procédure diff_tribo_fibo
// Declaration de la variable n
SUB sp, sp, #16 // Allocation de 16 octets pour la variable n


// Instructions de la procédure diff_tribo_fibo
MOVZ x0, #30
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-48] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

MOVZ x0, #2
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-48] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

// while 1072408673
while1072408673 :

// Opération
LDR x0, [x29, #-48] // On récupère la valeur de la variable i
SUB sp, sp, #16 // i Mise en pile var
STR x0, [sp] // i Mise en pile var
MOVZ x0, #48 // Deplacement en pile VAR GLOBALE 
MOVZ x1, #1 // n Nb saut VAR GLOBALE
MOV x28,x29 // Copie du frame pointer dans x28 (temporaire)
BL get_global_var // n Mise en pile var
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

BNE whilecontinue1072408673
B whileend1072408673
whilecontinue1072408673 :
// Printf
MOVZ x0, #110
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
MOV x1, x0
ADRP x0, format_char
ADD x0, x0, :lo12:format_char
BL printf
ADD sp, sp, #16
// Printf
MOVZ x0, #48 // Deplacement en pile VAR GLOBALE 
MOVZ x1, #1 // n Nb saut VAR GLOBALE
MOV x28,x29 // Copie du frame pointer dans x28 (temporaire)
BL get_global_var // n Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16
// Paramètre 0
LDR x0, [x29, #-48] // On récupère la valeur de la variable i
SUB sp, sp, #16 // i Mise en pile var
STR x0, [sp] // i Mise en pile var
// Gestion du chainage statique
SUB sp, sp, #16 // Incrémentation du pointeur de pile
STR x29, [sp] // Sauvegarde du chainage statique
MOV x27, x29 // Mise à jour du chainage statique
BL P1 // Appel de la procedure
// Gestion du chainage statique
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
B while1072408673
whileend1072408673 :


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

F2 : // Début de la fonction
STP x29, lr, [sp, #-16] // Sauvegarde du pointeur de pile et du lien de retour
MOV x29, sp // Mise à jour du pointeur de pile
SUB sp, sp, #32 // Déplacement du stack pointer pour fp et lr
// Définitions de la fonction fibonacci
// Instructions de la fonction fibonacci
// if 999966131

// Opération
LDR x0, [x29, #16] // On récupère la valeur de la variable n
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
BNE then999966131 // Branchement si la condition est vraie
// Return 
// Appel de fonction fibonacci
// Paramètre 0

// Opération
LDR x0, [x29, #32] // On récupère la valeur de la variable x1
SUB sp, sp, #16 // x1 Mise en pile var
STR x0, [sp] // x1 Mise en pile var
LDR x0, [x29, #48] // On récupère la valeur de la variable x2
SUB sp, sp, #16 // x2 Mise en pile var
STR x0, [sp] // x2 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
// Paramètre 1
LDR x0, [x29, #48] // On récupère la valeur de la variable x2
SUB sp, sp, #16 // x2 Mise en pile var
STR x0, [sp] // x2 Mise en pile var
// Paramètre 2

// Opération
LDR x0, [x29, #16] // On récupère la valeur de la variable n
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
// Gestion du chainage statique
SUB sp, sp, #16 // Incrémentation du pointeur de pile
STR x27, [sp] // Sauvegarde du chainage statique
BL F2 // Appel de la fonction
// Gestion du chainage statique
ADD sp, sp, #16 // Le chainage statique ça dégage
// Récupération du résultat
ADD sp, sp, #48 // Décrémentation du pointeur de pile de la taille des paramètres
SUB sp, sp, #16 // Réserve de l'espace pour le résultat
STR x26, [sp] // Sauvegarde du résultat
LDR x26, [sp] // Valeur de retour dans le registre x26
MOV sp, x29 // Restauration du pointeur de pile
LDP x29, lr, [sp, #-16] // Restauration du pointeur de pile et du lien de retour
RET // Retour de la fonction
B end999966131 // Branchement à la fin du if
then999966131 :
// Return 
LDR x0, [x29, #32] // On récupère la valeur de la variable x1
SUB sp, sp, #16 // x1 Mise en pile var
STR x0, [sp] // x1 Mise en pile var
LDR x26, [sp] // Valeur de retour dans le registre x26
MOV sp, x29 // Restauration du pointeur de pile
LDP x29, lr, [sp, #-16] // Restauration du pointeur de pile et du lien de retour
RET // Retour de la fonction
end999966131 :

// Return 
MOVZ x0, #0
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x26, [sp] // Valeur de retour dans le registre x26
MOV sp, x29 // Restauration du pointeur de pile
LDP x29, lr, [sp, #-16] // Restauration du pointeur de pile et du lien de retour
RET // Retour de la fonction


F3 : // Début de la fonction
STP x29, lr, [sp, #-16] // Sauvegarde du pointeur de pile et du lien de retour
MOV x29, sp // Mise à jour du pointeur de pile
SUB sp, sp, #32 // Déplacement du stack pointer pour fp et lr
// Définitions de la fonction tribonacci
// Instructions de la fonction tribonacci
// if 1329552164

// Opération
LDR x0, [x29, #16] // On récupère la valeur de la variable n
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
BNE then1329552164 // Branchement si la condition est vraie
// if 363771819

// Opération
LDR x0, [x29, #16] // On récupère la valeur de la variable n
SUB sp, sp, #16 // n Mise en pile var
STR x0, [sp] // n Mise en pile var
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
LDR x0, [sp] // Chargement de la condition
ADD sp, sp, #16 // Décrémentation du pointeur de pile
CMP x0, #0 // Comparaison de la condition
BNE then363771819 // Branchement si la condition est vraie
// if 2065951873

// Opération
LDR x0, [x29, #16] // On récupère la valeur de la variable n
SUB sp, sp, #16 // n Mise en pile var
STR x0, [sp] // n Mise en pile var
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
LDR x0, [sp] // Chargement de la condition
ADD sp, sp, #16 // Décrémentation du pointeur de pile
CMP x0, #0 // Comparaison de la condition
BNE then2065951873 // Branchement si la condition est vraie
// Return 
// Appel de fonction tribonacci
// Paramètre 0

// Opération

// Opération
LDR x0, [x29, #32] // On récupère la valeur de la variable x1
SUB sp, sp, #16 // x1 Mise en pile var
STR x0, [sp] // x1 Mise en pile var
LDR x0, [x29, #48] // On récupère la valeur de la variable x2
SUB sp, sp, #16 // x2 Mise en pile var
STR x0, [sp] // x2 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x0, [x29, #64] // On récupère la valeur de la variable x3
SUB sp, sp, #16 // x3 Mise en pile var
STR x0, [sp] // x3 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
// Paramètre 1
LDR x0, [x29, #64] // On récupère la valeur de la variable x3
SUB sp, sp, #16 // x3 Mise en pile var
STR x0, [sp] // x3 Mise en pile var
// Paramètre 2
LDR x0, [x29, #48] // On récupère la valeur de la variable x2
SUB sp, sp, #16 // x2 Mise en pile var
STR x0, [sp] // x2 Mise en pile var
// Paramètre 3

// Opération
LDR x0, [x29, #16] // On récupère la valeur de la variable n
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
// Gestion du chainage statique
SUB sp, sp, #16 // Incrémentation du pointeur de pile
STR x27, [sp] // Sauvegarde du chainage statique
BL F3 // Appel de la fonction
// Gestion du chainage statique
ADD sp, sp, #16 // Le chainage statique ça dégage
// Récupération du résultat
ADD sp, sp, #64 // Décrémentation du pointeur de pile de la taille des paramètres
SUB sp, sp, #16 // Réserve de l'espace pour le résultat
STR x26, [sp] // Sauvegarde du résultat
LDR x26, [sp] // Valeur de retour dans le registre x26
MOV sp, x29 // Restauration du pointeur de pile
LDP x29, lr, [sp, #-16] // Restauration du pointeur de pile et du lien de retour
RET // Retour de la fonction
B end2065951873 // Branchement à la fin du if
then2065951873 :
// Return 
LDR x0, [x29, #64] // On récupère la valeur de la variable x3
SUB sp, sp, #16 // x3 Mise en pile var
STR x0, [sp] // x3 Mise en pile var
LDR x26, [sp] // Valeur de retour dans le registre x26
MOV sp, x29 // Restauration du pointeur de pile
LDP x29, lr, [sp, #-16] // Restauration du pointeur de pile et du lien de retour
RET // Retour de la fonction
end2065951873 :
B end363771819 // Branchement à la fin du if
then363771819 :
// Return 
LDR x0, [x29, #48] // On récupère la valeur de la variable x2
SUB sp, sp, #16 // x2 Mise en pile var
STR x0, [sp] // x2 Mise en pile var
LDR x26, [sp] // Valeur de retour dans le registre x26
MOV sp, x29 // Restauration du pointeur de pile
LDP x29, lr, [sp, #-16] // Restauration du pointeur de pile et du lien de retour
RET // Retour de la fonction
end363771819 :
B end1329552164 // Branchement à la fin du if
then1329552164 :
// Return 
LDR x0, [x29, #32] // On récupère la valeur de la variable x1
SUB sp, sp, #16 // x1 Mise en pile var
STR x0, [sp] // x1 Mise en pile var
LDR x26, [sp] // Valeur de retour dans le registre x26
MOV sp, x29 // Restauration du pointeur de pile
LDP x29, lr, [sp, #-16] // Restauration du pointeur de pile et du lien de retour
RET // Retour de la fonction
end1329552164 :

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
// Définitions de la fonction get_acceleration
// Instructions de la fonction get_acceleration
// Return 

// Opération

// Opération

// Opération
LDR x0, [x29, #48] // On récupère la valeur de la variable f2
SUB sp, sp, #16 // f2 Mise en pile var
STR x0, [sp] // f2 Mise en pile var

// Opération
MOVZ x0, #2
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x0, [x29, #32] // On récupère la valeur de la variable f1
SUB sp, sp, #16 // f1 Mise en pile var
STR x0, [sp] // f1 Mise en pile var
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
SUB x0, x0, x1 // Opération -
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x0, [x29, #16] // On récupère la valeur de la variable f0
SUB sp, sp, #16 // f0 Mise en pile var
STR x0, [sp] // f0 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile

// Opération

// Opération
LDR x0, [x29, #80] // On récupère la valeur de la variable n2
SUB sp, sp, #16 // n2 Mise en pile var
STR x0, [sp] // n2 Mise en pile var
LDR x0, [x29, #64] // On récupère la valeur de la variable n1
SUB sp, sp, #16 // n1 Mise en pile var
STR x0, [sp] // n1 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
SUB x0, x0, x1 // Opération -
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile

// Opération
MOVZ x0, #0 // On met le deplacement en pile 
ADD x0, x0, #-16 // On met le deplacement en pile 
MOVZ x1, #1 // n Nb saut VAR GLOBALE
MOV x28,x29 // Copie du frame pointer dans x28 (temporaire)
BL get_global_var // n Mise en pile var
LDR x0, [x29, #64] // On récupère la valeur de la variable n1
SUB sp, sp, #16 // n1 Mise en pile var
STR x0, [sp] // n1 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
SUB x0, x0, x1 // Opération -
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
CMP x1, #0 // Opération /, on vérifie que le diviseur n'est pas nul
BEQ erreur_division // Opération /, on arrête le programme si c'est le cas
SDIV x0, x0, x1 // Opération /
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x26, [sp] // Valeur de retour dans le registre x26
MOV sp, x29 // Restauration du pointeur de pile
LDP x29, lr, [sp, #-16] // Restauration du pointeur de pile et du lien de retour
RET // Retour de la fonction


// Procédure acc_fib_trib
P1 :
STP x29, lr, [sp, #-16] // Sauvegarde du pointeur de pile et du lien de retour
MOV x29, sp // Mise à jour du pointeur de pile
SUB sp, sp, #32 // Déplacement du stack pointer pour fp et lr
// Définitions de la procédure acc_fib_trib
// Declaration de la variable trib
SUB sp, sp, #16 // Allocation de 16 octets pour la variable trib

// Declaration de la variable fib
SUB sp, sp, #16 // Allocation de 16 octets pour la variable fib

// Declaration de la variable f0
SUB sp, sp, #16 // Allocation de 16 octets pour la variable f0

// Declaration de la variable f1
SUB sp, sp, #16 // Allocation de 16 octets pour la variable f1

// Declaration de la variable f2
SUB sp, sp, #16 // Allocation de 16 octets pour la variable f2




// Instructions de la procédure acc_fib_trib
// Appel de fonction fibonacci
// Paramètre 0
MOVZ x0, #1
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
// Paramètre 1
MOVZ x0, #0
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
// Paramètre 2
LDR x0, [x29, #16] // On récupère la valeur de la variable n
SUB sp, sp, #16 // n Mise en pile var
STR x0, [sp] // n Mise en pile var
// Gestion du chainage statique
SUB sp, sp, #16 // Incrémentation du pointeur de pile
STR x29, [sp] // Sauvegarde du chainage statique
MOV x27, x29 // Mise à jour du chainage statique
BL F2 // Appel de la fonction
// Gestion du chainage statique
ADD sp, sp, #16 // Le chainage statique ça dégage
// Récupération du résultat
ADD sp, sp, #48 // Décrémentation du pointeur de pile de la taille des paramètres
SUB sp, sp, #16 // Réserve de l'espace pour le résultat
STR x26, [sp] // Sauvegarde du résultat
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-64] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

// Printf
MOVZ x0, #102
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
MOV x1, x0
ADRP x0, format_char
ADD x0, x0, :lo12:format_char
BL printf
ADD sp, sp, #16

// Printf
LDR x0, [x29, #-64] // On récupère la valeur de la variable fib
SUB sp, sp, #16 // fib Mise en pile var
STR x0, [sp] // fib Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Appel de fonction tribonacci
// Paramètre 0
MOVZ x0, #1
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
// Paramètre 1
MOVZ x0, #1
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
// Paramètre 2
MOVZ x0, #0
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
// Paramètre 3
LDR x0, [x29, #16] // On récupère la valeur de la variable n
SUB sp, sp, #16 // n Mise en pile var
STR x0, [sp] // n Mise en pile var
// Gestion du chainage statique
SUB sp, sp, #16 // Incrémentation du pointeur de pile
STR x29, [sp] // Sauvegarde du chainage statique
MOV x27, x29 // Mise à jour du chainage statique
BL F3 // Appel de la fonction
// Gestion du chainage statique
ADD sp, sp, #16 // Le chainage statique ça dégage
// Récupération du résultat
ADD sp, sp, #64 // Décrémentation du pointeur de pile de la taille des paramètres
SUB sp, sp, #16 // Réserve de l'espace pour le résultat
STR x26, [sp] // Sauvegarde du résultat
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-48] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

// Printf
MOVZ x0, #116
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
MOV x1, x0
ADRP x0, format_char
ADD x0, x0, :lo12:format_char
BL printf
ADD sp, sp, #16

// Printf
LDR x0, [x29, #-48] // On récupère la valeur de la variable trib
SUB sp, sp, #16 // trib Mise en pile var
STR x0, [sp] // trib Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
MOVZ x0, #100
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
MOV x1, x0
ADRP x0, format_char
ADD x0, x0, :lo12:format_char
BL printf
ADD sp, sp, #16

// Printf

// Opération
LDR x0, [x29, #-48] // On récupère la valeur de la variable trib
SUB sp, sp, #16 // trib Mise en pile var
STR x0, [sp] // trib Mise en pile var
LDR x0, [x29, #-64] // On récupère la valeur de la variable fib
SUB sp, sp, #16 // fib Mise en pile var
STR x0, [sp] // fib Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
SUB x0, x0, x1 // Opération -
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// if 1791741888

// Opération
LDR x0, [x29, #16] // On récupère la valeur de la variable n
SUB sp, sp, #16 // n Mise en pile var
STR x0, [sp] // n Mise en pile var
MOVZ x0, #1
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
CMP x0, x1 // Opération >
CSET x0, GT // Opération >
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x0, [sp] // Chargement de la condition
ADD sp, sp, #16 // Décrémentation du pointeur de pile
CMP x0, #0 // Comparaison de la condition
BNE then1791741888 // Branchement si la condition est vraie
B end1791741888 // Branchement à la fin du if
then1791741888 :

// Opération
// Appel de fonction tribonacci
// Paramètre 0
MOVZ x0, #1
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
// Paramètre 1
MOVZ x0, #1
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
// Paramètre 2
MOVZ x0, #0
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
// Paramètre 3

// Opération
LDR x0, [x29, #16] // On récupère la valeur de la variable n
SUB sp, sp, #16 // n Mise en pile var
STR x0, [sp] // n Mise en pile var
MOVZ x0, #2
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
STR x29, [sp] // Sauvegarde du chainage statique
MOV x27, x29 // Mise à jour du chainage statique
BL F3 // Appel de la fonction
// Gestion du chainage statique
ADD sp, sp, #16 // Le chainage statique ça dégage
// Récupération du résultat
ADD sp, sp, #64 // Décrémentation du pointeur de pile de la taille des paramètres
SUB sp, sp, #16 // Réserve de l'espace pour le résultat
STR x26, [sp] // Sauvegarde du résultat
// Appel de fonction fibonacci
// Paramètre 0
MOVZ x0, #1
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
// Paramètre 1
MOVZ x0, #0
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
// Paramètre 2

// Opération
LDR x0, [x29, #16] // On récupère la valeur de la variable n
SUB sp, sp, #16 // n Mise en pile var
STR x0, [sp] // n Mise en pile var
MOVZ x0, #2
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
STR x29, [sp] // Sauvegarde du chainage statique
MOV x27, x29 // Mise à jour du chainage statique
BL F2 // Appel de la fonction
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
SUB x0, x0, x1 // Opération -
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-80] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

// Opération
// Appel de fonction tribonacci
// Paramètre 0
MOVZ x0, #1
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
// Paramètre 1
MOVZ x0, #1
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
// Paramètre 2
MOVZ x0, #0
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
// Paramètre 3

// Opération
LDR x0, [x29, #16] // On récupère la valeur de la variable n
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
// Gestion du chainage statique
SUB sp, sp, #16 // Incrémentation du pointeur de pile
STR x29, [sp] // Sauvegarde du chainage statique
MOV x27, x29 // Mise à jour du chainage statique
BL F3 // Appel de la fonction
// Gestion du chainage statique
ADD sp, sp, #16 // Le chainage statique ça dégage
// Récupération du résultat
ADD sp, sp, #64 // Décrémentation du pointeur de pile de la taille des paramètres
SUB sp, sp, #16 // Réserve de l'espace pour le résultat
STR x26, [sp] // Sauvegarde du résultat
// Appel de fonction fibonacci
// Paramètre 0
MOVZ x0, #1
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
// Paramètre 1
MOVZ x0, #0
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
// Paramètre 2

// Opération
LDR x0, [x29, #16] // On récupère la valeur de la variable n
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
// Gestion du chainage statique
SUB sp, sp, #16 // Incrémentation du pointeur de pile
STR x29, [sp] // Sauvegarde du chainage statique
MOV x27, x29 // Mise à jour du chainage statique
BL F2 // Appel de la fonction
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
SUB x0, x0, x1 // Opération -
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-96] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

// Opération
LDR x0, [x29, #-48] // On récupère la valeur de la variable trib
SUB sp, sp, #16 // trib Mise en pile var
STR x0, [sp] // trib Mise en pile var
LDR x0, [x29, #-64] // On récupère la valeur de la variable fib
SUB sp, sp, #16 // fib Mise en pile var
STR x0, [sp] // fib Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
SUB x0, x0, x1 // Opération -
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-112] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 
// Printf
MOVZ x0, #97
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
MOV x1, x0
ADRP x0, format_char
ADD x0, x0, :lo12:format_char
BL printf
ADD sp, sp, #16
// Printf
// Appel de fonction get_acceleration
// Paramètre 0
LDR x0, [x29, #16] // On récupère la valeur de la variable n
SUB sp, sp, #16 // n Mise en pile var
STR x0, [sp] // n Mise en pile var
// Paramètre 1

// Opération
LDR x0, [x29, #16] // On récupère la valeur de la variable n
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
// Paramètre 2
LDR x0, [x29, #-112] // On récupère la valeur de la variable f2
SUB sp, sp, #16 // f2 Mise en pile var
STR x0, [sp] // f2 Mise en pile var
// Paramètre 3
LDR x0, [x29, #-96] // On récupère la valeur de la variable f1
SUB sp, sp, #16 // f1 Mise en pile var
STR x0, [sp] // f1 Mise en pile var
// Paramètre 4
LDR x0, [x29, #-80] // On récupère la valeur de la variable f0
SUB sp, sp, #16 // f0 Mise en pile var
STR x0, [sp] // f0 Mise en pile var
// Gestion du chainage statique
SUB sp, sp, #16 // Incrémentation du pointeur de pile
STR x29, [sp] // Sauvegarde du chainage statique
MOV x27, x29 // Mise à jour du chainage statique
BL F4 // Appel de la fonction
// Gestion du chainage statique
ADD sp, sp, #16 // Le chainage statique ça dégage
// Récupération du résultat
ADD sp, sp, #80 // Décrémentation du pointeur de pile de la taille des paramètres
SUB sp, sp, #16 // Réserve de l'espace pour le résultat
STR x26, [sp] // Sauvegarde du résultat
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16
end1791741888 :

MOV sp, x29 // Restauration du pointeur de pile
LDP x29, lr, [sp, #-16] // Restauration du pointeur de pile et du lien de retour
RET // Retour de la fonction

