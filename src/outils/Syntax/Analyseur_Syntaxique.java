package outils.Syntax;

import java.util.Stack;

public class Analyseur_Syntaxique {

    private Regle regle;
    private Table_Analyse table;
    private Lecteur_Syntax lect;
    private Stack<Integer[]> pile;
    private boolean en_erreur;   

    public Analyseur_Syntaxique(String filename) throws Exception {
        regle = Grammar_Hardcode.regle_test();
        table = Grammar_Hardcode.table_test();
        pile = new Stack<Integer[]>();
        en_erreur = false;
        
        lect = new Lecteur_Syntax(filename);
    }

    public void analyse() throws Exception {
        empiler_regle(-2); // empiler le first_stack
        int tete_de_lecture = lect.lire();
        Integer[] element = depiler();
        
        while (!pile.empty()){
            if (element[0] == 1) { // si c'est un terminal
                if (element[1] == tete_de_lecture) { // si c'est le terminal attendu
                    tete_de_lecture = lect.lire();
                    element = depiler();
                }
                else { // si c'est pas le terminal attendu
                    en_erreur = true;
                    return;
                }
            }
            else { // si c'est un non-terminal
                int num_regle = table.get(element[1], tete_de_lecture);
                empiler_regle(num_regle);
                element = depiler();
            }
                
        }
        
    }

    private void empiler_regle(int num_regle) {
        if (num_regle == -1) { // si la regle est vide
            en_erreur = true;
            return;
        }

        Integer[] regles;
        if (num_regle == -2) { // si la regle est le first_stack
            regles = this.regle.getFirst_stack();            
        }
        else {
            regles = this.regle.get(num_regle);
        }

        int taille = regles.length/2;
        for (int i = taille - 1; i >= 0; i--) {
            Integer[] element = new Integer[2];
            element[0] = regles[i*2];
            element[1] = regles[i*2 + 1];
            pile.push(element);
        }
    }

    private Integer[] depiler() {
        return pile.pop();
    }

}
