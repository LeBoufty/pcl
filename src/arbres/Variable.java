package arbres;

public class Variable extends Evaluable {
    public int identifiant;
    public static int nbvariables = 0;
    public String nom;
    public Variable(IType t) {
        this.identifiant = nbvariables;
        this.type = t;
        this.nom = "var"+String.valueOf(identifiant);
        nbvariables++;
    }
    public Variable(IType t, String nom) {
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

    public void produire() {
        System.out.println(nom + " var : " + type);
        System.out.println(nom + " var :" + identifiant); 
// TODO : chercher la variable, c'est dans le cours.
    }
}
