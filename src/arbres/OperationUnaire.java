package arbres;

import outils.Logger;

public class OperationUnaire extends Evaluable {
    public Evaluable droite;
    private OperateurUnaire operateur;
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
}
