package arbres;

public class TestSuperieur extends Expression {
    public TestSuperieur(Evaluable g, Evaluable d) {
        super(g, d);
    }
    public String toString() {
        return this.gauche.toString() + ">" + this.droite.toString();
    }
}
