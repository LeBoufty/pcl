package outils.Lexeur;

import java.io.File;
import java.io.FileReader;
import java.nio.charset.StandardCharsets;

// Classe pour la lecture d'un code pour le lexeur
public class Lecteur_L {
    
    private FileReader filereader;
    private int num_ligne_en_lecture;
    private int num_char_en_lecture;
    private char tete_de_lecture;
    private char tete_de_lecture_precedente;
    private boolean en_erreur;

    private boolean DEBUG = false;

    public Lecteur_L(String nom_fichier) throws Exception {
        this.num_ligne_en_lecture = 1;
        this.num_char_en_lecture = 0;
        this.en_erreur = false;
        File fichier = new File(nom_fichier);
        this.filereader = new FileReader(fichier, StandardCharsets.UTF_8);
    }
}
