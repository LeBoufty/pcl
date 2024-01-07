package outils.Arbre_Syntaxique;

public class Noeud_Terminal extends Noeud_A {
    
    private int code_terminal;
    private int code_idf;
    private String valeur_idf;

    public Noeud_Terminal(int code_terminal) {
        super();
        this.code_terminal = code_terminal;
        this.code_idf = -1;
        this.valeur_idf = "";
    }

    public int getCode() {
        return this.code_terminal;
    }

    public int getCodeIdf() {
        return this.code_idf;
    }

    public void setCodeIdf(int code_idf) {
        this.code_idf = code_idf;
    }

    public String getValeurIdf() {
        return this.valeur_idf;
    }

    public void setValeurIdf(String valeur_idf) {
        this.valeur_idf = valeur_idf;
    }

}
