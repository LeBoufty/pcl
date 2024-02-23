package arbres;

public class Return implements Noeud {
    public Evaluable valeur;
    public Return(Evaluable valeur) {
        this.valeur = valeur;
    }
    public Return() {
        this.valeur = null;
    }
    public boolean estVide() {
        return this.valeur == null;
    }
    public String toString() {
        if (!estVide()) {
            return "return " + this.valeur.toString() + ";";
        } else {
            return "return;";
        }
    }
    public boolean valide() {
        return this.estVide() || this.valeur.valide();
    }

    public void produire() {
         System.out.println("Return");
// TODO : on définit ce qu'on met dans le registre de sortie (ou dans la pile)
    }
}
