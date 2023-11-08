package arbres;

public class Addition extends Expression {
    public Addition(Evaluable g, Evaluable d) {
        super(g, d);
    }
    public String toString() {
        return this.gauche.toString() + "+" + this.droite.toString();
    }
}
