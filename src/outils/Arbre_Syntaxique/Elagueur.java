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
<<<<<<< HEAD
    private static String[] nt_prime_nom = {"£ORPrime","£ANDPrime","£NOTPrime","£EQUALSPrime","£COMPARATORSPrime","£ADDPrime", "£MULTPrime"};
=======
    private static String[] nt_plus_nom={"£CHAMPPlus","£PARAMPlus","£INSTRPlus"};
    private static int[] nt_prime = {23, 25, 27, 29, 31, 33, 35};
>>>>>>> 16e6b900901fce12390919c1613c2b0fb4a527eb
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
        deprime_elague();
        if (true) {
            Logger.info("Primes déprimées");
            return;
        }
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
        mettreassertiondansdecl();
        Logger.info("assertions mis dans les declarations");
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
        int[] nt_prime = new int[nt_prime_nom.length];

        for (int i=0 ; i<nt_prime_nom.length ; i++){
            nt_prime[i] = nonterminaux.get(nt_prime_nom[i]);
        }
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

    private void mettreassertiondansdecl()
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
                if (nonterminaux.get("£DECLARATION")==((Noeud_Non_Terminal)noeud).getCode() ) {
                    tag.add((Noeud_Non_Terminal)noeud);
                }
            }
        }
        for (Noeud_Non_Terminal nnt : (tag)) {
            ArrayList<Noeud_A> listeenfant=nnt.getEnfants();
            Collections.reverse(listeenfant);
            Noeud_A idfenfant=null;
            for(int i=listeenfant.size()-1;i>=0;i--)
            {
                if(listeenfant.get(i) instanceof Noeud_Terminal)
                {
                    if(terminaux.get("IDF")==((Noeud_Terminal)listeenfant.get(i)).getCode() )
                    {
                        idfenfant=listeenfant.get(i);
                        listeenfant.remove(i);
                    }
                }
            }
            for (Noeud_A enfant : listeenfant) {
                if(enfant instanceof Noeud_Non_Terminal)
                {
                    if(nonterminaux.get("£ASSERTION")==((Noeud_Non_Terminal)enfant).getCode() && idfenfant!=null)
                    {
                        nnt.getParent().ajouterEnfant(enfant);
                        ((Noeud_Non_Terminal) enfant).ajouterEnfant(idfenfant);
                        enfant.setParent(nnt.getParent());
                    }
                }
                
            }
            nnt.supprimer();
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

    public void associativite_gauche_prime(Noeud_Non_Terminal noeud) {
        // Le but est de trouver les noeuds de type prime ayant un parent de type prime, ce type de noeud est nommé P4
        // Le parent de P2 de type prime est nommé P3
        // Le parent de P1 est de type non terminal (par exemple £ADD) et est nommé N2
        // Le parent de N1 est de type non terminal (par exemple £COMPARATOR) et est nommé N0
        // Le but est de rajouter N1 en tant qu'enfant de N0 et de remplacer N2 en tant qu'enfant de N1
        // Puis de remplacer P4 en tant qu'enfant de N1
        // Donne en paramètre le noeud P4

        Noeud_Non_Terminal P4 = noeud;
        System.out.println("P4 : " + P4.getCode());
        Noeud_Non_Terminal P3 = P4.getParent();
        System.out.println("P3 : " + P3.getCode());
        Noeud_Non_Terminal N2 = P3.getParent();
        System.out.println("N2 : " + N2.getCode());
        Noeud_Non_Terminal N0 = N2.getParent();
        System.out.println("N0 : " + N0.getCode());

        // On supprime P4 de la liste des enfants de P3
        P3.getEnfants().remove(P4);

        // On duplique N2 en N1
        Noeud_Non_Terminal N1 = new Noeud_Non_Terminal(N2.getCode());

        // On remplace N2 par N1 dans la liste des enfants de N0
        N0.getEnfants().remove(N2);
        N0.getEnfants().add(N1);

        // Change les parents de N1
        N1.setParent(N0);

        // On remplace P4 par N1 dans la liste des enfants de P3
        N1.ajouterEnfant(P4);
        
        // Change les parents de P4
        P4.setParent(N1);

        // On rajooute N2 en tant qu'enfant de N1
        N1.ajouterEnfant(N2);

        // Change les parents de N2
        N2.setParent(N1);
    }

    public int trouve_et_deprime() {
        // Renvoie 1 si un noeud de type prime (avec un parent de type prime) a été trouvé et déprimé, 0 sinon

        Stack<Noeud_A> pile = new Stack<>();
        pile.push(this.Arbre_Syntaxique);
        while (!pile.isEmpty()) {
            Noeud_A noeud = pile.pop();
            if (noeud instanceof Noeud_Non_Terminal) {
                for (Noeud_A enfant : ((Noeud_Non_Terminal) noeud).getEnfants()) {
                    pile.push(enfant);
                }
                if (estPrime((Noeud_Non_Terminal)noeud) && estPrime(((Noeud_Non_Terminal)noeud).getParent())) {
                    associativite_gauche_prime((Noeud_Non_Terminal)noeud);
                    return 1;
                }
            }
        }
        return 0;
    }

    public void deprime_elague() {
        // Tant qu'un noeud de type prime (avec un parent de type prime) est trouvé, on le déprime
        retire_prime_sans_enfant();

        while (trouve_et_deprime() == 1) {
            Logger.info("Déprimé");
            
        }
    }

    public void retire_prime_sans_enfant() {
        // Le but est de trouver tous les primes sans enfant et de les supprimer

        Stack<Noeud_A> pile = new Stack<>();

        pile.push(this.Arbre_Syntaxique);
        while (!pile.isEmpty()) {
            Noeud_A noeud = pile.pop();
            if (noeud instanceof Noeud_Non_Terminal) {
                for (Noeud_A enfant : ((Noeud_Non_Terminal) noeud).getEnfants()) {
                    pile.push(enfant);
                }
                if (estPrime((Noeud_Non_Terminal)noeud) && noeud.sansEnfant()) {
                    noeud.supprimer();
                }
            }
        }
    }

}