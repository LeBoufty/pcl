package outils.Lexeur;

import outils.Logger;

public class Analyseur_L {
    
    private Lecteur_L lecteur;
    private String chemin_fichier;
    private Ecrivain_L ecrivain_code;
    
    private Mot_L mot_preprecedent;
    private Mot_L mot_precedent;
    private Mot_L mot_en_lecture;

    private int num_ligne_en_lecture;

    private boolean en_erreur;
    private boolean DEBUG = true;
    private Dico_L dico;

    public Analyseur_L(String nom_fichier) throws Exception {
        this.chemin_fichier = nom_fichier;
        this.lecteur = new Lecteur_L(nom_fichier);
        this.ecrivain_code = new Ecrivain_L(nom_fichier + ".lex");
        this.lecteur.lire();

        this.mot_preprecedent = new Mot_L();
        this.mot_precedent = new Mot_L();
        this.mot_en_lecture = new Mot_L();

        this.num_ligne_en_lecture = 1;

        this.en_erreur = false;
        this.dico = new Dico_L();
    }

    private void new_mot() {
        this.mot_preprecedent = this.mot_precedent;
        this.mot_precedent = this.mot_en_lecture;
        this.mot_en_lecture = new Mot_L();
    }

    private void anti_new_mot() {
        this.mot_en_lecture = this.mot_precedent;
        this.mot_precedent = this.mot_preprecedent;
    }

    private void lire_char() throws Exception {
        this.lecteur.lire();
        if (this.lecteur.isEn_erreur()) {
            this.en_erreur = true;
        }
    }

    private void lit_mot() throws Exception { // Lit un mot et le stocke dans mot_en_lecture
        // C'est un segmenteur de mots


        new_mot(); // On stocke le mot précédent dans mot_precedent et on crée un nouveau mot en lecture

        while (lecteur.getTete_de_lecture() != '\0' && is_Char.is_control_char(lecteur.getTete_de_lecture())) { // On passe les caractères de contrôle (espaces, tabulations, etc.)
            
            lire_char();
        }

        // On stocke la position du mot en lecture
        mot_en_lecture.num_ligne_mot = lecteur.getNum_ligne_en_lecture();
        mot_en_lecture.num_char_mot = lecteur.getNum_char_en_lecture();

        if (lecteur.getTete_de_lecture() == '\0') { // Cas de la fin de fichier
            mot_en_lecture.mot = "eof";
            mot_en_lecture.code_mot = dico.get_CODE_EOF();
            return;
        }

        
        if (is_Char.is_letter(lecteur.getTete_de_lecture())) { // Cas d'un mot clef, d'un IDF ou d'un caractère

            mot_en_lecture.mot = "" + lecteur.getTete_de_lecture();

            lire_char();

            while (is_Char.is_alpha(lecteur.getTete_de_lecture())) {
                mot_en_lecture.mot += lecteur.getTete_de_lecture();
                lire_char();
            }
            return;
        }

        if (is_Char.is_digit(lecteur.getTete_de_lecture())) { // Cas d'une constante entière

            mot_en_lecture.mot = "" + lecteur.getTete_de_lecture();

            lire_char();

            while (is_Char.is_digit(lecteur.getTete_de_lecture())) {
                mot_en_lecture.mot += lecteur.getTete_de_lecture();
                lire_char();
            }
            return;
        }

        if (is_Char.is_symbol(lecteur.getTete_de_lecture())) { // Cas d'un symbole

            mot_en_lecture.mot = "" + lecteur.getTete_de_lecture();

            lire_char();

            if (is_Char.is_symbol_2(lecteur.getTete_de_lecture())) { // Cas d'un symbole à deux caractères
                mot_en_lecture.mot += lecteur.getTete_de_lecture();
                lire_char();
            }

            if (mot_en_lecture.mot.contentEquals("--")) { // Cas commentaire
                while (lecteur.getTete_de_lecture() != '\n' && lecteur.getTete_de_lecture() != '\0') {
                    lire_char();
                }

                anti_new_mot(); // On ne veut pas que le mot "--" soit ajouté au dictionnaire et gardé en mémoire le dernier mot lu
                lit_mot();
                return;
            }
            return;
        }

        // Cas erreur
        Logger.error("Caractère non reconnu à la ligne " + lecteur.getNum_ligne_en_lecture() + " et au caractère " + lecteur.getNum_char_en_lecture() + " : " + lecteur.getTete_de_lecture());
        en_erreur = true;
        lire_char();
    }



