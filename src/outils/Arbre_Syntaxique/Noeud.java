package outils.Arbre_Syntaxique;

public abstract class Noeud {

    private Noeud parent;

    public Noeud() {
        this.parent = null;
    }

    public void setParent(Noeud parent) {
        this.parent = parent;
    }

    public Noeud getParent() {
        return this.parent;
    }
}
