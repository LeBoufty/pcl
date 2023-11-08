package arbres;

public class TestEgal extends Expression {
    public TestEgal(Evaluable g, Evaluable d) {
        super(g, d);
    }
    public String toString() {
        return this.gauche.toString() + "=" + this.droite.toString();
    }
}
