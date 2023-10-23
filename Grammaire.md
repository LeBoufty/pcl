# Données de l'image

## Syntaxe Ada

* **Fichier**
    * `with Ada.Text.IO;`
    * `use Ada.Text.IO;`
    * `procedure `&#x27E8;ident&#x27E9;` is `&#x27E8;decl&#x27E9;`*`
    * `begin `&#x27E8;instr&#x27E9;<sup>`+`</sup>` end `&#x27E8;ident&#x27E9;`?; EOF`
* **Déclaration**
    * `type `&#x27E8;ident&#x27E9;`;`
    * `| type `&#x27E8;ident&#x27E9;` is access `&#x27E8;ident&#x27E9;`;`
    * `| type `&#x27E8;ident&#x27E9;` is record `&#x27E8;champs&#x27E9;<sup>`+`</sup>` and record;`
    * `| `&#x27E8;ident&#x27E9;<sup>`+`</sup>`,: `&#x27E8;type&#x27E9;` (:= `&#x27E8;expr&#x27E9;`)?;`
    * `| procedure `&#x27E8;ident&#x27E9;` `&#x27E8;params&#x27E9;`? is `&#x27E8;decl&#x27E9;`*`
    * `begin `&#x27E8;instr&#x27E9;<sup>`+`</sup>` end `&#x27E8;ident&#x27E9;`?;`
    * `| function `&#x27E8;ident&#x27E9;` `&#x27E8;params&#x27E9;`? return `&#x27E8;type&#x27E9;` is `&#x27E8;decl&#x27E9;`*`
    * `begin `&#x27E8;instr&#x27E9;<sup>`+`</sup>` end `&#x27E8;ident&#x27E9;`?;`
* **Champs**
    * &#x27E8;ident&#x27E9;<sup>`+`</sup>`,: `&#x27E8;type&#x27E9;`:`
* **Type**
    * &#x27E8;ident&#x27E9;
    * `| access `&#x27E8;ident&#x27E9;`` 
* **Params**
    * `(`&#x27E8;params&#x27E9;<sup>`+`</sup>`;)`
* **Param**    
    * &#x27E8;ident&#x27E9;<sup>`+`</sup>`, : `&#x27E8;mode&#x27E9;`? `&#x27E8;type&#x27E9;``
* **Mode**
    * `in`
    * `| in out`
* **Expr**
    * &#x27E8;entier&#x27E9;
    * `| `&#x27E8;caractère&#x27E9;
    * `| true`
    * `| false`
    * `| null`
    * `| (`&#x27E8;expr&#x27E9;`)`
    * `| `&#x27E8;accès&#x27E9;
    * `| `&#x27E8;expr&#x27E9;` `&#x27E8;opérateur&#x27E9;` `&#x27E8;expr&#x27E9;
    * `| not `&#x27E8;expr&#x27E9;
    * `| - `&#x27E8;expr&#x27E9;
    * `| new `&#x27E8;ident&#x27E9;``
    * `| `&#x27E8;ident&#x27E9;` (`&#x27E8;expr&#x27E9;<sup>`+`</sup>`,)`
    * `| charactere ' val (`&#x27E8;expr&#x27E9;`)`
* **Instr**
    * &#x27E8;accès&#x27E9;` := `&#x27E8;expr&#x27E9;`;`
    * `| `&#x27E8;ident&#x27E9;`;`
    * `| `&#x27E8;ident&#x27E9;` (`&#x27E8;expr&#x27E9;<sup>`+`</sup>`,);`
    * `| return `&#x27E8;expr&#x27E9;`?;`
    * `| begin `&#x27E8;instr&#x27E9;<sup>`+`</sup>`end;`
    * `| if `&#x27E8;expr&#x27E9;` then `&#x27E8;instr&#x27E9;<sup>`+`</sup>` (elsif `&#x27E8;expr&#x27E9;` then `&#x27E8;instr&#x27E9;<sup>`+`</sup>`)* (else `&#x27E8;instr&#x27E9;<sup>`+`</sup>`)? end if;`
    * `| for `&#x27E8;ident&#x27E9;` in reverse? `&#x27E8;expr&#x27E9;`..`&#x27E8;expr&#x27E9;` loop `&#x27E8;instr&#x27E9;<sup>`+`</sup>` end loop;`
    * `| while `&#x27E8;expr&#x27E9;` loop `&#x27E8;instr&#x27E9;<sup>`+`</sup>` end loop;`
* **Opérateur**
    + `= | /= | < | <= | > | >= | + | - | * | / | rem | and | and then | or | or else`
* **Accès**
    *  &#x27E8;ident&#x27E9;
    * `| `&#x27E8;expr&#x27E9;`. `&#x27E8;ident&#x27E9;``

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
* sheet de la nouvelle grammaire : https://docs.google.com/spreadsheets/d/1h1LODxT6w9pzOH-wV-fyb90Rk0wJNa0G8ChHCoHRtao/edit?usp=sharing
