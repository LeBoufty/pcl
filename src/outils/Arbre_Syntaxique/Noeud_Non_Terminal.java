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

    public void setCode(int code_non_terminal) {
        this.code_non_terminal = code_non_terminal;
    }

    public void ajouterEnfant(Noeud_A enfant) {
        this.enfants.add(enfant);
        enfant.setParent(this);
    }

    public void ajouterFirstEnfant(Noeud_A enfant) {
        this.enfants.add(0, enfant);
        enfant.setParent(this);
    }

    public ArrayList<Noeud_A> getEnfants() {
        return this.enfants;
    }
    
    public void seSacrifier() {
        if (this.enfants.size() == 1) {
            int index = this.getParent().getEnfants().indexOf(this);
            this.getParent().getEnfants().set(index, this.enfants.get(0));
            this.enfants.get(0).setParent(this.getParent());
            this.enfants.get(0).seSacrifier();
            return;
        }
        for (Noeud_A noeud_A : enfants) {
            noeud_A.seSacrifier();
        }
    }

    public boolean sansEnfant() {
        return this.enfants.isEmpty();
    }
}
