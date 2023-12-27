package outils;

import java.io.FileReader;
import java.io.File;
import java.nio.charset.StandardCharsets;

public class Lecteur_S {
    
    public static final int OFFSET_LEXEUR = 200;
    public static final int NEW_LINE = '&';

    private FileReader filereader;
    private int num_ligne_en_lecture;
    private int tete;
    private int tete_precedente;
    //private boolean en_erreur;

    public Lecteur_S(String chemin_fichier) throws Exception {
        this.num_ligne_en_lecture = 1;
        //this.en_erreur = false;
        File fichier = new File(chemin_fichier);
        this.filereader = new FileReader(fichier, StandardCharsets.UTF_8);

        this.tete = 0;
        this.tete_precedente = 0;
    }

    public int lire() throws Exception {
        this.tete_precedente = this.tete;
        int nextChar = this.filereader.read() - OFFSET_LEXEUR;

        if (nextChar == -1) { // si on est a la fin du fichier
            this.tete = -1;
            return -1;
        }

        if (nextChar == NEW_LINE) { // si on est a la fin de la ligne
            this.num_ligne_en_lecture++;
            return this.lire();
        }

        this.tete = nextChar;
        
        return this.tete;
    }
 
    // Getters

    public int getNum_ligne_en_lecture() {
        return num_ligne_en_lecture;
    }

    public int getTete() {
        return tete;
    }

    public int getTete_precedente() {
        return tete_precedente;
    }
}
