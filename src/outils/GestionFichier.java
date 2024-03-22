package outils;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

public class GestionFichier {
    static private String contenuHeader = ""; // Contenu à écrire dans le fichier
    static private String contenu = ""; // Contenu à écrire dans le fichier
    static private String contenuFooter = ""; //Pour les fonctions

    // Méthode pour ajouter du texte au contenu
    public static void Addcontenu(String ajout) {
        contenu += ajout+"\n";
    }

    public static void AddcontenuHeader(String ajout) {
        contenuHeader += ajout+"\n";
    }

    public static void AddcontenuFooter(String ajout) {
        contenuFooter += ajout+"\n";
    }

    // Méthode pour créer un fichier avec le contenu actuel
    public static void produirefichier(String nomFichier) {
        File fichier = new File(nomFichier);
        BufferedWriter bw = null;
        try {
            // Création d'un FileWriter pour écrire dans le fichier
            bw = new BufferedWriter(new FileWriter(fichier));
            bw.write(contenuHeader+contenu+contenuFooter);
            System.out.println("Fichier créé avec succès : " + fichier.getAbsolutePath());
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (bw != null) {
                try {
                    bw.close(); // Assurez-vous de fermer le BufferedWriter après utilisation
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

