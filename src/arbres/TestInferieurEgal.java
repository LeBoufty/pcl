package arbres;

public class TestInferieurEgal extends Expression {
    public TestInferieurEgal(Evaluable g, Evaluable d) {
        super(g, d);
    }
    public String toString() {
        return this.gauche.toString() + "<=" + this.droite.toString();
    }
}
