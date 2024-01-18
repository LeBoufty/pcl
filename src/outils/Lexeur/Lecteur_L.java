package outils.Lexeur;

import java.io.File;
import java.io.FileReader;
import java.nio.charset.StandardCharsets;

import outils.Logger;

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

    public char lire() throws Exception {
        this.tete_de_lecture_precedente = this.tete_de_lecture;
        int nextChar = this.filereader.read();
        this.num_char_en_lecture++;

        if (nextChar == -1) {
            this.tete_de_lecture = '\0';
        } else {
            this.tete_de_lecture = (char) nextChar;
            if (!is_Char.is_ASCII(this.tete_de_lecture)) {
                Logger.error("Le fichier contient des caractères non-ASCII" + " à la ligne " + this.num_ligne_en_lecture + " et au caractère " + this.num_char_en_lecture);
                this.tete_de_lecture = ' ';
                this.en_erreur = true;
            }
            if (this.tete_de_lecture == '\n') {
                this.num_ligne_en_lecture++;
                this.num_char_en_lecture = 0;
            }
        }
        
        if (DEBUG) {
            Logger.info("Lecteur_L.lire() : " + this.tete_de_lecture);
        }

        return this.tete_de_lecture;
    }

    public void fermer() throws Exception {
        this.filereader.close();
    }

    // Getters

    public int getNum_ligne_en_lecture() {
        return num_ligne_en_lecture;
    }

    public int getNum_char_en_lecture() {
        return num_char_en_lecture;
    }

    public char getTete_de_lecture() {
        return tete_de_lecture;
    }

    public char getTete_de_lecture_precedente() {
        return tete_de_lecture_precedente;
    }

    public boolean isEn_erreur() {
        return en_erreur;
    }
}
