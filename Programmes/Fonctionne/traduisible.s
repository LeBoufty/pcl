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

// Declaration de la variable b
SUB sp, sp, #16 // Allocation de 16 octets pour la variable b


// Instructions de la procédure traduisible



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
STP x29, lr, [sp, #-16]! // Sauvegarde x29 et LR
MOV x29, sp // Changement du x29 pour la fonction
STR x19, [sp, -16] // Sauvegarde de X19
SUB SP, SP, 0 // Réserve de l'espace pour les variables locales
ADD SP, SP, 0 // Libération de l'espace pour les variables locales
LDP x29, lr, [sp], #16 // Restauration x29 et LR
RET // Retour de la fonction

