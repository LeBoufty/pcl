package arbres;

public class Not extends Evaluable {
    public Evaluable valeur;
    public Not(Evaluable valeur) {
        this.valeur = valeur;
    }
    public String toString() {
        return "not " + this.valeur.toString();
    }
    public boolean valide() {
        return this.valeur.valide();
    }
}
