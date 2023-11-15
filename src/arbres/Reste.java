package arbres;

public class Reste extends Expression {
    public Reste(Evaluable g, Evaluable d) {
        super(g, d);
        this.operateur = "rem";
    }
}
