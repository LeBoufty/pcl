package arbres.PlantUML;

import java.io.FileWriter;
import java.util.ArrayList;

import arbres.Noeud;

public class GenerateurPUML {
    private FileWriter fichier;
    private NoeudUML racineUML;
    public GenerateurPUML(Noeud racine, String nomFichier) throws Exception {
        this.racineUML = new NoeudUML(racine);
        fichier = new FileWriter(nomFichier);
    }
    private void commencer() throws Exception {
        fichier.write("@startuml ArbreSyntaxique\n");
    }
    private void terminer() throws Exception {
        fichier.write("@enduml\n");
        fichier.close();
    }
    public void generer() throws Exception {
        commencer();
        genererDefinitions();
        genererRelations();
        terminer();
    }
    private void genererDefinitions() throws Exception {
        // On conserve une liste des noeuds à définir.
        // Vu que chaque noeud apparaît une seule fois, on a pas
        // besoin de vérifier si on l'a déjà ajouté.
        ArrayList<NoeudUML> noeuds = new ArrayList<NoeudUML>();
        // On commence à la racine
        noeuds.add(racineUML);
        while (noeuds.size() > 0) {
            // On retire un noeud de la liste.
            NoeudUML n = noeuds.remove(0);
            // On écrit sa définition.
            fichier.write(n.definition());
            // Et on ajoute ses enfants à la liste.
            noeuds.addAll(n.getEnfants());
        }
    }
    private void genererRelations() throws Exception {
        // De même avec les relations.
        ArrayList<NoeudUML> noeuds = new ArrayList<NoeudUML>();
        noeuds.add(racineUML);
        while (noeuds.size() > 0) {
            NoeudUML n = noeuds.remove(0);
            fichier.write(n.relations());
            noeuds.addAll(n.getEnfants());
        }
    }
}