    public void analyse_l() throws Exception { // Vérifie les mots lus et les transforme en int
        Logger.milestone("Début de l'analyse lexicale");
        while (!(mot_preprecedent.code_mot == dico.get_CODE_EOF())) {

            if (mot_preprecedent.code_mot != -1) {
                analyse_triplet();

                if (mot_preprecedent.code_mot != -1) {
                    sauter_ligne(mot_preprecedent.num_ligne_mot);

                    // Cas des idf ou entiers
                    if (mot_preprecedent.code_mot == dico.get_CODE_IDF()) {
                        mot_preprecedent.code_idf = dico.put_idf(mot_preprecedent.mot);
                    }
                    if (mot_preprecedent.code_mot == dico.get_CODE_ENTIER()) {
                        mot_preprecedent.code_idf = Integer.parseInt(mot_preprecedent.mot);
                    }

                    ecrire_lex(mot_preprecedent);
                }
            }

            lit_mot();
            if (dico.get_CODE_EOF() == mot_en_lecture.code_mot) {
                continue;
            }
            mot_en_lecture.code_mot = dico.get_code(mot_en_lecture.mot);
            

            if (mot_en_lecture.code_mot == -1) {
                en_erreur = true;
                Logger.error("Erreur : mot non reconnu à la ligne " + mot_en_lecture.num_ligne_mot + " et au caractère " + mot_en_lecture.num_char_mot + " : " + mot_en_lecture.mot);
                anti_new_mot();
                continue;
            }

        }

        ecrire_lex(mot_preprecedent); // On écrit EOF
        ecrire_tab_idf(); // On écrit le dictionnaire des IDF

        ecrivain_code.fermer();

        Logger.milestone("Fin de l'analyse lexicale");
    }


    // Liste des cas spéciaux à traiter :
    // - "or else" et "and then"
    // - 'a'
    private void analyse_triplet() throws Exception {
        if (mot_preprecedent.mot.contentEquals("or") && mot_precedent.mot.contentEquals("else")) {
            mot_precedent.mot = "or else";
            mot_precedent.code_mot = dico.get_code(mot_precedent.mot);
            mot_preprecedent = new Mot_L();
            return;
        }

        if (mot_preprecedent.mot.contentEquals("and") && mot_precedent.mot.contentEquals("then")) {
            mot_precedent.mot = "and then";
            mot_precedent.code_mot = dico.get_code(mot_precedent.mot);
            mot_preprecedent = new Mot_L();
            return;
        }

        if (mot_preprecedent.mot.contentEquals("'") && mot_en_lecture.mot.contentEquals("'") && is_Char.is_char(mot_precedent.mot)) {
            mot_en_lecture.mot = "'" + mot_precedent.mot + "'";
            mot_en_lecture.code_mot = dico.get_CODE_CARACTERE();
            mot_en_lecture.code_idf = (int) mot_precedent.mot.charAt(0);

            mot_preprecedent = new Mot_L();
            mot_precedent = new Mot_L();
            return;
        }
    }


    private void ecrire_tab_idf() throws Exception {
        Ecrivain_L ecrivain_idf = new Ecrivain_L(chemin_fichier + ".idf");

        for (int i = 1; i < dico.get_dico_idf_size() + 1; i++) {
            ecrivain_idf.ecrire_tab_idf(i, dico.get_idf(i));
        }

        ecrivain_idf.fermer();            
    }

    private void ecrire_lex(Mot_L mot_lexical) throws Exception {
        ecrivain_code.ecrire_code(mot_lexical.code_mot);
        if (DEBUG) {
            Logger.info("Mot écrit : " + mot_preprecedent.mot + " - code : " + mot_preprecedent.code_mot);
        }
        if (mot_lexical.code_idf != -1) {
            ecrivain_code.ecrire_code(mot_lexical.code_idf);
        }
    }

    private void sauter_ligne(int num_ligne) throws Exception {
        while (num_ligne_en_lecture < num_ligne) {
            ecrivain_code.sauter_ligne();
            num_ligne_en_lecture++;
        }
    }

    public boolean get_en_erreur() {
        return this.en_erreur;
    }

}
