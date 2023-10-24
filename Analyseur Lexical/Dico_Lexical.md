# Dictionnaire Lexical

## Unités lexicales simples

| Opérateurs | Code | Associativité | Précédence | Utilité |
|:----------:|:----:|:-------------:|:----------:|:-------:|
| . | 0 | Gauche | 1 |  
| - (unaire) | 1 |  | 2 | Prendre l'opposé d'une valeur |
| * | 2 | Gauche | 3 | Multiplication |
| / | 3 | Gauche | 3 | Division |
| rem | 4 | Gauche | 3 |  |
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
| and then | 15 |  | 8 |  |
| or | 16 |  | 9 | "Ou" logique |
| or else | 17 |  | 9 |  |

Note : Il y a 18 opérateurs, ce qui fait que l'entier en stockant un doit être défini sur au moins 5 bits. Ce qui est peu optimal car on aimerait pouvoir les stocker sur 4 (16 opérateurs).

## Unités lexicales génériques

## Mots-clés du langage