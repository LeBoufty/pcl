package arbres;

public class Variable extends Evaluable {
    public int identifiant;
    public static int nbvariables = 0;
    public String nom;
    public Variable(Type t) {
        this.identifiant = nbvariables;
        this.type = t;
        this.nom = "var"+String.valueOf(identifiant);
        nbvariables++;
    }
    public Variable(Type t, String nom) {
        this.identifiant = nbvariables;
        this.type = t;
        this.nom = nom;
        nbvariables++;
    }
    public String toString() {
        return "&"+String.valueOf(identifiant);
    }
    public boolean valide() {
        return true;
    }
}
