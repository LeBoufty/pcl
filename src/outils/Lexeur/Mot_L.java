package outils.Lexeur;

public class Mot_L {
    
    public String mot;
    public int code_mot;
    public int code_idf;
    public int num_ligne_mot;
    public int num_char_mot;

    public Mot_L() {
        this.mot = "";
        this.code_mot = -1;
        this.code_idf = -1;
        this.num_ligne_mot = 0;
        this.num_char_mot = 0;
    }

    public boolean is_mot_have_code() {
        return this.code_mot != -1;
    }

}
