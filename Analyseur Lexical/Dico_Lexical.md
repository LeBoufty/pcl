# Dictionnaire Lexical

## Unités lexicales simples

| Opérateurs | Code | Associativité | Précédence | Utilité |
|:----------:|:----:|:-------------:|:----------:|:-------:|
| . | 0 | Gauche | 1 | Délimiteur de module |
| - (unaire) | 1 |  | 2 | Prendre l'opposé d'une valeur |
| * | 2 | Gauche | 3 | Multiplication |
| / | 3 | Gauche | 3 | Division |
| rem | 4 | Gauche | 3 | Reste de la division euclidienne |
| + | 5 | Gauche | 4 | Addition |
| - | 6 | Gauche | 4 | Soustraction |
| > | 7 |  | 5 | Strictement supérieur |
| >= | 8 |  | 5 | Supérieur ou égal |
| < | 9 |  | 5 | Strictement inférieur |
| <= | 10 |  | 5 | Inférieur ou égal |
| = | 11 |  | 6 | Égal (test) |
| /= | 12 |  | 6 | Différent |
| not | 13 |  | 7 | "Non" logique |
| and | 14 |  | 8 | "Et" logique |
| and then | 15 |  | 8 | "Et" logique sous condition [1] |
| or | 16 |  | 9 | "Ou" logique |
| or else | 17 |  | 9 | "Ou" logique sous condition [1] |

[1] : Cela signifie que ce qui est à droite du "and then" ou du "or else" ne sera évalué que si la condition précédente est vraie dans le cas de and then ou fausse dans le cas de or else.
Par exemple (sous la forme de python) : `if len(L) >= 1 and L[0] == 1` lèverait une erreur dans le cas où L est vide, car le programme vérifie quand même si son premier élément est égal à 1. Alors que `if len(L) >= 1 and then L[0] == 1` ne poserait aucun problème, car dans le cas où L est vide, on s'arrête là et on ne vérifie pas si son premier élément est égal à 1.

## Mots-clés du langage

| Mot-clé | Code | Associativité | Précédence | Utilité | Catégorie |
|:-------:|:----:|:-------------:|:----------:|:-------:|:---------:|
| procedure | 18 |  |  | Définition de procédure | Procédures et fonctions |
| function | 19 |  |  | Définition de fonction | Procédures et fonctions |
| is | 20 |  |  | Type de sortie | Procédures et fonctions |
| begin | 21 |  |  | Début de bloc | Procédures et fonctions |
| end | 22 |  |  | Fin de bloc | Procédures et fonctions |
| return | 23 |  |  | Renvoi | Procédures et fonctions |
| if | 24 |  |  | Si | Conditionnel |
| then | 25 |  |  | Alors | Conditionnel |
| else | 26 |  |  | Sinon | Conditionnel |
| elsif | 27 |  |  | Sinon si | Conditionnel |
| while | 28 |  |  | Tant que | Boucles |
| for | 29 |  |  | Pour | Boucles |
| in | 30 |  |  | Définition de l'itérant | Boucles |
| loop | 31 |  |  |  | Boucles |
| true | 32 |  |  | Vrai | Constantes |
| false | 33 |  |  | Faux | Constantes |
| null | 34 |  |  | Rien | Constantes |
| type | 35 |  |  |  | Types |
| new | 36 |  |  |  | Types |
| with | 37 |  |  |  | Importation |
| use | 38 |  |  |  | Importation |
| access | 39 |  |  |  | Divers |
| out | 40 |  |  |  | Divers |
| record | 41 |  |  |  | Divers |
| reverse | 42 |  |  |  | Divers |

## Unités lexicales génériques

| Nom | Code | Utilité |
|:---:|:----:|:-------:|
| var | 43 | Variable |
| const | 44 | Constante |