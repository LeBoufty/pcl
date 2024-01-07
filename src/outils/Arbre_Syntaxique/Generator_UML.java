package outils.Arbre_Syntaxique;

import java.io.FileWriter;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Queue;

import outils.Syntaxe.Lecteur_S;

public class Generator_UML {
    
    private FileWriter fichier;
    private Noeud_A Arbre_Syntaxique;
    private int num_noeud;

    private HashMap<Integer, String> dico_non_terminal;
    private HashMap<Integer, String> dico_terminal;

    public Generator_UML(String chemin_fichier, Noeud_A Arbre_Syntaxique, HashMap<Integer, String> dico_non_terminal, HashMap<Integer, String> dico_terminal) throws Exception {
        this.fichier = new FileWriter(chemin_fichier);
        this.Arbre_Syntaxique = Arbre_Syntaxique;
        this.num_noeud = 0;

        this.dico_non_terminal = dico_non_terminal;
        this.dico_terminal = dico_terminal;
    }

    private void commencer() throws Exception {
        this.fichier.write("@startuml Arbre_Syntaxique\n");
    }

    private void finir() throws Exception {
        this.fichier.write("@enduml\n");
    }

    private void definitions() throws Exception {

        // Parcours en largeur de l'arbre syntaxique pour écrire les définitions des noeuds, utilisation d'une file d'attente
        // exemple : object "true" as 1 
        
        Queue<Noeud_A> file = new LinkedList<Noeud_A>();
        file.add(this.Arbre_Syntaxique);

        while (!file.isEmpty()) {
            Noeud_A noeud = file.remove();
            this.num_noeud++;
            noeud.UML_id = this.num_noeud;

            if (noeud instanceof Noeud_Non_Terminal) {
                Noeud_Non_Terminal noeudbis = (Noeud_Non_Terminal) noeud;
                this.fichier.write("object \"" + this.dico_non_terminal.get(noeudbis.getCode()) + "\" as " + num_noeud + "\n");
                for (int i = noeudbis.getEnfants().size() - 1; i >= 0; i--) {
                    file.add(noeudbis.getEnfants().get(i));
                }
            } else if (noeud instanceof Noeud_Terminal) {
                Noeud_Terminal noeudbis = (Noeud_Terminal) noeud;
                this.fichier.write("object \"" + this.dico_terminal.get(noeudbis.getCode()) + "\" as " + num_noeud + "\n");

                if (noeudbis.getCode() == Lecteur_S.IDF || noeudbis.getCode() == Lecteur_S.CAR || noeudbis.getCode() == Lecteur_S.ENTIER) {
                    this.fichier.write(num_noeud + " : " + noeudbis.getCodeIdf() + "\n");
                }
            }

        }
    }

    private void relations() throws Exception {

        // Parcours en largeur de l'arbre syntaxique pour écrire les relations entre les noeuds, utilisation d'une file d'attente
        // exemple : 1 -down-> 2

        Queue<Noeud_A> file = new LinkedList<Noeud_A>();
        file.add(this.Arbre_Syntaxique);

        while (!file.isEmpty()) {
            Noeud_A noeud = file.remove();
            
            if (noeud instanceof Noeud_Non_Terminal) {
                Noeud_Non_Terminal noeudbis = (Noeud_Non_Terminal) noeud;
                for (int i = noeudbis.getEnfants().size() - 1; i >= 0; i--) {
                    file.add(noeudbis.getEnfants().get(i));
                    this.fichier.write(noeudbis.UML_id + " -down-> " + noeudbis.getEnfants().get(i).UML_id + "\n");
                }
            }            
        }
    }

    public void generer() throws Exception {
        this.commencer();
        this.definitions();
        this.relations();
        this.finir();
        this.fichier.close();
    }

}
