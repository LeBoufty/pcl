package outils.OLD.Syntax_OLD;

public class Table_Analyse {
    
    private int[][] table;
    private int nb_term; // nombre de terminaux - nombre de colonnes
    private int nb_nonterm; // nombre de non-terminaux - nombre de lignes

    public Table_Analyse(int nb_term, int nb_nonterm) {
        this.nb_term = nb_term;
        this.nb_nonterm = nb_nonterm;
        this.table = new int[nb_nonterm][nb_term];

        // initialisation de la table à -1
        for (int i = 0; i < nb_nonterm; i++) {
            for (int j = 0; j < nb_term; j++) {
                table[i][j] = -1;
            }
        }
    }

    public int getNb_term() {
        return nb_term;
    }

    public int getNb_nonterm() {
        return nb_nonterm;
    }

    public int get(int i, int j) {
        return table[i][j];
    }
    
    public void set(int i, int j, int val) {
        table[i][j] = val;
    }

}
