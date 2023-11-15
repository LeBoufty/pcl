package arbres;

public class Soustraction extends Expression {
    public Soustraction(Evaluable g, Evaluable d) {
        super(g, d);
        this.operateur = "-";
    }
}
