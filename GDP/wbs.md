# Analyseur Lexical

- Dictionnaire des tokens
- Création d'une table de lexique
- Suppression des commentaires, tabulations etc...
- Transformation code source en token
- Gestion erreur Lexicale

# Analyseur Syntaxique
## Grammaire
### Amélioration de la grammaire descendante **(LL1, récursivité à gauche interdite)**

- vérifier que la grammaire est réduite, sinon la réduire
- vérifier que la grammaire n’est pas récursive à gauche, sinon la dérécursiver
- vérifier que la grammaire est factorisée, sinon la factoriser

### Analyse Syntaxique : Descendante
- Calculer les Premiers
- Calculer les Suivants
- Construire la Table d'Analyse

Be LL1 pls (On appelle grammaire LL(1) une grammaire pour laquelle toutes les cases de la table d’analyse contiennent au plus une règle de la grammaire.)
## Codage

- Structure informatique Arbre Abstrait (AST) et de l'Arbre Syntaxique "pur" (ASP)
- Visualisation AST et ASP
- Coder le tableau d'analyse
- Contexte : **Récurrence**, **Objet** ou Pile à choisir
- Gestion des erreurs syntaxiques
- Analyse syntaxique pour récupérer l'ASP en le transformant en même temps en AST via des actions sémantiques (cf Analyseur Sémantique)

# Analyseur Sémantique

- Comprendre comment fonctionne Ada (règle sémantique relatif au bloc etc...)
## AST

- Création des actions sémantiques pour chaque production, pour la création d'un AST
- Création de l'AST (en même temps que l'ASP)

## Contrôles sémantiques

On ne fait que les contrôles sémantiques statiques
Plusieurs méthodes possibles à choisir (TDS ou non)

### Cas TDS
- Création de Tables des symboles en fonction des régions
- Ajout et test des symboles ajoutés
- Gestion des erreurs sémantiques
