package outils.Lexeur;

import java.util.HashMap;

public class Dico_L {

    private HashMap<String, Integer> dico_terminaux;
    private HashMap<String, Integer> dico_idf;
    private HashMap<Integer, String> dico_idf_inverse;
    private int CODE_IDF;
    private int CODE_CARACTERE;
    private int CODE_ENTIER;
    private int CODE_EOF;
    public static final int OFFSET_LEXEUR = 200;
    public static final int NEW_LINE = '&';
    public static final int IDF = 2;
    public static final int CAR = 48;
    public static final int ENTIER = 52;
    public static final int DOLLAR = 57;


    public Dico_L() {
        this.dico_terminaux = new HashMap<String, Integer>();
        this.dico_idf = new HashMap<String, Integer>();
        this.dico_idf_inverse = new HashMap<Integer, String>();
        this.set_dico_default();
    }

    public Dico_L(HashMap<String, Integer> dico) {
        // Appel du constructeur par défaut
        this();
        this.dico_terminaux = dico;
    }

    public void set_dico_default() {
        // with,IDF,.,;,use,procedure,is,begin,end,EOF,type,function,return,:,:=,access,record,virgule,(,),in,out,for,..,loop,if,then,while,reverse,else,elsif,or,or⬚else,and,and⬚then,not,=,/=,<,<=,>,>=,+,-,*,/,rem,caractere,charactere,',val,entier,false,new,null,true,$
        this.dico_terminaux.put("with", 1);
        CODE_IDF = IDF;
        this.dico_terminaux.put(".", 3);
        this.dico_terminaux.put(";", 4);
        this.dico_terminaux.put("use", 5);
        this.dico_terminaux.put("procedure", 6);
        this.dico_terminaux.put("is", 7);
        this.dico_terminaux.put("begin", 8);
        this.dico_terminaux.put("end", 9);
        //this.dico_terminaux.put("eof", 10);
        CODE_EOF = 10;
        this.dico_terminaux.put("type", 11);
        this.dico_terminaux.put("function", 12);
        this.dico_terminaux.put("return", 13);
        this.dico_terminaux.put(":", 14);
        this.dico_terminaux.put(":=", 15);
        this.dico_terminaux.put("access", 16);
        this.dico_terminaux.put("record", 17);
        this.dico_terminaux.put(",", 18);
        this.dico_terminaux.put("(", 19);
        this.dico_terminaux.put(")", 20);
        this.dico_terminaux.put("in", 21);
        this.dico_terminaux.put("out", 22);
        this.dico_terminaux.put("for", 23);
        this.dico_terminaux.put("..", 24);
        this.dico_terminaux.put("loop", 25);
        this.dico_terminaux.put("if", 26);
        this.dico_terminaux.put("then", 27);
        this.dico_terminaux.put("while", 28);
        this.dico_terminaux.put("reverse", 29);
        this.dico_terminaux.put("else", 30);
        this.dico_terminaux.put("elsif", 31);
        this.dico_terminaux.put("or", 32);
        this.dico_terminaux.put("or else", 33);
        this.dico_terminaux.put("and", 34);
        this.dico_terminaux.put("and then", 35);
        this.dico_terminaux.put("not", 36);
        this.dico_terminaux.put("=", 37);
        this.dico_terminaux.put("/=", 38);
        this.dico_terminaux.put("<", 39);
        this.dico_terminaux.put("<=", 40);
        this.dico_terminaux.put(">", 41);
        this.dico_terminaux.put(">=", 42);
        this.dico_terminaux.put("+", 43);
        this.dico_terminaux.put("-", 44);
        this.dico_terminaux.put("*", 45);
        this.dico_terminaux.put("/", 46);
        this.dico_terminaux.put("rem", 47);
        CODE_CARACTERE = CAR;
        this.dico_terminaux.put("character", 49);
        this.dico_terminaux.put("'", 50);
        this.dico_terminaux.put("val", 51);
        CODE_ENTIER = ENTIER;
        this.dico_terminaux.put("false", 53);
        this.dico_terminaux.put("new", 54);
        this.dico_terminaux.put("null", 55);
        this.dico_terminaux.put("true", 56);

    }

    public void set_dico_default_CSV(){
        this.dico_terminaux.put("IDF", CODE_IDF);
        this.dico_terminaux.put("EOF", CODE_EOF);
        this.dico_terminaux.put("caractere", CODE_CARACTERE);
        this.dico_terminaux.put("entier", CODE_ENTIER);
        this.dico_terminaux.put("$", DOLLAR);
    }

    // Ajoute un mot au dico idf et retourne son code
    public int put_idf(String mot) {
        String mot_lower = mot.toLowerCase();

        if (this.dico_idf.containsKey(mot_lower)) {
            return this.dico_idf.get(mot_lower);
        }

        int taille_dico = this.dico_idf.size();
        this.dico_idf.put(mot_lower, taille_dico + 1);
        this.dico_idf_inverse.put(taille_dico + 1, mot_lower);

        return taille_dico + 1;
    }

    public String get_idf(int code) {
        return this.dico_idf_inverse.get(code);
    }

    public int get_dico_idf_size() {
        return this.dico_idf.size();
    }

    public int get_code(String mot) {
        String mot_lower = mot.toLowerCase();

        if (this.dico_terminaux.containsKey(mot_lower)) {
            return this.dico_terminaux.get(mot_lower);
        }

        // Cas spéciaux
        if (is_Char.is_idf(mot_lower)) {
            return CODE_IDF;
        }

        if (is_Char.is_constante_int(mot_lower)) {
            return CODE_ENTIER;
        }

        return -1;
    }

    // Getters
    public int get_CODE_IDF() {
        return this.CODE_IDF;
    }

    public int get_CODE_CARACTERE() {
        return this.CODE_CARACTERE;
    }

    public int get_CODE_ENTIER() {
        return this.CODE_ENTIER;
    }

    public int get_CODE_EOF() {
        return this.CODE_EOF;
    }

    public HashMap<String, Integer> get_dico_terminaux() {
        return this.dico_terminaux;
    }

}
