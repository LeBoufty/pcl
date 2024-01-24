package outils.Arbre_Syntaxique;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Stack;

import outils.Logger;
import outils.Syntaxe.CSVParser;

public class Elagueur {
    private Noeud_Non_Terminal Arbre_Syntaxique;
    private static String[] nt_etoile_nom={"£DECLEtoile","£CHAMPEtoile","£PARAMEtoile","£OPERATEUREtoile","£INSTREtoile","£ELSIFEtoile"};
    private static String[] nt_plus_nom={"£CHAMPPlus","£PARAMPlus","£INSTRPlus"};
    private static int[] nt_prime = {23, 25, 27, 29, 31, 33, 35};
    private static String[] t_utile = {"IDF", "caractere", "entier", "false", "true", "null"};
    private static HashMap<String, Integer> nonterminaux;
    private static HashMap<String, Integer> terminaux;

    public Elagueur(Noeud_Non_Terminal Arbre_Syntaxique, List<List<String>> records) {
        this.Arbre_Syntaxique = Arbre_Syntaxique;
        terminaux = CSVParser.getFirstLigne(records);
        nonterminaux = CSVParser.getFirstColonne(records);
    }

    public void elaguer() {
        Logger.milestone("Début de l'élagage");
        //this.Arbre_Syntaxique.seSacrifier();
        //Logger.info("Première vague de sacrifices effectuée");
        for ( Noeud_Non_Terminal nnt : trouverNoeudsVides()) {
            nnt.supprimer();
        }
        Logger.info("Non-terminaux vides supprimés");
        this.Arbre_Syntaxique.seSacrifier();
        Logger.info("Sacrifices effectués");
        comprimerEtoiles();
        Logger.info("Etoiles compressées");
        transmettreetoileauplus();
        Logger.info("enfants des etoiles transmis aux plus");
        //remonterPrimes();
        //Logger.info("Opérations simplifiées");
        supprimerInutiles();
        Logger.info("Terminaux inutiles supprimés");
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

    // private boolean estEtoile(Noeud_Non_Terminal noeud) {
    //     for (int i : nt_etoile) {
    //         if (noeud.getCode() == i) {
    //             return true;
    //         }
    //     }
    //     return false;
    // }

    private boolean estEtoile(Noeud_Non_Terminal noeud) {
        int[] nt_etoile = new int[nt_etoile_nom.length];
        for (int i=0 ; i<nt_etoile_nom.length ; i++){
            nt_etoile[i] = nonterminaux.get(nt_etoile_nom[i]);
        }
        for (int i : nt_etoile) {
            if (noeud.getCode() == i) {
                return true;
            }
        }
        return false;
    }

    private boolean estPlus(Noeud_Non_Terminal noeud) {
        int[] nt_plus = new int[nt_plus_nom.length];
        for (int i=0 ; i<nt_plus_nom.length ; i++){
            nt_plus[i] = nonterminaux.get(nt_plus_nom[i]);
        }
        for (int i : nt_plus) {
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

    // TODO : réécrire
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
        for(String s : t_utile) {
            if (noeud.getCode() == terminaux.get(s)) {
                return false;
            }
        } return true;
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
                ArrayList<Noeud_A> listeenfant=nnt.getEnfants();
                Collections.reverse(listeenfant);
                for (Noeud_A enfant : listeenfant) {
                    nnt.getParent().ajouterFirstEnfant(enfant);
                }
            }
        }
    }

    private void transmettreetoileauplus()
    {
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
            if(estPlus(nnt.getParent()))
            {
                ArrayList<Noeud_A> listeenfant=nnt.getEnfants();
                Collections.reverse(listeenfant);
                for (Noeud_A enfant : listeenfant) {
                    nnt.getParent().ajouterFirstEnfant(enfant);
                    enfant.setParent(nnt.getParent());
                }
                nnt.supprimer();
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