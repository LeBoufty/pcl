package arbres;

public class Or extends Expression {
    public Or(Evaluable g, Evaluable d) {
        super(g, d);
    }
    public String toString() {
        return this.gauche.toString() + " or " + this.droite.toString();
    }
}
