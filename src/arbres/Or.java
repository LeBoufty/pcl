package arbres;

public class Or extends Expression {
    public Or(Evaluable g, Evaluable d) {
        super(g, d);
        this.operateur = "or";
    }
}
