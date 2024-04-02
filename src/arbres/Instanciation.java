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
    
    String res = "";

    if (variable.isConstant()) {
        // On affecte la valeur de la variable en pile
        res += "MOV x0, " + variable.produire() + " // On met la constante dans x0 \n";
        res += "SUB sp, sp, #16 // On alloue de la place pour la variable \n";
        res += "STR x0, [x29, #" + variable.getTDS().search_deplacement_TDS(variable.identifiant) + "] // On stocke la valeur de la variable locale \n";
    } else {
        variable.produire();

        res += "SUB sp, sp, #16 // On alloue de la place pour la variable \n";
        res += "STR x0, [x29, #" + variable.getTDS().search_deplacement_TDS(variable.identifiant) + "] // On stocke la valeur de la variable locale \n";
    }

    return res;
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
