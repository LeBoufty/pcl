package arbres;

import outils.Logger;

public class Operation extends Evaluable {
    public Evaluable gauche;
    public Evaluable droite;
    private Operateur operateur;
    public Operation(Evaluable g, Evaluable d, Operateur o) {
        this.gauche = g; this.droite = d; this.operateur = o;
        if (g.type != d.type) {
            Logger.warn("Opération "+ this.toString() +" : types différents");
            // Un peu moche : si les types ne correspondent pas on prend NULL.
            this.type = Type.NULLTYPE;
        }
        // On prend le type de sortie de l'opérateur.
        else this.type = operateur.getType();
    }
    public Operation() {
        this.gauche = null; this.droite = null; this.operateur = Operateur.NONE;
        this.type = Type.NULLTYPE;
    }
    public Operateur getOperateur() {
        return this.operateur;
    }
    public void setOperateur(Operateur o) {
        this.operateur = o;
        this.type = o.getType();
    }
    public boolean valide() {
        boolean sortie = true;
        if (this.gauche == null) {
            Logger.error("Opération "+ this.hashCode() +" invalide : membre gauche null");
            sortie = false;
        } else if (this.droite == null) {
            Logger.error("Opération "+ this.hashCode() +" invalide : membre droit null");
            sortie = false;
        } else {
            sortie = this.gauche.valide() && this.droite.valide();
            if (this.gauche.type != this.droite.type) {
                Logger.error("Opération "+ this.toString() +" invalide : types différents");
                sortie = false;
            }
        }
        return sortie;
    }
    public String toString() {
        return this.gauche.toString() +" "+ this.operateur.toString() +" "+ this.droite.toString();
    }

    public String produire() {
        return ""; // TODO : switch case à faire sur les classes des opérandes et de l'opérateur. Dans le cours.
    }
}
