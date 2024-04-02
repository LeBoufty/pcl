package arbres;

import java.util.HashMap;
import java.util.ArrayList;

import outils.Logger;
import outils.TDS.TDS_gen;

public class OperationUnaire extends Evaluable {
    public Evaluable droite;
    private OperateurUnaire operateur;
    public TDS_gen tds_parent = null;

    public OperationUnaire(Evaluable d, OperateurUnaire o) {
        this.droite = d; this.operateur = o;
        // On prend le type de sortie de l'opérateur.
        this.type = operateur.getType();
    }
    public OperationUnaire() {
        this.droite = null; this.operateur = OperateurUnaire.NONE;
        this.type = Type.NULLTYPE;
    }
    public OperateurUnaire getOperateur() {
        return this.operateur;
    }
    public void setOperateur(OperateurUnaire o) {
        this.operateur = o;
        this.type = o.getType();
    }
    public boolean valide() {
        boolean sortie = true;
        if (this.droite == null) {
            Logger.error("Opération "+ this.hashCode() +" invalide : membre null");
            sortie = false;
        } else {
            sortie = this.droite.valide();
        }
        if(this.droite.type!=this.type) {
            Logger.error("Opération "+ this.hashCode() +" invalide : type de retour de l'opérateur "+ this.operateur.toString() +" incompatible avec le type de la droite");
            sortie = false;
        }
        return sortie;
    }
    public String toString() {
        return this.operateur.toString() +" "+ this.droite.toString();
    }

    public String produire() {
        System.out.println("OperationUnaire");

        String res = "";

        if (this.droite.isConstant()) {
            return "MOV x0, #"+this.operateur.getvalue((Constante) this.droite);
        }
        else {
            this.droite.produire();
            res += "MOV x0, x0\n";
        }

        return res;
// TODO : je sais pas trop...
    }

    public void TDS_creation(TDS_gen Parent, int type_variable) {
        // Ne fait rien
    }

    public void TDS_link(TDS_gen Parent) {
        this.tds_parent = Parent;
        this.droite.TDS_link(Parent);
    }

    public TDS_gen getTDS(){
        return this.tds_parent;
    }

    public void TDS_variable(HashMap<String, ArrayList<Integer>> variables) {
        this.droite.TDS_variable(variables);
    }
    
}
