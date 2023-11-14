package arbres;

public class OrElse extends Expression {
    public OrElse(Evaluable g, Evaluable d) {
        super(g, d);
    }
    public String toString() {
        return this.gauche.toString() + " or else " + this.droite.toString();
    }
}
