package arbres;

public class TestEgal extends Expression {
    public TestEgal(Evaluable g, Evaluable d) {
        super(g, d);
        this.operateur = "=";
    }
}
