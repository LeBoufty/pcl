package arbres;

public class Soustraction extends Expression {
    public Soustraction(Evaluable g, Evaluable d) {
        super(g, d);
    }
    public String toString() {
        return this.gauche.toString() + "-" + this.droite.toString();
    }
}
