package arbres;

public class Return implements Noeud {
    public Evaluable valeur;
    public Return(Evaluable valeur) {
        this.valeur = valeur;
    }
    public String toString() {
        return "return " + this.valeur.toString() + ";";
    }
    public boolean valide() {
        return this.valeur.valide();
    }
}
