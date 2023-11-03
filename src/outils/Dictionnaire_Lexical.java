package outils;

import java.util.HashMap;
import outils.Logger;

public class Dictionnaire_Lexical {
    private HashMap<String, Integer> dico;
    public HashMap<String, Integer> dico_idf;
    public boolean en_erreur;

    public Dictionnaire_Lexical() {
        this.dico = new HashMap<String, Integer>();
        this.dico_idf = new HashMap<String, Integer>();
        this.set_dico_default();
        this.en_erreur = false;
    }

    public Dictionnaire_Lexical(HashMap<String, Integer> dico) {
        this.dico = dico;
        this.en_erreur = false;
    }

    public void set_dico_default(){
        this.dico.put(".", 0);
        this.dico.put("-", 1);
        this.dico.put("*", 2);
        this.dico.put("/", 3);
        this.dico.put("rem", 4);
        this.dico.put("+", 5);
        this.dico.put("-", 6);
        this.dico.put(">", 7);
        this.dico.put(">=", 8);
        this.dico.put("<", 9);
        this.dico.put("<=", 10);
        this.dico.put("=", 11);
        this.dico.put("/=", 12);
        this.dico.put("not", 13);
        this.dico.put("and", 14);
        this.dico.put("and then", 15);
        this.dico.put("or", 16);
        this.dico.put("or else", 17);
        this.dico.put("procedure", 18);
        this.dico.put("function", 19);
        this.dico.put("is", 20);
        this.dico.put("begin", 21);
        this.dico.put("end", 22);
        this.dico.put("return", 23);
        this.dico.put("if", 24);
        this.dico.put("then", 25);
        this.dico.put("else", 26);
        this.dico.put("elsif", 27);
        this.dico.put("while", 28);
        this.dico.put("for", 29);
        this.dico.put("in", 30);
        this.dico.put("loop", 31);
        this.dico.put("true", 32);
        this.dico.put("false", 33);
        this.dico.put("null", 34);
        this.dico.put("type", 35);
        this.dico.put("new", 36);
        this.dico.put("with", 37);
        this.dico.put("use", 38);
        this.dico.put("access", 39);
        this.dico.put("out", 40);
        this.dico.put("record", 41);
        this.dico.put("reverse", 42);
        //this.dico.put("", 43); IDF
        //this.dico.put("", 44); Constante entier
        this.dico.put("(", 45);
        this.dico.put(")", 46);
        this.dico.put(":=", 47);
        this.dico.put(";", 48);
        this.dico.put(",", 49);
        this.dico.put(":", 50);
        this.dico.put("..", 51);
        this.dico.put("character'val", 52);
        this.dico.put("EOF", 53);
        //this.dico.put("", 54); Constante caractère 'a'

    }

    public void search_code (Mot_Lexical mot) {
        if (this.dico.containsKey(mot.mot)) {
            mot.code_mot = this.dico.get(mot.mot);
            return;
        }

        if (mot.is_it_idf()) {
            mot.code_mot = 43;
            if (this.dico_idf.containsKey(mot.mot)) {
                mot.code_idf = this.dico_idf.get(mot.mot);
                return;
            }
            this.dico_idf.put(mot.mot, this.dico_idf.size());
            mot.code_idf = this.dico_idf.get(mot.mot);
            return;
        }

        if (mot.is_it_constante_char()) {
            mot.code_mot = 54;
            return;
        }

        if (mot.is_it_constante_int()) {
            mot.code_mot = 44;
            return;
        }

        mot.code_mot = -1;
        Logger.error("Erreur Lexicale : L'unité lexicale " + mot.mot + " à la ligne " + mot.num_ligne_mot + " et au caractère " + mot.num_char_mot + " n'est pas reconnu");
        this.en_erreur = true;

    }

}
