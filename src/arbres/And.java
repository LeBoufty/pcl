package arbres;

public class And extends Expression {
    public And(Evaluable g, Evaluable d) {
        super(g, d);
    }
    public String toString() {
        return this.gauche.toString() + " and " + this.droite.toString();
    }
}
