package arbres;

public class Division extends Expression {
    public Division(Evaluable g, Evaluable d) {
        super(g, d);
    }
    public String toString() {
        return this.gauche.toString() + "/" + this.droite.toString();
    }
}
