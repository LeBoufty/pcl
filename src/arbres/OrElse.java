package arbres;

public class OrElse extends Expression {
    public OrElse(Evaluable g, Evaluable d) {
        super(g, d);
        this.operateur = "or else";
    }
}
