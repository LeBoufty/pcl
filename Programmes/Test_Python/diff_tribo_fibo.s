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

// Définitions de la procédure diff_tribo_fibo
// Declaration de la variable n
SUB sp, sp, #16 // Allocation de 16 octets pour la variable n


// Instructions de la procédure diff_tribo_fibo
MOVZ x0, #5
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 
LDR x2, [sp] // On met la valeur de la variable droite dans x2 
STR x2, [x29, #-48] // On met la valeur de la variable droite dans la variable gauche 
ADD sp, sp, #16 // On dépile la valeur 

// Paramètre 0
LDR x0, [x29, #-48] // On récupère la valeur de la variable n
SUB sp, sp, #16 // n Mise en pile var
STR x0, [sp] // n Mise en pile var
// Gestion du chainage statique
SUB sp, sp, #16 // Incrémentation du pointeur de pile
STR x29, [sp] // Sauvegarde du chainage statique
MOV x27, x29 // Mise à jour du chainage statique
BL P1 // Appel de la procedure
// Gestion du chainage statique
ADD sp, sp, #16 // Le chainage statique ça dégage


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
// Définitions de la fonction fibonacci
// Instructions de la fonction fibonacci
// if 189568618

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
BNE then189568618 // Branchement si la condition est vraie
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
B end189568618 // Branchement à la fin du if
then189568618 :
// Return 
LDR x0, [x29, #32] // On récupère la valeur de la variable x1
SUB sp, sp, #16 // x1 Mise en pile var
STR x0, [sp] // x1 Mise en pile var
LDR x26, [sp] // Valeur de retour dans le registre x26
MOV sp, x29 // Restauration du pointeur de pile
LDP x29, lr, [sp, #-16] // Restauration du pointeur de pile et du lien de retour
RET // Retour de la fonction
end189568618 :

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
// if 960604060

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
BNE then960604060 // Branchement si la condition est vraie
// if 1349393271

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
BNE then1349393271 // Branchement si la condition est vraie
// if 1338668845

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
BNE then1338668845 // Branchement si la condition est vraie
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
B end1338668845 // Branchement à la fin du if
then1338668845 :
// Return 
LDR x0, [x29, #64] // On récupère la valeur de la variable x3
SUB sp, sp, #16 // x3 Mise en pile var
STR x0, [sp] // x3 Mise en pile var
LDR x26, [sp] // Valeur de retour dans le registre x26
MOV sp, x29 // Restauration du pointeur de pile
LDP x29, lr, [sp, #-16] // Restauration du pointeur de pile et du lien de retour
RET // Retour de la fonction
end1338668845 :
B end1349393271 // Branchement à la fin du if
then1349393271 :
// Return 
LDR x0, [x29, #48] // On récupère la valeur de la variable x2
SUB sp, sp, #16 // x2 Mise en pile var
STR x0, [sp] // x2 Mise en pile var
LDR x26, [sp] // Valeur de retour dans le registre x26
MOV sp, x29 // Restauration du pointeur de pile
LDP x29, lr, [sp, #-16] // Restauration du pointeur de pile et du lien de retour
RET // Retour de la fonction
end1349393271 :
B end960604060 // Branchement à la fin du if
then960604060 :
// Return 
LDR x0, [x29, #32] // On récupère la valeur de la variable x1
SUB sp, sp, #16 // x1 Mise en pile var
STR x0, [sp] // x1 Mise en pile var
LDR x26, [sp] // Valeur de retour dans le registre x26
MOV sp, x29 // Restauration du pointeur de pile
LDP x29, lr, [sp, #-16] // Restauration du pointeur de pile et du lien de retour
RET // Retour de la fonction
end960604060 :

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
MOVN x0, #16 // Deplacement en pile VAR GLOBALE 
MOVZ x1, #1 // n Nb saut VAR GLOBALE
MOV x28,x29 // Copie du frame pointer dans x28 (temporaire)
BL get_global_var // n Mise en pile var
STR x2, [sp, #0] // n Mise en pile var depuis le registre de retours des fonctions :)
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
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x29, [sp] // Sauvegarde du pointeur de pile statique
SUB sp, sp, #16 // On décrémente le pointeur de pile dynamique
STR x29, [sp] // Sauvegarde du pointeur de pile
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR lr, [sp] // Sauvegarde du lien de retour
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
LDR x0, [x29, #-48] // On récupère la valeur de la variable trib
SUB sp, sp, #16 // trib Mise en pile var
STR x0, [sp] // trib Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
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

// if 159413332

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
MOVGT x0, #1 // Opération >
MOVLE x0, #0 // Opération >
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x0, [sp] // Chargement de la condition
ADD sp, sp, #16 // Décrémentation du pointeur de pile
CMP x0, #0 // Comparaison de la condition
BNE then159413332 // Branchement si la condition est vraie
then159413332 :

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
end159413332 :

MOV sp, x29 // Restauration du pointeur de pile
LDP x29, lr, [sp, #-16] // Restauration du pointeur de pile et du lien de retour
RET // Retour de la fonction

