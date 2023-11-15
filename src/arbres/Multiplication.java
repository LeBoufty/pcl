package arbres;

public class Multiplication extends Expression{
    public Multiplication(Evaluable g, Evaluable d) {
        super(g, d);
        this.operateur = "*";
    }
}
