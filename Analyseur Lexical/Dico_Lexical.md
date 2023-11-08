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
| const | 44 | Constante soit un chiffre soit un caractère avec 'a' |

## Symboles du langage

| Symbole | Code | Utilité |
|:-------:|:----:|:-------:|
| ( | 45 | Début de parenthèse |
| ) | 46 | Fin de parenthèse |
| := | 47 | Affectation |
| ; | 48 | Fin d'instruction |
| , | 49 | Séparateur |
| : | 50 | Délimiteur variable |
| .. | 51 | Délimiteur for |

## Autres unités lexicales

| Nom | Code | Utilité |
|:---:|:----:|:-------:|
| character'val | 52 | Conversion d'entier en caractère ASCII |
| -- |  | Commentaire ne doit pas être gardé |

## Informations complémentaires

Toutes les unités lexicales peuvent être suivies d'un nombre quelconque d'espaces, de tabulations et de retours à la ligne.
Les identifiants sont composés de lettres, de chiffres et de caractères de soulignement, et doivent commencer par une lettre.
La casse n'est pas prise en compte.
Les commentaires sont délimités par `--` et un retour à la ligne.
Les constantes peuvent être des entiers ou des caractères ASCII.
Les caractères ASCII sont délimités par des apostrophes simples et ne peuvent contenir qu'un seul caractère.
Les chaînes de caractères sont délimitées par des guillemets.
Les mots-clés ne peuvent pas être utilisés comme identifiants.
Les unités lexicales utilisant des alphanumériques doivent être séparé par des espaces, tabulations ou retours à la ligne.