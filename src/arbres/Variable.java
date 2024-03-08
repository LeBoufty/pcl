package arbres;

import outils.TDS.TDS_gen;

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

    public String produire() {
        System.out.println(nom + " var type : " + type);
        System.out.println(nom + " var id : " + identifiant); 

        return "";
// TODO : chercher la variable, c'est dans le cours.
    }

    public void TDS_creation(TDS_gen Parent) {
        // On ajoute la variable à la TDS du parent
        Parent.add_variable(identifiant, 0, 0);
        
    }
}
