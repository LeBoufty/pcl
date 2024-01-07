package outils.Arbre_Syntaxique;

import java.util.ArrayList;

public class Noeud_Non_Terminal extends Noeud_A {

    private int code_non_terminal;
    private ArrayList<Noeud_A> enfants;
    
    public Noeud_Non_Terminal(int code_non_terminal) {
        super();
        this.code_non_terminal = code_non_terminal;
        this.enfants = new ArrayList<>();
    }

    public int getCode() {
        return this.code_non_terminal;
    }

    public void ajouterEnfant(Noeud_A enfant) {
        this.enfants.add(enfant);
        enfant.setParent(this);
    }

    public ArrayList<Noeud_A> getEnfants() {
        return this.enfants;
    }
    
}
