package arbres;

public class TestInferieurEgal extends Expression {
    public TestInferieurEgal(Evaluable g, Evaluable d) {
        super(g, d);
        this.operateur = "<=";
    }
}
