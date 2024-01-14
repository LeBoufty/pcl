package outils.Arbre_Syntaxique;

public abstract class Noeud_A {

    private Noeud_Non_Terminal parent;
    public int UML_id = -1;

    public Noeud_A() {
        this.parent = null;
    }

    public void setParent(Noeud_Non_Terminal parent) {
        this.parent = parent;
    }

    public Noeud_Non_Terminal getParent() {
        return this.parent;
    }

    public abstract boolean sansEnfant();
    public abstract void seSacrifier();
    public abstract void supprimer();
}
