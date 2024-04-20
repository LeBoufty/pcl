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

// Declaration de la variable a1
MOVZ x0, #1
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a2
MOVZ x0, #2
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a3
MOVZ x0, #3
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a4
MOVZ x0, #4
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a5
MOVZ x0, #5
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a6
MOVZ x0, #6
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a7
MOVZ x0, #7
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a8
MOVZ x0, #8
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a9
MOVZ x0, #9
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a10
MOVZ x0, #10
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a11
MOVZ x0, #11
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a12
MOVZ x0, #12
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a13
MOVZ x0, #13
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a14
MOVZ x0, #14
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a15
MOVZ x0, #15
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a16
MOVZ x0, #16
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a17
MOVZ x0, #17
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a18
MOVZ x0, #18
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a19
MOVZ x0, #19
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a20
MOVZ x0, #20
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a21
MOVZ x0, #21
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a22
MOVZ x0, #22
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a23
MOVZ x0, #23
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a24
MOVZ x0, #24
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a25
MOVZ x0, #25
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a26
MOVZ x0, #26
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a27
MOVZ x0, #27
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a28
MOVZ x0, #28
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a29
MOVZ x0, #29
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a30
MOVZ x0, #30
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a31
MOVZ x0, #31
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a32
MOVZ x0, #32
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a33
MOVZ x0, #33
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a34
MOVZ x0, #34
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a35
MOVZ x0, #35
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a36
MOVZ x0, #36
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a37
MOVZ x0, #37
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a38
MOVZ x0, #38
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a39
MOVZ x0, #39
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a40
MOVZ x0, #40
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a41
MOVZ x0, #41
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a42
MOVZ x0, #42
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a43
MOVZ x0, #43
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a44
MOVZ x0, #44
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a45
MOVZ x0, #45
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a46
MOVZ x0, #46
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a47
MOVZ x0, #47
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a48
MOVZ x0, #48
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a49
MOVZ x0, #49
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a50
MOVZ x0, #50
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a51
MOVZ x0, #51
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a52
MOVZ x0, #52
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a53
MOVZ x0, #53
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a54
MOVZ x0, #54
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a55
MOVZ x0, #55
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a56
MOVZ x0, #56
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a57
MOVZ x0, #57
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a58
MOVZ x0, #58
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a59
MOVZ x0, #59
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a60
MOVZ x0, #60
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a61
MOVZ x0, #61
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a62
MOVZ x0, #62
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a63
MOVZ x0, #63
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a64
MOVZ x0, #64
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a65
MOVZ x0, #65
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a66
MOVZ x0, #66
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a67
MOVZ x0, #67
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a68
MOVZ x0, #68
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a69
MOVZ x0, #69
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a70
MOVZ x0, #70
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a71
MOVZ x0, #71
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a72
MOVZ x0, #72
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a73
MOVZ x0, #73
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a74
MOVZ x0, #74
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a75
MOVZ x0, #75
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a76
MOVZ x0, #76
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a77
MOVZ x0, #77
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a78
MOVZ x0, #78
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a79
MOVZ x0, #79
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a80
MOVZ x0, #80
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a81
MOVZ x0, #81
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a82
MOVZ x0, #82
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a83
MOVZ x0, #83
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a84
MOVZ x0, #84
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a85
MOVZ x0, #85
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a86
MOVZ x0, #86
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a87
MOVZ x0, #87
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a88
MOVZ x0, #88
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a89
MOVZ x0, #89
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a90
MOVZ x0, #90
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a91
MOVZ x0, #91
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a92
MOVZ x0, #92
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a93
MOVZ x0, #93
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a94
MOVZ x0, #94
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a95
MOVZ x0, #95
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a96
MOVZ x0, #96
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a97
MOVZ x0, #97
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a98
MOVZ x0, #98
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a99
MOVZ x0, #99
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Declaration de la variable a100
MOVZ x0, #100
SUB sp, sp, #16 // On décrémente le pointeur de pile 
STR x0, [sp] // On met la constante en pile 

// Instructions de la procédure stack
// Printf

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération

