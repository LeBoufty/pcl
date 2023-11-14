package arbres;

public class TestSuperieurEgal extends Expression {
    public TestSuperieurEgal(Evaluable g, Evaluable d) {
        super(g, d);
    }
    public String toString() {
        return this.gauche.toString() + ">=" + this.droite.toString();
    }
}
