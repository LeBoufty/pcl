package arbres;

public class Addition extends Expression {
    public Addition(Evaluable g, Evaluable d) {
        super(g, d);
        this.operateur = "+";
    }
}
