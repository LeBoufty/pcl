package arbres;

public class TestSuperieur extends Expression {
    public TestSuperieur(Evaluable g, Evaluable d) {
        super(g, d);
        this.operateur = ">";
    }
}
