package outils.Arbre_Syntaxique;

public abstract class Noeud_A {

    private Noeud_A parent;
    public int UML_id = -1;

    public Noeud_A() {
        this.parent = null;
    }

    public void setParent(Noeud_A parent) {
        this.parent = parent;
    }

    public Noeud_A getParent() {
        return this.parent;
    }
}
