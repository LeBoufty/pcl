package outils.Arbre_Syntaxique;

import java.util.ArrayList;
import java.util.Stack;

public class Elagueur {
    private Noeud_Non_Terminal Arbre_Syntaxique;

    public Elagueur(Noeud_Non_Terminal Arbre_Syntaxique) {
        this.Arbre_Syntaxique = Arbre_Syntaxique;
    }

    public void elaguer() {
        this.Arbre_Syntaxique.seSacrifier();
        for ( Noeud_Non_Terminal nnt : trouverNoeudsVides()) {
            nnt.supprimer();
        }
        this.Arbre_Syntaxique.seSacrifier();
    }

    private ArrayList<Noeud_Non_Terminal> trouverNoeudsVides() {
        ArrayList<Noeud_Non_Terminal> tag = new ArrayList<>();
        Stack<Noeud_A> pile = new Stack<>();
        pile.push(this.Arbre_Syntaxique);
        while (!pile.isEmpty()) {
            Noeud_A noeud = pile.pop();
            if (noeud instanceof Noeud_Non_Terminal && noeud.sansEnfant()) {
                tag.add((Noeud_Non_Terminal)noeud);
            } else if (noeud instanceof Noeud_Non_Terminal) {
                for (Noeud_A enfant : ((Noeud_Non_Terminal) noeud).getEnfants()) {
                    pile.push(enfant);
                }
            }
        }
        return tag;
    }

    public Noeud_Non_Terminal getArbre_Syntaxique() {
        return this.Arbre_Syntaxique;
    }
}
