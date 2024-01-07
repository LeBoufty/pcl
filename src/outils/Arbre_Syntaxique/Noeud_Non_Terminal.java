package outils.Arbre_Syntaxique;

import java.util.ArrayList;

public class Noeud_Non_Terminal extends Noeud {

    private int code_non_terminal;
    private ArrayList<Noeud> enfants;
    
    public Noeud_Non_Terminal(int code_non_terminal) {
        super();
        this.code_non_terminal = code_non_terminal;
        this.enfants = new ArrayList<>();
    }

    public int getCode() {
        return this.code_non_terminal;
    }

    public void ajouterEnfant(Noeud enfant) {
        this.enfants.add(enfant);
        enfant.setParent(this);
    }
    
}
