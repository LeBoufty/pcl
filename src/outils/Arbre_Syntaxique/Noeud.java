package outils.Arbre_Syntaxique;

public abstract class Noeud {

    private Noeud parent;
    public int UML_id = -1;

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
