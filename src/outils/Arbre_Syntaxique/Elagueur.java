package outils.Arbre_Syntaxique;

import java.util.ArrayList;
import java.util.Stack;

import outils.Logger;

public class Elagueur {
    private Noeud_Non_Terminal Arbre_Syntaxique;
    private static int[] nt_etoile = {3, 8, 14, 16, 21};
    private static int[] nt_prime = {23, 25, 27, 29, 31, 33, 35};
    private static int[] t_inutile = {4, 14, 19, 20, 37};

    public Elagueur(Noeud_Non_Terminal Arbre_Syntaxique) {
        this.Arbre_Syntaxique = Arbre_Syntaxique;
    }

    public void elaguer() {
        Logger.milestone("Début de l'élagage");
        supprimerInutiles();
        Logger.info("Terminaux inutiles supprimés");
        this.Arbre_Syntaxique.seSacrifier();
        Logger.info("Première vague de sacrifices effectuée");
        for ( Noeud_Non_Terminal nnt : trouverNoeudsVides()) {
            nnt.supprimer();
        }
        Logger.info("Non-terminaux vides supprimés");
        this.Arbre_Syntaxique.seSacrifier();
        Logger.info("Deuxième vague de sacrifices effectuée");
        comprimerEtoiles();
        Logger.info("Etoiles compressées");
        remonterPrimes();
        Logger.info("Opérations simplifiées");
        Logger.milestone("Fin de l'élagage");
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
            nnt.getParent().ajouterEnfant(nnt.getEnfants().get(1));
            nnt.getParent().ajouterEnfant(nnt.getEnfants().get(0));
        }
    }

    private boolean estInutile(Noeud_Terminal noeud) {
        for (int i : t_inutile) {
            if (noeud.getCode() == i) {
                return true;
            }
        }
        return false;
    }

    private void supprimerInutiles() {
        Stack<Noeud_A> pile = new Stack<>();
        pile.push(this.Arbre_Syntaxique);
        while (!pile.isEmpty()) {
            Noeud_A noeud = pile.pop();
            if (noeud instanceof Noeud_Terminal) {
                if (estInutile((Noeud_Terminal)noeud)) {
                    noeud.supprimer();
                }
            } else if (noeud instanceof Noeud_Non_Terminal) {
                for (Noeud_A enfant : ((Noeud_Non_Terminal) noeud).getEnfants()) {
                    pile.push(enfant);
                }
            }
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
        for (Noeud_Non_Terminal nnt : (tag)) {
            if (nnt.getParent().getCode() == nnt.getCode()) {
                nnt.getParent().getEnfants().remove(nnt);
                for (Noeud_A enfant : nnt.getEnfants()) {
                    nnt.getParent().ajouterFirstEnfant(enfant);
                }
            }
        }
    }

    public Noeud_Non_Terminal getArbre_Syntaxique() {
        return this.Arbre_Syntaxique;
    }

    public ArrayList<Noeud_A> ArrayInverse(ArrayList<Noeud_A> array) {
        ArrayList<Noeud_A> inverse = new ArrayList<>();
        for (int i = array.size() - 1; i >= 0; i--) {
            inverse.add(array.get(i));
        }
        return inverse;
    }

    public ArrayList<Noeud_Non_Terminal> ArrayInverseNT(ArrayList<Noeud_Non_Terminal> array) {
        ArrayList<Noeud_Non_Terminal> inverse = new ArrayList<>();
        for (int i = array.size() - 1; i >= 0; i--) {
            inverse.add(array.get(i));
        }
        return inverse;
    }
}