package arbres;

public class TestInferieur extends Expression {
    public TestInferieur(Evaluable g, Evaluable d) {
        super(g, d);
    }
    public String toString() {
        return this.gauche.toString() + "<" + this.droite.toString();
    }
}
