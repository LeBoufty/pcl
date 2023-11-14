package arbres;

public class AndThen extends Expression {
    public AndThen(Evaluable g, Evaluable d) {
        super(g, d);
    }
    public String toString() {
        return this.gauche.toString() + " and then " + this.droite.toString();
    }
}
