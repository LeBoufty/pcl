package outils.OLD;

import java.io.File;
import java.io.FileReader;
import java.nio.charset.StandardCharsets;
//import outils.Logger;

import outils.Logger;


public class Lecteur {
    
    private FileReader filereader;
    private String chemin_fichier;
    private int num_ligne_en_lecture;
    private int num_char_en_lecture;
    private char tete_de_lecture;
    private char tete_de_lecture_precedente;
    private boolean en_erreur;

    public Lecteur(String nom_fichier) throws Exception {
        this.chemin_fichier = nom_fichier;
        this.num_ligne_en_lecture = 1;
        this.num_char_en_lecture = 0;
        this.en_erreur = false;
        File fichier = new File(nom_fichier);
        this.filereader = new FileReader(fichier, StandardCharsets.UTF_8);
    }

    private boolean is_tete_ASCII() {
        return (int) this.tete_de_lecture < 128;
    }



    public char lire() throws Exception {
        this.tete_de_lecture_precedente = this.tete_de_lecture;
        int nextChar = this.filereader.read();
        //this.num_char_en_lecture++; Il était en trop le coquin heheh

        if (nextChar == -1) {
            this.tete_de_lecture = '\0';
        } else {
            this.tete_de_lecture = (char) nextChar;
            if (!this.is_tete_ASCII()) {
                Logger.error("Le fichier " + this.chemin_fichier + " contient des caractères non-ASCII" + " à la ligne " + this.num_ligne_en_lecture + " et au caractère " + this.num_char_en_lecture);
                this.tete_de_lecture = ' ';
                this.en_erreur = true;
            }
            if (this.tete_de_lecture == '\n') {
                this.num_ligne_en_lecture++;
                this.num_char_en_lecture = 0;
            } else {
                this.num_char_en_lecture++;
            }
        }

        if (this.tete_de_lecture_precedente != '\'') {
            this.to_lower();
        }
        

        return this.tete_de_lecture;
    }

    public void fermer() throws Exception {
        this.filereader.close();
    }

    public int get_num_ligne_en_lecture() {
        return this.num_ligne_en_lecture;
    }

    public int get_num_char_en_lecture() {
        return this.num_char_en_lecture;
    }

    public boolean get_en_erreur() {
        return this.en_erreur;
    }

    public String get_chemin_fichier() {
        return this.chemin_fichier;
    }

    public char get_tete_de_lecture() {
        return this.tete_de_lecture;
    }

    public boolean is_control_char() {
        return this.tete_de_lecture <= 32;
    }

    public boolean is_digit() {
        return this.tete_de_lecture >= '0' && this.tete_de_lecture <= '9';
    }

    public boolean is_letter() {
        return (this.tete_de_lecture >= 'a' && this.tete_de_lecture <= 'z') || (this.tete_de_lecture >= 'A' && this.tete_de_lecture <= 'Z');
    }

    public boolean is_upper() {
        return this.tete_de_lecture >= 'A' && this.tete_de_lecture <= 'Z';
    }

    private void to_lower() {
        if (this.is_upper()) {
            this.tete_de_lecture = (char) (this.tete_de_lecture + 32);
        }
    }

    public boolean is_letter_or_digit() {
        return this.is_letter() || this.is_digit() || this.tete_de_lecture == '_';
    }

    public boolean is_symbol() {
        return (this.tete_de_lecture >= 33 && this.tete_de_lecture <= 47 && this.tete_de_lecture != 39) || (this.tete_de_lecture >= 58 && this.tete_de_lecture <= 94) || (this.tete_de_lecture >= 123 && this.tete_de_lecture <= 126);
    }

    public boolean is_symbol_2() {
        return this.tete_de_lecture == '=' || this.tete_de_lecture == '.' || this.tete_de_lecture == '-';
    }

}
  