package arbres;

public abstract class Expression extends Evaluable {
    public Evaluable gauche;
    public Evaluable droite;
    public Expression(Evaluable g, Evaluable d) {
        this.gauche = g; this.droite = d;
    }
}
