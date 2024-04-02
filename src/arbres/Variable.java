package arbres;

import java.util.HashMap;
import java.util.ArrayList;

import outils.TDS.TDS_gen;
import outils.Logger;

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

        // *Je crois qu'il y a rien à produire pour une variable

        return "";
    }

    public void TDS_creation(TDS_gen Parent, int type_variable) {
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
            Logger.error("Type de variable inconnu");
        }

        if (type_variable == 1) {
            Parent.add_parametre(this.identifiant, taille);
        } else if (type_variable == 2) {
            Parent.add_variable(this.identifiant, taille);
        } else {
            Logger.warn("Type de variable ou paramètres inconnu");
        }
        
    }

    public void TDS_link(TDS_gen Parent) {
        this.tds_parent = Parent;
    }

    public TDS_gen getTDS() {
        return this.tds_parent;
    }

    public void TDS_variable(HashMap<String, ArrayList<Integer>> variables) {
        
    }
}
