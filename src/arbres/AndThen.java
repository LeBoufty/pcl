package arbres;

public class AndThen extends Expression {
    public AndThen(Evaluable g, Evaluable d) {
        super(g, d);
        this.operateur = "and then";
    }
}
