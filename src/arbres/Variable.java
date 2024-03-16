package arbres;

import outils.TDS.TDS_gen;

public class Variable extends Evaluable {
    public int identifiant;
    public static int nbvariables = 0;
    public String nom;
    public TDS_gen tds_parent = null;

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
        //INTEGER, CHARACTER, BOOLEAN, NULLTYPE;
        int taille=0;
        if(this.type==Type.INTEGER)
        {
            taille=Integer.SIZE/8;
        }
        else if(this.type==Type.CHARACTER)
        {
            taille=Character.SIZE/8;
        }
        else if(this.type==Type.BOOLEAN)
        {
            taille=Byte.SIZE/8;
        }
        else if(this.type==Type.NULLTYPE)
        {
            taille=0;
        }
        else
        {
            System.out.println("Type de variable inconnu");
        }
        Parent.add_variable(identifiant, 0, taille);
        
    }
}
