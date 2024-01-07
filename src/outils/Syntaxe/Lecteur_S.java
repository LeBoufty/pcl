package outils.Syntaxe;

import java.io.FileReader;
import java.io.File;
import java.nio.charset.StandardCharsets;


import outils.Logger;


// Classe pour la lecture d'un fichier donné par le lexeur pour l'analyseur syntaxique
public class Lecteur_S {
    
    public static final int OFFSET_LEXEUR = 200;
    public static final int NEW_LINE = '&';
    public static final int IDF = 2;
    public static final int CAR = 48;
    public static final int ENTIER = 52;
    public static final int DOLLAR = 57;

    private boolean first_dollar;
    private FileReader filereader;
    private int num_ligne_en_lecture;
    private int tete;
    private int tete_precedente;
    private int code_idf;
    //private boolean en_erreur;

    public Lecteur_S(String chemin_fichier) throws Exception {
        this.num_ligne_en_lecture = 1;
        //this.en_erreur = false;
        File fichier = new File(chemin_fichier);
        this.filereader = new FileReader(fichier, StandardCharsets.UTF_8);

        this.tete = 0;
        this.tete_precedente = 0;
        this.first_dollar = true;
    }

    public int lire() throws Exception {
        this.tete_precedente = this.tete;
        int nextChar = this.filereader.read() - OFFSET_LEXEUR;
        
        if (nextChar + OFFSET_LEXEUR == -1) { // si on est a la fin du fichier
            if (this.first_dollar) {
                this.first_dollar = false;
                return DOLLAR;
            }
            this.tete = -1;
            return this.tete;
        }

        if (nextChar + OFFSET_LEXEUR == NEW_LINE) { // si on est a la fin de la ligne
            this.num_ligne_en_lecture++;
            
            return this.lire();
        }

        if (nextChar == IDF || nextChar == CAR || nextChar == ENTIER) { // si c'est un IDF ou un CAR ou un ENTIER
            // this.filereader.read(); // on lit le caractère suivant pour le jeter
            this.code_idf = this.filereader.read() - OFFSET_LEXEUR; // on lit le code de l'IDF ou du CAR ou de l'ENTIER
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

    public int getCode_idf() {
        return code_idf;
    }
}
