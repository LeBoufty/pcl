package arbres;


import outils.TDS.TDS_gen;
import outils.Logger;

public abstract class Instanciation implements Noeud {
    public IType type;
    public Variable variable;
    public String nom;
    public TDS_gen tds_parent = null;

    public Instanciation(IType t) {type = t != null ? t : Type.NULLTYPE; variable = new Variable(type);}
    public Instanciation(IType t, String nom) {type = t != null ? t : Type.NULLTYPE; variable = new Variable(type, nom); this.nom = nom;}
    public Instanciation() {type = Type.NULLTYPE; variable = new Variable(Type.NULLTYPE);}
    public String toString() {
        return variable.toString() + " : " + type.toString() + ";";
    }
    public boolean valide() {
        return true;
    }

    public String produire(TDS_gen tds_actuelle) {
        Logger.debug(nom + " Instanciation type : " + type);
        return "";
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

    public void TDS_variable() {
        // Rien à faire
    }

    public void TDS_func_proc_creation() {
        // Rien à faire
    }

    public void TDS_func_proc_change() {
        // Rien à faire
    }
}
