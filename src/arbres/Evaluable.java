package arbres;

public abstract class Evaluable implements Noeud {
    protected Type type;
    public Evaluable() {
    }
    public Type getType() {
        return this.type;
    }
}
