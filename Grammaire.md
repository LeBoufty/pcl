# Données de l'image

## Syntaxe Ada

* **Fichier**
    * &#x27E8;expr&#x27E9;

    * `with Ada.Text.IO;`
    * `use Ada.Text.IO;`
    * `procedure (ident) is (decl)*`
    * `begin (instr)`<sup>`+`</sup>` end (ident)?; EOF`
* **Déclaration**
    * `type (ident);`
    * `| type (ident) is access (ident);`
    * `| type (ident) is record (champs)`<sup>`+`</sup>` and record;`
    * `| (ident)`<sup>`+`</sup>`,: (type) (:= (expr))?;`
    * `| procedure (ident) (params)? is (decl)*`
    * `begin (instr)`<sup>`+`</sup>` end (ident)?;`
    * `| function (ident) (params)? return (type) is (decl)*`
    * `begin (instr)`<sup>`+`</sup>` end (ident)?;`
* **Champs**
    * `(ident)`<sup>`+`</sup>`,: (type):`
* **Type**
    * `(ident)`
    * `| access (ident)` 
* **Params**
    * `((params)`<sup>`+`</sup>`;)`
* **Param**    
    * `(ident)`<sup>`+`</sup>`, : (mode)? (type)`
* **Mode**
    * `in`
    * `| in out`
* **Expr**
    * `(entier)`
    * `| (caractère)`
    * `| true`
    * `| false`
    * `| null`
    * `| ((expr))`
    * `| (accès)`
    * `| (expr) (opérateur) (expr)`
    * `| not (expr) `
    * `| - (expr)`
    * `| new (ident)`
    * `| (ident) ((expr)`<sup>`+`</sup>`,)`
    * `| charactere ' val ((expr))`
* **Instr**
    * `(accès) := (expr);`
    * `| (ident);`
    * `| (ident) ((expr)`<sup>`+`</sup>`,);`
    * `| return (expr)?;`
    * `| begin (instr)`<sup>`+`</sup>`end;`
    * `| if (expr) then (instr)`<sup>`+`</sup>` (elsif (expr) then (instr)`<sup>`+`</sup>`)* (else (instr)`<sup>`+`</sup>`)? end if;`
    * `| for (ident) in reverse? (expr)..(expr) loop (instr)`<sup>`+`</sup>` end loop;`
    * `| while (expr) loop (instr)`<sup>`+`</sup>` end loop;`
* **Opérateur**
    + `= | /= | < | <= | > | >= | + | - | * | / | rem | and | and then | or | or else`
* **Accès**
    * `(ident)` 
    * `| (expr). (ident)`

## Explications

* **Fichier** : la déclaration du fichier Ada.
* **Type** : la déclaration d'un type.
* **Déclaration** : la déclaration d'une variable, d'une procédure ou d'une fonction.
* **Champs** : la liste des champs d'un type record.
* **Paramètres** : la liste des paramètres d'une procédure ou d'une fonction.
* **Modes** : le mode d'un paramètre.
* **Expressions** : une expression Ada.
* **Instructions** : une instruction Ada.
* **Opérateurs** : les opérateurs Ada.
* **Accès** : un accès à un objet.

## Notes

* La syntaxe Ada est décrite dans la section `Syntaxe Ada`.
* Les déclarations, les champs, les paramètres, les modes, les expressions, les instructions et les opérateurs sont expliqués dans les sections correspondantes.
* Les notes sont fournies dans la section `Notes`.
