package arbres.PlantUML;

import java.io.FileWriter;
import java.util.ArrayList;
import outils.Logger;

import arbres.Noeud;
import java.nio.charset.StandardCharsets;

public class GenerateurPUML {
    private FileWriter fichier;
    private NoeudUML racineUML;
    public GenerateurPUML(Noeud racine, String nomFichier) throws Exception {
        Logger.info("Traduction de l'arbre...");
        this.racineUML = new NoeudUML(racine);
        Logger.milestone("Arbre UML généré");
        Logger.info("Ouverture du fichier "+ nomFichier);
        fichier = new FileWriter(nomFichier, StandardCharsets.UTF_8);
    }
    private void commencer() throws Exception {
        fichier.write("@startuml ArbreSyntaxique\n");
    }
    private void terminer() throws Exception {
        fichier.write("@enduml\n");
        fichier.close();
    }
    public void generer() throws Exception {
        Logger.info("Début de la génération dans "+ fichier.toString());
        commencer();
        Logger.info("Génération des définitions...");
        genererDefinitions();
        Logger.info("Génération des relations...");
        genererRelations();
        terminer();
        Logger.milestone("Fichier "+ fichier.toString() +" terminé");
    }
    private void genererDefinitions() throws Exception {
        int nbnoeuds = 0;
        // On conserve une liste des noeuds à définir.
        // Vu que chaque noeud apparaît une seule fois, on a pas
        // besoin de vérifier si on l'a déjà ajouté.
        ArrayList<NoeudUML> noeuds = new ArrayList<NoeudUML>();
        // On commence à la racine
        noeuds.add(racineUML);
        while (noeuds.size() > 0) {
            nbnoeuds++;
            // On retire un noeud de la liste.
            NoeudUML n = noeuds.remove(0);
            // On écrit sa définition.
            fichier.write(n.definition());
            // Et on ajoute ses enfants à la liste.
            noeuds.addAll(n.getEnfants());
        }
        Logger.info("Génération de "+ nbnoeuds +" définitions terminée");
    }
    private void genererRelations() throws Exception {
        int nbrelations = 0;
        // De même avec les relations.
        ArrayList<NoeudUML> noeuds = new ArrayList<NoeudUML>();
        noeuds.add(racineUML);
        while (noeuds.size() > 0) {
            NoeudUML n = noeuds.remove(0);
            nbrelations += n.getEnfants().size();
            fichier.write(n.relations());
            noeuds.addAll(n.getEnfants());
        }
        Logger.info("Génération de "+ nbrelations +" relations terminée");
    }
}
