package arbres;

public class Variable extends Evaluable {
    public int valeur;
    public int identifiant;
    public static int nbvariables = 0;
    public Variable(int x) {
        super(x);
        this.identifiant = nbvariables;
        nbvariables++;
    }
    public Variable() {
        this.identifiant = nbvariables;
        nbvariables++;
    }
    public String toString() {
        return "&"+String.valueOf(identifiant);
    }
}
