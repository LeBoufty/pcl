package arbres;

public class Contraire extends Evaluable {
    public Evaluable valeur;
    public Contraire(Evaluable valeur) {
        this.valeur = valeur;
    }
    public String toString() {
        return "-" + this.valeur.toString();
    }
    public boolean valide() {
        return this.valeur.valide();
    }
}
