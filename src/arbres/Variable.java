package arbres;

public class Variable extends Evaluable {
    public int valeur;
    public int identifiant;
    public Type type;
    public static int nbvariables = 0;
    public Variable(Type t) {
        this.identifiant = nbvariables;
        this.type = t;
        nbvariables++;
    }
    public String toString() {
        return "&"+String.valueOf(identifiant);
    }
}
