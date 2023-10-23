## Syntaxe Ada

* **fichier**
    * `with Ada.Text.IO; use Ada.Text.IO; procedure `&#x27E8;ident&#x27E9;` is `&#x27E8;decl&#x27E9;`* begin `&#x27E8;instr&#x27E9;<sup>`+`</sup>` end `&#x27E8;ident&#x27E9;`?;$`
* **decl**
    * `type `&#x27E8;ident&#x27E9;`;`
    * `| type `&#x27E8;ident&#x27E9;` is access `&#x27E8;ident&#x27E9;`;`
    * `| type `&#x27E8;ident&#x27E9;` is record `&#x27E8;champs&#x27E9;<sup>`+`</sup>` and record;`
    * `| `&#x27E8;ident&#x27E9;<sub>`,`</sub><sup>`+`</sup>`: `&#x27E8;type&#x27E9;` (:= `&#x27E8;expr&#x27E9;`)?;`
    * `| procedure `&#x27E8;ident&#x27E9;` `&#x27E8;params&#x27E9;`? is `&#x27E8;decl&#x27E9;`* begin `&#x27E8;instr&#x27E9;<sup>`+`</sup>` end `&#x27E8;ident&#x27E9;`?;`
    * `| function `&#x27E8;ident&#x27E9;` `&#x27E8;params&#x27E9;`? return `&#x27E8;type&#x27E9;` is `&#x27E8;decl&#x27E9;`* begin `&#x27E8;instr&#x27E9;<sup>`+`</sup>` end `&#x27E8;ident&#x27E9;`?;`
* **champs**
    * &#x27E8;ident&#x27E9;<sub>`,`</sub><sup>`+`</sup>`: `&#x27E8;type&#x27E9;`:`
* **type**
    * &#x27E8;ident&#x27E9;
    * `| access `&#x27E8;ident&#x27E9;
* **params**
    * `(`&#x27E8;param&#x27E9;<sub>`;`</sub><sup>`+`</sup>`)`
* **param**    
    * &#x27E8;ident&#x27E9;<sub>`,`</sub><sup>`+`</sup>` : `&#x27E8;mode&#x27E9;`? `&#x27E8;type&#x27E9;
* **mode**
    * `in`
    * `| in out`
* **expr**
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
    * `| new `&#x27E8;ident&#x27E9;
    * `| `&#x27E8;ident&#x27E9;` (`&#x27E8;expr&#x27E9;<sub>`,`</sub><sup>`+`</sup>`)`
    * `| charactere ' val (`&#x27E8;expr&#x27E9;`)`
* **instr**
    * &#x27E8;accès&#x27E9;` := `&#x27E8;expr&#x27E9;`;`
    * `| `&#x27E8;ident&#x27E9;`;`
    * `| `&#x27E8;ident&#x27E9;` (`&#x27E8;expr&#x27E9;<sub>`,`</sub><sup>`+`</sup>`);`
    * `| return `&#x27E8;expr&#x27E9;`?;`
    * `| begin `&#x27E8;instr&#x27E9;<sup>`+`</sup>`end;`
    * `| if `&#x27E8;expr&#x27E9;` then `&#x27E8;instr&#x27E9;<sup>`+`</sup>` (elsif `&#x27E8;expr&#x27E9;` then `&#x27E8;instr&#x27E9;<sup>`+`</sup>`)* (else `&#x27E8;instr&#x27E9;<sup>`+`</sup>`)? end if;`
    * `| for `&#x27E8;ident&#x27E9;` in reverse? `&#x27E8;expr&#x27E9;`..`&#x27E8;expr&#x27E9;` loop `&#x27E8;instr&#x27E9;<sup>`+`</sup>` end loop;`
    * `| while `&#x27E8;expr&#x27E9;` loop `&#x27E8;instr&#x27E9;<sup>`+`</sup>` end loop;`
* **opérateur**
    + `= | /= | < | <= | > | >= | + | - | * | / | rem | and | and then | or | or else`
* **accès**
    *  &#x27E8;ident&#x27E9;
    * `| `&#x27E8;expr&#x27E9;`. `&#x27E8;ident&#x27E9;

## Explications

* **fichier** : la déclaration du fichier Ada.
* **type** : la déclaration d'un type.
* **decl** : la déclaration d'une variable, d'une procédure ou d'une fonction.
* **champs** : la liste des champs d'un type record.
* **params** : la liste des paramètres d'une procédure ou d'une fonction.
* **modes** : le mode d'un paramètre.
* **expre** : une expression Ada.
* **instr** : une instruction Ada.
* **opérateur** : les opérateurs Ada.
* **accès** : un accès à un objet.

## Notes

* sheet de la nouvelle grammaire : https://docs.google.com/spreadsheets/d/1h1LODxT6w9pzOH-wV-fyb90Rk0wJNa0G8ChHCoHRtao/edit?usp=sharing