// Opération
LDR x0, [x29, #-48] // On récupère la valeur de la variable a1
SUB sp, sp, #16 // a1 Mise en pile var
STR x0, [sp] // a1 Mise en pile var
LDR x0, [x29, #-64] // On récupère la valeur de la variable a2
SUB sp, sp, #16 // a2 Mise en pile var
STR x0, [sp] // a2 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x0, [x29, #-80] // On récupère la valeur de la variable a3
SUB sp, sp, #16 // a3 Mise en pile var
STR x0, [sp] // a3 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x0, [x29, #-96] // On récupère la valeur de la variable a4
SUB sp, sp, #16 // a4 Mise en pile var
STR x0, [sp] // a4 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x0, [x29, #-112] // On récupère la valeur de la variable a5
SUB sp, sp, #16 // a5 Mise en pile var
STR x0, [sp] // a5 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x0, [x29, #-128] // On récupère la valeur de la variable a6
SUB sp, sp, #16 // a6 Mise en pile var
STR x0, [sp] // a6 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x0, [x29, #-144] // On récupère la valeur de la variable a7
SUB sp, sp, #16 // a7 Mise en pile var
STR x0, [sp] // a7 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x0, [x29, #-160] // On récupère la valeur de la variable a8
SUB sp, sp, #16 // a8 Mise en pile var
STR x0, [sp] // a8 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x0, [x29, #-176] // On récupère la valeur de la variable a9
SUB sp, sp, #16 // a9 Mise en pile var
STR x0, [sp] // a9 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x0, [x29, #-192] // On récupère la valeur de la variable a10
SUB sp, sp, #16 // a10 Mise en pile var
STR x0, [sp] // a10 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x0, [x29, #-208] // On récupère la valeur de la variable a11
SUB sp, sp, #16 // a11 Mise en pile var
STR x0, [sp] // a11 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x0, [x29, #-224] // On récupère la valeur de la variable a12
SUB sp, sp, #16 // a12 Mise en pile var
STR x0, [sp] // a12 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
LDR x0, [x29, #-240] // On récupère la valeur de la variable a13
SUB sp, sp, #16 // a13 Mise en pile var
STR x0, [sp] // a13 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-0] // On récupère la valeur de la variable a14
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a14 Mise en pile var
STR x0, [sp] // a14 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-16] // On récupère la valeur de la variable a15
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a15 Mise en pile var
STR x0, [sp] // a15 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-32] // On récupère la valeur de la variable a16
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a16 Mise en pile var
STR x0, [sp] // a16 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-48] // On récupère la valeur de la variable a17
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a17 Mise en pile var
STR x0, [sp] // a17 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-64] // On récupère la valeur de la variable a18
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a18 Mise en pile var
STR x0, [sp] // a18 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-80] // On récupère la valeur de la variable a19
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a19 Mise en pile var
STR x0, [sp] // a19 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-96] // On récupère la valeur de la variable a20
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a20 Mise en pile var
STR x0, [sp] // a20 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-112] // On récupère la valeur de la variable a21
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a21 Mise en pile var
STR x0, [sp] // a21 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-128] // On récupère la valeur de la variable a22
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a22 Mise en pile var
STR x0, [sp] // a22 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-144] // On récupère la valeur de la variable a23
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a23 Mise en pile var
STR x0, [sp] // a23 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-160] // On récupère la valeur de la variable a24
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a24 Mise en pile var
STR x0, [sp] // a24 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-176] // On récupère la valeur de la variable a25
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a25 Mise en pile var
STR x0, [sp] // a25 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-192] // On récupère la valeur de la variable a26
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a26 Mise en pile var
STR x0, [sp] // a26 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-208] // On récupère la valeur de la variable a27
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a27 Mise en pile var
STR x0, [sp] // a27 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-224] // On récupère la valeur de la variable a28
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a28 Mise en pile var
STR x0, [sp] // a28 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-240] // On récupère la valeur de la variable a29
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a29 Mise en pile var
STR x0, [sp] // a29 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-0] // On récupère la valeur de la variable a30
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a30 Mise en pile var
STR x0, [sp] // a30 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-16] // On récupère la valeur de la variable a31
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a31 Mise en pile var
STR x0, [sp] // a31 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-32] // On récupère la valeur de la variable a32
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a32 Mise en pile var
STR x0, [sp] // a32 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-48] // On récupère la valeur de la variable a33
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a33 Mise en pile var
STR x0, [sp] // a33 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-64] // On récupère la valeur de la variable a34
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a34 Mise en pile var
STR x0, [sp] // a34 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-80] // On récupère la valeur de la variable a35
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a35 Mise en pile var
STR x0, [sp] // a35 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-96] // On récupère la valeur de la variable a36
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a36 Mise en pile var
STR x0, [sp] // a36 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-112] // On récupère la valeur de la variable a37
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a37 Mise en pile var
STR x0, [sp] // a37 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-128] // On récupère la valeur de la variable a38
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a38 Mise en pile var
STR x0, [sp] // a38 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-144] // On récupère la valeur de la variable a39
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a39 Mise en pile var
STR x0, [sp] // a39 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-160] // On récupère la valeur de la variable a40
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a40 Mise en pile var
STR x0, [sp] // a40 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-176] // On récupère la valeur de la variable a41
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a41 Mise en pile var
STR x0, [sp] // a41 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-192] // On récupère la valeur de la variable a42
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a42 Mise en pile var
STR x0, [sp] // a42 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-208] // On récupère la valeur de la variable a43
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a43 Mise en pile var
STR x0, [sp] // a43 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-224] // On récupère la valeur de la variable a44
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a44 Mise en pile var
STR x0, [sp] // a44 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-240] // On récupère la valeur de la variable a45
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a45 Mise en pile var
STR x0, [sp] // a45 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-0] // On récupère la valeur de la variable a46
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a46 Mise en pile var
STR x0, [sp] // a46 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-16] // On récupère la valeur de la variable a47
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a47 Mise en pile var
STR x0, [sp] // a47 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-32] // On récupère la valeur de la variable a48
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a48 Mise en pile var
STR x0, [sp] // a48 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-48] // On récupère la valeur de la variable a49
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a49 Mise en pile var
STR x0, [sp] // a49 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-64] // On récupère la valeur de la variable a50
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a50 Mise en pile var
STR x0, [sp] // a50 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-80] // On récupère la valeur de la variable a51
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a51 Mise en pile var
STR x0, [sp] // a51 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-96] // On récupère la valeur de la variable a52
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a52 Mise en pile var
STR x0, [sp] // a52 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-112] // On récupère la valeur de la variable a53
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a53 Mise en pile var
STR x0, [sp] // a53 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-128] // On récupère la valeur de la variable a54
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a54 Mise en pile var
STR x0, [sp] // a54 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-144] // On récupère la valeur de la variable a55
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a55 Mise en pile var
STR x0, [sp] // a55 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-160] // On récupère la valeur de la variable a56
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a56 Mise en pile var
STR x0, [sp] // a56 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-176] // On récupère la valeur de la variable a57
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a57 Mise en pile var
STR x0, [sp] // a57 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-192] // On récupère la valeur de la variable a58
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a58 Mise en pile var
STR x0, [sp] // a58 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-208] // On récupère la valeur de la variable a59
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a59 Mise en pile var
STR x0, [sp] // a59 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-224] // On récupère la valeur de la variable a60
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a60 Mise en pile var
STR x0, [sp] // a60 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-240] // On récupère la valeur de la variable a61
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a61 Mise en pile var
STR x0, [sp] // a61 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-0] // On récupère la valeur de la variable a62
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a62 Mise en pile var
STR x0, [sp] // a62 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-16] // On récupère la valeur de la variable a63
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a63 Mise en pile var
STR x0, [sp] // a63 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-32] // On récupère la valeur de la variable a64
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a64 Mise en pile var
STR x0, [sp] // a64 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-48] // On récupère la valeur de la variable a65
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a65 Mise en pile var
STR x0, [sp] // a65 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-64] // On récupère la valeur de la variable a66
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a66 Mise en pile var
STR x0, [sp] // a66 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-80] // On récupère la valeur de la variable a67
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a67 Mise en pile var
STR x0, [sp] // a67 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-96] // On récupère la valeur de la variable a68
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a68 Mise en pile var
STR x0, [sp] // a68 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-112] // On récupère la valeur de la variable a69
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a69 Mise en pile var
STR x0, [sp] // a69 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-128] // On récupère la valeur de la variable a70
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a70 Mise en pile var
STR x0, [sp] // a70 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-144] // On récupère la valeur de la variable a71
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a71 Mise en pile var
STR x0, [sp] // a71 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-160] // On récupère la valeur de la variable a72
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a72 Mise en pile var
STR x0, [sp] // a72 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-176] // On récupère la valeur de la variable a73
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a73 Mise en pile var
STR x0, [sp] // a73 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-192] // On récupère la valeur de la variable a74
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a74 Mise en pile var
STR x0, [sp] // a74 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-208] // On récupère la valeur de la variable a75
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a75 Mise en pile var
STR x0, [sp] // a75 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-224] // On récupère la valeur de la variable a76
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a76 Mise en pile var
STR x0, [sp] // a76 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-240] // On récupère la valeur de la variable a77
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a77 Mise en pile var
STR x0, [sp] // a77 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-0] // On récupère la valeur de la variable a78
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a78 Mise en pile var
STR x0, [sp] // a78 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-16] // On récupère la valeur de la variable a79
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a79 Mise en pile var
STR x0, [sp] // a79 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-32] // On récupère la valeur de la variable a80
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a80 Mise en pile var
STR x0, [sp] // a80 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-48] // On récupère la valeur de la variable a81
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a81 Mise en pile var
STR x0, [sp] // a81 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-64] // On récupère la valeur de la variable a82
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a82 Mise en pile var
STR x0, [sp] // a82 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-80] // On récupère la valeur de la variable a83
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a83 Mise en pile var
STR x0, [sp] // a83 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-96] // On récupère la valeur de la variable a84
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a84 Mise en pile var
STR x0, [sp] // a84 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-112] // On récupère la valeur de la variable a85
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a85 Mise en pile var
STR x0, [sp] // a85 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-128] // On récupère la valeur de la variable a86
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a86 Mise en pile var
STR x0, [sp] // a86 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-144] // On récupère la valeur de la variable a87
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a87 Mise en pile var
STR x0, [sp] // a87 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-160] // On récupère la valeur de la variable a88
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a88 Mise en pile var
STR x0, [sp] // a88 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-176] // On récupère la valeur de la variable a89
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a89 Mise en pile var
STR x0, [sp] // a89 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-192] // On récupère la valeur de la variable a90
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a90 Mise en pile var
STR x0, [sp] // a90 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-208] // On récupère la valeur de la variable a91
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a91 Mise en pile var
STR x0, [sp] // a91 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-224] // On récupère la valeur de la variable a92
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a92 Mise en pile var
STR x0, [sp] // a92 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-240] // On récupère la valeur de la variable a93
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a93 Mise en pile var
STR x0, [sp] // a93 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-0] // On récupère la valeur de la variable a94
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a94 Mise en pile var
STR x0, [sp] // a94 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-16] // On récupère la valeur de la variable a95
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a95 Mise en pile var
STR x0, [sp] // a95 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-32] // On récupère la valeur de la variable a96
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a96 Mise en pile var
STR x0, [sp] // a96 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-48] // On récupère la valeur de la variable a97
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a97 Mise en pile var
STR x0, [sp] // a97 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-64] // On récupère la valeur de la variable a98
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a98 Mise en pile var
STR x0, [sp] // a98 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-80] // On récupère la valeur de la variable a99
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a99 Mise en pile var
STR x0, [sp] // a99 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-96] // On récupère la valeur de la variable a100
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a100 Mise en pile var
STR x0, [sp] // a100 Mise en pile var
LDR x1, [sp] // On met l'opérande droite dans x1
ADD sp, sp, #16 // On décrémente le pointeur de pile
LDR x0, [sp] // On met l'opérande gauche dans x0
ADD sp, sp, #16 // On décrémente le pointeur de pile
ADD x0, x0, x1 // Opération +
SUB sp, sp, #16 // On décrémente le pointeur de pile
STR x0, [sp] // On met le résultat en pile
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
LDR x0, [x29, #-48] // On récupère la valeur de la variable a1
SUB sp, sp, #16 // a1 Mise en pile var
STR x0, [sp] // a1 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
LDR x0, [x29, #-64] // On récupère la valeur de la variable a2
SUB sp, sp, #16 // a2 Mise en pile var
STR x0, [sp] // a2 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
LDR x0, [x29, #-80] // On récupère la valeur de la variable a3
SUB sp, sp, #16 // a3 Mise en pile var
STR x0, [sp] // a3 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
LDR x0, [x29, #-96] // On récupère la valeur de la variable a4
SUB sp, sp, #16 // a4 Mise en pile var
STR x0, [sp] // a4 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
LDR x0, [x29, #-112] // On récupère la valeur de la variable a5
SUB sp, sp, #16 // a5 Mise en pile var
STR x0, [sp] // a5 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
LDR x0, [x29, #-128] // On récupère la valeur de la variable a6
SUB sp, sp, #16 // a6 Mise en pile var
STR x0, [sp] // a6 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
LDR x0, [x29, #-144] // On récupère la valeur de la variable a7
SUB sp, sp, #16 // a7 Mise en pile var
STR x0, [sp] // a7 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
LDR x0, [x29, #-160] // On récupère la valeur de la variable a8
SUB sp, sp, #16 // a8 Mise en pile var
STR x0, [sp] // a8 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
LDR x0, [x29, #-176] // On récupère la valeur de la variable a9
SUB sp, sp, #16 // a9 Mise en pile var
STR x0, [sp] // a9 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
LDR x0, [x29, #-192] // On récupère la valeur de la variable a10
SUB sp, sp, #16 // a10 Mise en pile var
STR x0, [sp] // a10 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
LDR x0, [x29, #-208] // On récupère la valeur de la variable a11
SUB sp, sp, #16 // a11 Mise en pile var
STR x0, [sp] // a11 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
LDR x0, [x29, #-224] // On récupère la valeur de la variable a12
SUB sp, sp, #16 // a12 Mise en pile var
STR x0, [sp] // a12 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
LDR x0, [x29, #-240] // On récupère la valeur de la variable a13
SUB sp, sp, #16 // a13 Mise en pile var
STR x0, [sp] // a13 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-0] // On récupère la valeur de la variable a14
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a14 Mise en pile var
STR x0, [sp] // a14 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-16] // On récupère la valeur de la variable a15
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a15 Mise en pile var
STR x0, [sp] // a15 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-32] // On récupère la valeur de la variable a16
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a16 Mise en pile var
STR x0, [sp] // a16 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-48] // On récupère la valeur de la variable a17
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a17 Mise en pile var
STR x0, [sp] // a17 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-64] // On récupère la valeur de la variable a18
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a18 Mise en pile var
STR x0, [sp] // a18 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-80] // On récupère la valeur de la variable a19
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a19 Mise en pile var
STR x0, [sp] // a19 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-96] // On récupère la valeur de la variable a20
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a20 Mise en pile var
STR x0, [sp] // a20 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-112] // On récupère la valeur de la variable a21
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a21 Mise en pile var
STR x0, [sp] // a21 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-128] // On récupère la valeur de la variable a22
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a22 Mise en pile var
STR x0, [sp] // a22 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-144] // On récupère la valeur de la variable a23
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a23 Mise en pile var
STR x0, [sp] // a23 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-160] // On récupère la valeur de la variable a24
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a24 Mise en pile var
STR x0, [sp] // a24 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-176] // On récupère la valeur de la variable a25
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a25 Mise en pile var
STR x0, [sp] // a25 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-192] // On récupère la valeur de la variable a26
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a26 Mise en pile var
STR x0, [sp] // a26 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-208] // On récupère la valeur de la variable a27
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a27 Mise en pile var
STR x0, [sp] // a27 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-224] // On récupère la valeur de la variable a28
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a28 Mise en pile var
STR x0, [sp] // a28 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-240] // On récupère la valeur de la variable a29
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a29 Mise en pile var
STR x0, [sp] // a29 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-0] // On récupère la valeur de la variable a30
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a30 Mise en pile var
STR x0, [sp] // a30 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-16] // On récupère la valeur de la variable a31
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a31 Mise en pile var
STR x0, [sp] // a31 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-32] // On récupère la valeur de la variable a32
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a32 Mise en pile var
STR x0, [sp] // a32 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-48] // On récupère la valeur de la variable a33
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a33 Mise en pile var
STR x0, [sp] // a33 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-64] // On récupère la valeur de la variable a34
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a34 Mise en pile var
STR x0, [sp] // a34 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-80] // On récupère la valeur de la variable a35
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a35 Mise en pile var
STR x0, [sp] // a35 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-96] // On récupère la valeur de la variable a36
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a36 Mise en pile var
STR x0, [sp] // a36 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-112] // On récupère la valeur de la variable a37
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a37 Mise en pile var
STR x0, [sp] // a37 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-128] // On récupère la valeur de la variable a38
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a38 Mise en pile var
STR x0, [sp] // a38 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-144] // On récupère la valeur de la variable a39
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a39 Mise en pile var
STR x0, [sp] // a39 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-160] // On récupère la valeur de la variable a40
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a40 Mise en pile var
STR x0, [sp] // a40 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-176] // On récupère la valeur de la variable a41
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a41 Mise en pile var
STR x0, [sp] // a41 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-192] // On récupère la valeur de la variable a42
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a42 Mise en pile var
STR x0, [sp] // a42 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-208] // On récupère la valeur de la variable a43
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a43 Mise en pile var
STR x0, [sp] // a43 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-224] // On récupère la valeur de la variable a44
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a44 Mise en pile var
STR x0, [sp] // a44 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-240] // On récupère la valeur de la variable a45
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a45 Mise en pile var
STR x0, [sp] // a45 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-0] // On récupère la valeur de la variable a46
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a46 Mise en pile var
STR x0, [sp] // a46 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-16] // On récupère la valeur de la variable a47
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a47 Mise en pile var
STR x0, [sp] // a47 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-32] // On récupère la valeur de la variable a48
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a48 Mise en pile var
STR x0, [sp] // a48 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-48] // On récupère la valeur de la variable a49
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a49 Mise en pile var
STR x0, [sp] // a49 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-64] // On récupère la valeur de la variable a50
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a50 Mise en pile var
STR x0, [sp] // a50 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-80] // On récupère la valeur de la variable a51
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a51 Mise en pile var
STR x0, [sp] // a51 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-96] // On récupère la valeur de la variable a52
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a52 Mise en pile var
STR x0, [sp] // a52 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-112] // On récupère la valeur de la variable a53
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a53 Mise en pile var
STR x0, [sp] // a53 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-128] // On récupère la valeur de la variable a54
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a54 Mise en pile var
STR x0, [sp] // a54 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-144] // On récupère la valeur de la variable a55
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a55 Mise en pile var
STR x0, [sp] // a55 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-160] // On récupère la valeur de la variable a56
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a56 Mise en pile var
STR x0, [sp] // a56 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-176] // On récupère la valeur de la variable a57
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a57 Mise en pile var
STR x0, [sp] // a57 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-192] // On récupère la valeur de la variable a58
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a58 Mise en pile var
STR x0, [sp] // a58 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-208] // On récupère la valeur de la variable a59
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a59 Mise en pile var
STR x0, [sp] // a59 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-224] // On récupère la valeur de la variable a60
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a60 Mise en pile var
STR x0, [sp] // a60 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-240] // On récupère la valeur de la variable a61
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a61 Mise en pile var
STR x0, [sp] // a61 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-0] // On récupère la valeur de la variable a62
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a62 Mise en pile var
STR x0, [sp] // a62 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-16] // On récupère la valeur de la variable a63
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a63 Mise en pile var
STR x0, [sp] // a63 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-32] // On récupère la valeur de la variable a64
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a64 Mise en pile var
STR x0, [sp] // a64 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-48] // On récupère la valeur de la variable a65
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a65 Mise en pile var
STR x0, [sp] // a65 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-64] // On récupère la valeur de la variable a66
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a66 Mise en pile var
STR x0, [sp] // a66 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-80] // On récupère la valeur de la variable a67
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a67 Mise en pile var
STR x0, [sp] // a67 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-96] // On récupère la valeur de la variable a68
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a68 Mise en pile var
STR x0, [sp] // a68 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-112] // On récupère la valeur de la variable a69
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a69 Mise en pile var
STR x0, [sp] // a69 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-128] // On récupère la valeur de la variable a70
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a70 Mise en pile var
STR x0, [sp] // a70 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-144] // On récupère la valeur de la variable a71
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a71 Mise en pile var
STR x0, [sp] // a71 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-160] // On récupère la valeur de la variable a72
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a72 Mise en pile var
STR x0, [sp] // a72 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-176] // On récupère la valeur de la variable a73
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a73 Mise en pile var
STR x0, [sp] // a73 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-192] // On récupère la valeur de la variable a74
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a74 Mise en pile var
STR x0, [sp] // a74 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-208] // On récupère la valeur de la variable a75
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a75 Mise en pile var
STR x0, [sp] // a75 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-224] // On récupère la valeur de la variable a76
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a76 Mise en pile var
STR x0, [sp] // a76 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-240] // On récupère la valeur de la variable a77
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a77 Mise en pile var
STR x0, [sp] // a77 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-0] // On récupère la valeur de la variable a78
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a78 Mise en pile var
STR x0, [sp] // a78 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-16] // On récupère la valeur de la variable a79
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a79 Mise en pile var
STR x0, [sp] // a79 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-32] // On récupère la valeur de la variable a80
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a80 Mise en pile var
STR x0, [sp] // a80 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-48] // On récupère la valeur de la variable a81
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a81 Mise en pile var
STR x0, [sp] // a81 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-64] // On récupère la valeur de la variable a82
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a82 Mise en pile var
STR x0, [sp] // a82 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-80] // On récupère la valeur de la variable a83
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a83 Mise en pile var
STR x0, [sp] // a83 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-96] // On récupère la valeur de la variable a84
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a84 Mise en pile var
STR x0, [sp] // a84 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-112] // On récupère la valeur de la variable a85
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a85 Mise en pile var
STR x0, [sp] // a85 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-128] // On récupère la valeur de la variable a86
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a86 Mise en pile var
STR x0, [sp] // a86 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-144] // On récupère la valeur de la variable a87
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a87 Mise en pile var
STR x0, [sp] // a87 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-160] // On récupère la valeur de la variable a88
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a88 Mise en pile var
STR x0, [sp] // a88 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-176] // On récupère la valeur de la variable a89
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a89 Mise en pile var
STR x0, [sp] // a89 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-192] // On récupère la valeur de la variable a90
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a90 Mise en pile var
STR x0, [sp] // a90 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-208] // On récupère la valeur de la variable a91
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a91 Mise en pile var
STR x0, [sp] // a91 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-224] // On récupère la valeur de la variable a92
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a92 Mise en pile var
STR x0, [sp] // a92 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-240] // On récupère la valeur de la variable a93
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a93 Mise en pile var
STR x0, [sp] // a93 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-0] // On récupère la valeur de la variable a94
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a94 Mise en pile var
STR x0, [sp] // a94 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-16] // On récupère la valeur de la variable a95
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a95 Mise en pile var
STR x0, [sp] // a95 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-32] // On récupère la valeur de la variable a96
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a96 Mise en pile var
STR x0, [sp] // a96 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-48] // On récupère la valeur de la variable a97
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a97 Mise en pile var
STR x0, [sp] // a97 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-64] // On récupère la valeur de la variable a98
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a98 Mise en pile var
STR x0, [sp] // a98 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-80] // On récupère la valeur de la variable a99
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a99 Mise en pile var
STR x0, [sp] // a99 Mise en pile var
MOV x1, x0
ADRP x0, format
ADD x0, x0, :lo12:format
BL printf
ADD sp, sp, #16

// Printf
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement 
LDR x0, [x29, #-96] // On récupère la valeur de la variable a100
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
ADD x29, x29, #256 // On restaure le frame pointer 
SUB sp, sp, #16 // a100 Mise en pile var
STR x0, [sp] // a100 Mise en pile var
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

