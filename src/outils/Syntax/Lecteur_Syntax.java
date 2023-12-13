package outils.Syntax;

import java.io.FileReader;
import java.io.File;
import java.nio.charset.StandardCharsets;

public class Lecteur_Syntax {

    private FileReader filereader;
    private String chemin_fichier;
    private int num_ligne_en_lecture;
    private int tete_de_lecture;
    private int tete_de_lecture_precedente;
    private boolean en_erreur;

    public Lecteur_Syntax(String chemin_fichier) throws Exception {
        this.chemin_fichier = chemin_fichier;
        this.num_ligne_en_lecture = 1;
        this.en_erreur = false;
        File fichier = new File(chemin_fichier);
        this.filereader = new FileReader(fichier, StandardCharsets.UTF_8);
    }

    public int getNum_ligne_en_lecture() {
        return num_ligne_en_lecture;
    }

    public int getTete_de_lecture() {
        return tete_de_lecture;
    }

    public int getTete_de_lecture_precedente() {
        return tete_de_lecture_precedente;
    }

    public boolean isEn_erreur() {
        return en_erreur;
    }

    public int lire() throws Exception {
        this.tete_de_lecture_precedente = this.tete_de_lecture;
        int nextChar = this.filereader.read();
        if (nextChar == -1) {
            this.tete_de_lecture = -1;
            return -1;
        }
        if (nextChar == '&') {
            this.num_ligne_en_lecture++;
            return this.lire();
        }
        this.tete_de_lecture = nextChar;
        
        return this.tete_de_lecture;
    }
}
