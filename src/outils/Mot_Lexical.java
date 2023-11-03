package outils;

import java.util.HashMap;

public class Mot_Lexical {
    public String mot;
    public int code_mot;
    public int code_idf;
    public int num_ligne_mot;
    public int num_char_mot;

    public Mot_Lexical() {
        this.mot = "";
        this.code_mot = -1;
        this.code_idf = -1;
        this.num_ligne_mot = 0;
        this.num_char_mot = 0;
    }

    public boolean is_mot_have_code() {
        return this.code_mot != -1;
    }

    public boolean is_it_idf() {
        // Test si le mot est un identificateur [a-z][a-z0-9]*
        if (this.mot.length() == 0) {
            return false;
        }

        if (!Character.isLetter(this.mot.charAt(0))) {
            return false;
        }

        for (int i = 1; i < this.mot.length(); i++) {
            if (!Character.isLetterOrDigit(this.mot.charAt(i)) && this.mot.charAt(i) != '_') {
                return false;
            }
        }

        return true;
    }

    public boolean is_it_constante_char() {
        // un caractère avec 'a' a étant un des 95 caractères ASCII imprimables
        if (this.mot.length() != 3) {
            return false;
        }

        if (this.mot.charAt(0) != '\'') {
            return false;
        }

        if (this.mot.charAt(2) != '\'') {
            return false;
        }

        if (this.mot.charAt(1) < 32 || this.mot.charAt(1) > 126) {
            return false;
        }

        return true;

    }

    public boolean is_it_constante_int() {
        // un entier avec [0-9]+
        if (this.mot.length() == 0) {
            return false;
        }

        for (int i = 0; i < this.mot.length(); i++) {
            if (!Character.isDigit(this.mot.charAt(i))) {
                return false;
            }
        }

        return true;
    }

}
