package arbres;

public class And extends Expression {
    public And(Evaluable g, Evaluable d) {
        super(g, d);
        this.operateur = "and";
    }
}
