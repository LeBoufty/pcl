package outils.Arbre_Syntaxique;

public class Noeud_Terminal extends Noeud {
    
    private int code_terminal;
    private int code_idf;

    public Noeud_Terminal(int code_terminal) {
        super();
        this.code_terminal = code_terminal;
        this.code_idf = -1;
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

}
