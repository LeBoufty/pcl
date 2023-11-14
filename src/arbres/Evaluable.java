package arbres;

public abstract class Evaluable implements Noeud {
    public int valeur;
    public Type type;
    public Evaluable(int val) {
        this.valeur = val;
    }
    public Evaluable() {
    }
}
