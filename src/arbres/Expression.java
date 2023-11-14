package arbres;

import outils.Logger;

public abstract class Expression extends Evaluable {
    public Evaluable gauche;
    public Evaluable droite;
    public Expression(Evaluable g, Evaluable d) {
        this.gauche = g; this.droite = d;
    }
    public boolean valide() {
        boolean sortie = true;
        if (this.gauche == null) {
            Logger.error("Expression "+ this.hashCode() +" invalide : membre gauche null");
            sortie = false;
        } else if (this.droite == null) {
            Logger.error("Expression "+ this.hashCode() +" invalide : membre droit null");
            sortie = false;
        } else {
            sortie = this.gauche.valide() && this.droite.valide();
        }
        return sortie;
    }
}
