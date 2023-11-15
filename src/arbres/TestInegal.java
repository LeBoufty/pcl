package arbres;

public class TestInegal extends Expression {
    public TestInegal(Evaluable g, Evaluable d) {
        super(g, d);
        this.operateur = "/=";
    }
}
