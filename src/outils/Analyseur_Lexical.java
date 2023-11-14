package outils;

// import outils.Lecteur;
// import outils.Logger;
// import outils.Mot_Lexical;
// import outils.Dictionnaire_Lexical;
// import outils.Ecrivain_Lexical;
// import java.util.HashMap;

public class Analyseur_Lexical {
    private Lecteur lecteur;
    private String chemin_fichier;

    private Mot_Lexical mot_precedent;
    private Mot_Lexical mot_en_lecture;

    private boolean en_erreur;
    private Dictionnaire_Lexical dico;

    public Analyseur_Lexical(String nom_fichier) throws Exception {
        this.chemin_fichier = nom_fichier;
        this.lecteur = new Lecteur(nom_fichier);
        this.lecteur.lire();

        this.mot_precedent = new Mot_Lexical();
        this.mot_en_lecture = new Mot_Lexical();

        this.en_erreur = false;
        this.dico = new Dictionnaire_Lexical();
    }

    public void translate_mot() {
        this.mot_precedent = this.mot_en_lecture;
        this.mot_en_lecture = new Mot_Lexical();
    }
    
    public void lire_char() throws Exception {
        this.lecteur.lire();
        if (this.lecteur.get_en_erreur()) {
            this.en_erreur = true;
        }
    }

    public void lit_mot() throws Exception {


        translate_mot();

        while (this.lecteur.is_control_char() && this.lecteur.get_tete_de_lecture() != '\0') {
            this.lire_char();
        }

        this.mot_en_lecture.num_ligne_mot = this.lecteur.get_num_ligne_en_lecture();
        this.mot_en_lecture.num_char_mot = this.lecteur.get_num_char_en_lecture();

        if (this.lecteur.get_tete_de_lecture() == '\0') {
            this.mot_en_lecture.mot = "EOF";
            return;
        } 

        if (this.lecteur.get_tete_de_lecture() == '\'') {
            this.mot_en_lecture.mot = "'";
            this.lire_char();
            this.mot_en_lecture.mot += this.lecteur.get_tete_de_lecture();
            this.lire_char();
            if (this.lecteur.get_tete_de_lecture() == '\'') {
                this.mot_en_lecture.mot += "'";
                this.lire_char();
                return;
            }
            return;        
        }

        if (this.lecteur.is_letter_or_digit()) {
            this.mot_en_lecture.mot = "" + this.lecteur.get_tete_de_lecture();
            this.lire_char();
            while (this.lecteur.is_letter_or_digit()) {
                this.mot_en_lecture.mot += this.lecteur.get_tete_de_lecture();
                this.lire_char();
            }

            if (this.lecteur.get_tete_de_lecture() == '\'' && this.mot_en_lecture.mot.contentEquals("character")) { // character'val
                this.mot_en_lecture.mot += "'";
                
                this.lire_char();

                while (this.lecteur.is_letter_or_digit()) {
                    this.mot_en_lecture.mot += this.lecteur.get_tete_de_lecture();
                    this.lire_char();
                }
            }
            return;
        }

        if (this.lecteur.is_symbol()) {
            this.mot_en_lecture.mot = "" + this.lecteur.get_tete_de_lecture();
            this.lire_char();
            if (this.lecteur.is_symbol_2()) {
                this.mot_en_lecture.mot += this.lecteur.get_tete_de_lecture();
                this.lire_char();      
            }
            if (this.mot_en_lecture.mot.equals("--")) { // Cas commentaire
                
                while (this.lecteur.get_tete_de_lecture() != '\n' && this.lecteur.get_tete_de_lecture() != '\0') {
                    this.lire_char();
                }
                this.mot_en_lecture = this.mot_precedent;
                
                this.lit_mot();
            }
            return;
        } 

    } // fin lit_mot

    public boolean get_en_erreur() {
        return this.en_erreur;
    }

    public void ecrire_tab_idf() throws Exception {
        Ecrivain_Lexical ecrivain = new Ecrivain_Lexical(this.chemin_fichier + ".idf");

        for (String nom_idf : this.dico.dico_idf.keySet()) {
            ecrivain.ecrire_tab_idf(this.dico.dico_idf.get(nom_idf), nom_idf);
        }

        ecrivain.fermer();
    }

    public void analyse() throws Exception {
        Ecrivain_Lexical ecrivain = new Ecrivain_Lexical(this.chemin_fichier + ".lex");

        while (!this.mot_precedent.mot.contentEquals("EOF")) {
            this.lit_mot();
            this.dico.search_code(this.mot_en_lecture);

            if (this.dico.en_erreur) {
                this.en_erreur = true;
                continue;
            }

            if (this.mot_precedent.code_mot == -1) {
                continue;
            }
            // Test si on a pas un "or else" ou "and then"
            if (this.mot_precedent.code_mot == 16 && this.mot_en_lecture.code_mot == 26) {
                this.mot_en_lecture.mot = "or else";
                this.mot_en_lecture.num_char_mot = this.mot_precedent.num_char_mot;
                this.mot_en_lecture.num_ligne_mot = this.mot_precedent.num_ligne_mot;
                continue;
            }
            if (this.mot_precedent.code_mot == 14 && this.mot_en_lecture.code_mot == 25) {
                this.mot_en_lecture.mot = "and then";
                this.mot_en_lecture.num_char_mot = this.mot_precedent.num_char_mot;
                this.mot_en_lecture.num_ligne_mot = this.mot_precedent.num_ligne_mot;
                continue;
            }

            while (this.mot_precedent.num_ligne_mot > ecrivain.get_num_ligne_en_ecriture()) {
                ecrivain.sauter_ligne();
            }

            if (this.mot_precedent.code_mot == 43) {
                ecrivain.ecrire_idf(this.mot_precedent.code_mot, this.mot_precedent.code_idf);
            } else if (this.mot_precedent.code_mot == 54 || this.mot_precedent.code_mot == 44) {
                ecrivain.ecrire_constante(this.mot_precedent.code_mot, this.mot_precedent.mot);
            } else {
                ecrivain.ecrire_mot_clef(this.mot_precedent.code_mot);
            }

        }

        
        ecrire_tab_idf();

        ecrivain.fermer();
        this.lecteur.fermer();
    }

}
