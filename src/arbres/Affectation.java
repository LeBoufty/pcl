package arbres;

import outils.Logger;

public class Affectation implements Noeud {
    public Variable gauche;
    public Evaluable droite;
    public Affectation(Variable g, Evaluable d) {
        this.gauche = g; this.droite = d;
    }
    public String toString() {
        return this.gauche.toString() + ":=" + this.droite.toString() + ";";
    }
    public boolean valide() {
        boolean sortie = true;
        if (this.gauche == null) {
            Logger.error("Affectation "+ this.hashCode() +" invalide : membre gauche null");
            sortie = false;
        } else if (this.droite == null) {
            Logger.error("Affectation "+ this.hashCode() +" invalide : membre droit null");
            sortie = false;
        } else {
            sortie = this.gauche.valide() && this.droite.valide();
        }
        return sortie;
    }
}
