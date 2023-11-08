package arbres;

public class Multiplication extends Expression{
    public Multiplication(Evaluable g, Evaluable d) {
        super(g, d);
    }
    public String toString() {
        return this.gauche.toString() + "*" + this.droite.toString();
    }
}
