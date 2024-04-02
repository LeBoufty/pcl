package arbres;

import java.util.HashMap;

import outils.TDS.TDS_gen;

public abstract class Instanciation implements Noeud {
    public IType type;
    public Variable variable;
    public String nom;
    public TDS_gen tds_parent = null;

    public Instanciation(IType t) {type = t; variable = new Variable(t);}
    public Instanciation(IType t, String nom) {type = t; variable = new Variable(t, nom); this.nom = nom;}
    public Instanciation() {type = Type.NULLTYPE; variable = new Variable(Type.NULLTYPE);}
    public String toString() {
        return variable.toString() + " : " + type.toString() + ";";
    }
    public boolean valide() {
        return true;
    }
    public String produire() {
    System.out.println(nom + " declaration : " + type);
    System.out.println(nom + " declaration : " + variable);
    
    return "";
// TODO : Mettre dans la tds ou la pile
    }

    public void TDS_creation(TDS_gen Parent, int variable_type) {
        variable.TDS_creation(Parent, variable_type);
    }

    public void TDS_link(TDS_gen Parent) {
        this.tds_parent = Parent;
        variable.TDS_link(Parent);
    }

    public TDS_gen getTDS() {
        return this.tds_parent;
    }

    public void TDS_variable(HashMap<Integer, String> variables) {
        variable.TDS_variable(variables);
    }
}
