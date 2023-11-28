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
        return sortie;
    }
    public String toString() {
        return this.operateur.toString() +" "+ this.droite.toString();
    }
}
