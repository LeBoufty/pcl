.section .text
.global _start

_start :
    // Stocker la valeur 515 en pile
    movz x0, #515       // Charger 515 dans le registre x0
    str x0, [sp]!        // Stocker x0 à l'emplacement actuel du sp (top de la pile)
    mov x0, sp          // Charger l'adresse du sommet de la pile dans x0

    // Stocker le frame pointer (fp/x29) en pile
    mov x1, x29         // Copier fp dans x1
    str x1, [sp]!    // Stocker x1 à 8 octets au-dessus du sommet actuel de la pile
    mov x0, sp          // Charger l'adresse du sommet de la pile dans x0

    // Stocker le stack pointer (sp) en pile est plus délicat car sp change
    add x2, sp, #32     // Calculer l'adresse originale de sp avant la réservation d'espace
    str x2, [sp]!   // Stocker cette valeur approximative de sp à 16 octets au-dessus du sommet actuel de la pile
    mov x0, sp          // Charger l'adresse du sommet de la pile dans x0

    // Stocker l'adresse de retour (lr/x30) en pile
    mov x3, lr          // Copier lr dans x3
    str x3, [sp]!   // Stocker x3 à 24 octets au-dessus du sommet actuel de la pile
    mov x0, sp          // Charger l'adresse du sommet de la pile dans x0

    bl exit

exit :
    mov x0, 0 // return 0
    mov x8, 93 // syscall number for exit
    svc 0 // make the syscall
    ret // return from main
    

