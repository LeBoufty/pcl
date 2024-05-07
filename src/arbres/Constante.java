package arbres;


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
        // On met la valeur en pile
        String res = "";
        if (valeur < 0) {
            res += "MOVZ x0, #0 // On met le deplacement en pile \n";
            res += "SUB x0, x0, #" + -valeur + " // On met le deplacement en pile \n";
        } 
        else {res += "MOVZ x0, #" + valeur + "\n";}
        //res += generateAssemblyCode();
        res += "SUB sp, sp, #16 // On décrémente le pointeur de pile \n";
        res += "STR x0, [sp] // On met la constante en pile \n";
        return res;
    }

    public String produire(TDS_gen tds_actuelle) {
        return this.produire();
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

    public void TDS_variable() {
        // Rien à faire
    }

    public void TDS_func_proc_change() {
        // Rien à faire
    }

    public String generateAssemblyCode() {
        // !ça marche pas 
        String commande = "";
        int mask = 0xFFFF;

        commande += "MOVZ X0, #0\n";

        if (this.valeur < 0) {
            long compl2 = (long) this.valeur & 0xFFFFFFFFL; 
            commande += String.format("MOVK X0, #0x%04X, LSL #16\n", (compl2 >>> 16) & mask);
            commande += String.format("MOVK X0, #0x%04X, LSL #0\n", compl2 & mask);
        } else {
            commande += String.format("MOVK X0, #0x%04X, LSL #16\n", (this.valeur >>> 16) & mask);
            commande += String.format("MOVK X0, #0x%04X, LSL #0\n", this.valeur & mask);
        }

        return commande;
    }
}
