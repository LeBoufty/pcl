package arbres;

public class TestSuperieurEgal extends Expression {
    public TestSuperieurEgal(Evaluable g, Evaluable d) {
        super(g, d);
        this.operateur = ">=";
    }
}
