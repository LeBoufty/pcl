package arbres;

import java.util.HashMap;
import java.util.ArrayList;

import outils.Logger;
import outils.TDS.TDS_gen;

public class Constante extends Evaluable {
    public int valeur;
    public TDS_gen tds_parent = null;

    public Constante(int c) {
        this.valeur = c;
        this.type = Type.INTEGER;
    }
    public Constante(char c) {
        this.valeur = (int) c;
        this.type = Type.CHARACTER;
    }
    public Constante(boolean c) {
        this.valeur = c ? 1 : 0;
        this.type = Type.BOOLEAN;
    }
    public Constante() {
        this.valeur = 0;
        this.type = Type.NULLTYPE;
    }
    public String toString() {
        switch ((Type) type) {
            case INTEGER:
                return String.valueOf(valeur);
            case CHARACTER:
                return "'"+String.valueOf((char) valeur)+"'";
            case BOOLEAN:
                return String.valueOf(valeur == 1);
            case NULLTYPE:
                return "null";
        }
        Logger.error(this.hashCode()+".toString() : type inconnu");
        return "";
    }
    public boolean valide() {
        return true;
    }

    public boolean isConstant() {
        return true;
    }

    public String produire() {
        System.out.println("constante " + valeur + " : " + type);
        return "#"+valeur;
    }

    public void TDS_creation(TDS_gen Parent, int variable_type) {
        // Rien à faire
    }

    public void TDS_link(TDS_gen Parent) {
        this.tds_parent = Parent;
    }

    public TDS_gen getTDS() {
        return this.tds_parent;
    }

    public void TDS_variable(HashMap<String, ArrayList<Integer>> variables) {
        // Rien à faire
    }
}
