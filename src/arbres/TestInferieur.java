package arbres;

public class TestInferieur extends Expression {
    public TestInferieur(Evaluable g, Evaluable d) {
        super(g, d);
        this.operateur = "<";
    }
}
