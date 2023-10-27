package arbres;

public class Affectation implements Noeud {
    public Variable gauche;
    public Evaluable droite;
    public Affectation(Variable g, Evaluable d) {
        this.gauche = g; this.droite = d;
    }
    public String toString() {
        return this.gauche.toString() + ":=" + this.droite.toString() + ";";
    }
}
