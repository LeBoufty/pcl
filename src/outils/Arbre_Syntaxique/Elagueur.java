package outils.Arbre_Syntaxique;

import java.util.ArrayList;
import java.util.Stack;

public class Elagueur {
    private Noeud_Non_Terminal Arbre_Syntaxique;
    private static int[] nt_etoile = {3, 8, 14, 16, 21};
    private static int[] nt_prime = {23, 25, 27, 29, 31, 33, 35};

    public Elagueur(Noeud_Non_Terminal Arbre_Syntaxique) {
        this.Arbre_Syntaxique = Arbre_Syntaxique;
    }

    public void elaguer() {
        this.Arbre_Syntaxique.seSacrifier();
        for ( Noeud_Non_Terminal nnt : trouverNoeudsVides()) {
            nnt.supprimer();
        }
        this.Arbre_Syntaxique.seSacrifier();
        comprimerEtoiles();
        remonterPrimes();
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

    private boolean estEtoile(Noeud_Non_Terminal noeud) {
        for (int i : nt_etoile) {
            if (noeud.getCode() == i) {
                return true;
            }
        }
        return false;
    }

    private boolean estPrime(Noeud_Non_Terminal noeud) {
        for (int i : nt_prime) {
            if (noeud.getCode() == i) {
                return true;
            }
        }
        return false;
    }

    private void remonterPrimes() {
        Stack<Noeud_A> pile = new Stack<>();
        ArrayList<Noeud_Non_Terminal> tag = new ArrayList<>();
        pile.push(this.Arbre_Syntaxique);
        while (!pile.isEmpty()) {
            Noeud_A noeud = pile.pop();
            if (noeud instanceof Noeud_Non_Terminal) {
                for (Noeud_A enfant : ((Noeud_Non_Terminal) noeud).getEnfants()) {
                    pile.push(enfant);
                }
                if (estPrime((Noeud_Non_Terminal)noeud)) {
                    tag.add((Noeud_Non_Terminal)noeud);
                }
            }
        }
        for (Noeud_Non_Terminal nnt : tag) {
            nnt.getParent().getEnfants().remove(nnt);
            nnt.getParent().ajouterEnfant(nnt.getEnfants().get(0));
        }
    }

    private void comprimerEtoiles() {
        Stack<Noeud_A> pile = new Stack<>();
        ArrayList<Noeud_Non_Terminal> tag = new ArrayList<>();
        pile.push(this.Arbre_Syntaxique);
        while (!pile.isEmpty()) {
            Noeud_A noeud = pile.pop();
            if (noeud instanceof Noeud_Non_Terminal) {
                for (Noeud_A enfant : ((Noeud_Non_Terminal) noeud).getEnfants()) {
                    pile.push(enfant);
                }
                if (estEtoile((Noeud_Non_Terminal)noeud)) {
                    tag.add((Noeud_Non_Terminal)noeud);
                }
            }
        }
        for (Noeud_Non_Terminal nnt : tag) {
            if (nnt.getParent().getCode() == nnt.getCode()) {
                nnt.getParent().getEnfants().remove(nnt);
                for (Noeud_A enfant : nnt.getEnfants()) {
                    nnt.getParent().ajouterEnfant(enfant);
                }
            }
        }
    }

    public Noeud_Non_Terminal getArbre_Syntaxique() {
        return this.Arbre_Syntaxique;
    }
}
