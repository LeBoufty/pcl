package arbres;

public class TestInegal extends Expression {
    public TestInegal(Evaluable g, Evaluable d) {
        super(g, d);
    }
    public String toString() {
        return this.gauche.toString() + "/=" + this.droite.toString();
    }
}
