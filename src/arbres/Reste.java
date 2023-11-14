package arbres;

public class Reste extends Expression {
    public Reste(Evaluable g, Evaluable d) {
        super(g, d);
    }
    public String toString() {
        return this.gauche.toString() + " rem " + this.droite.toString();
    }
}
