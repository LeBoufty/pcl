package arbres;

public class Division extends Expression {
    public Division(Evaluable g, Evaluable d) {
        super(g, d);
        this.operateur = "/";
    }
}
