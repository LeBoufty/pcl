package arbres;

import outils.Logger;

public abstract class Expression extends Evaluable {
    public Evaluable gauche;
    public Evaluable droite;
    public Expression(Evaluable g, Evaluable d) {
        if (g == null || d == null) Logger.warn("Expression "+ this.hashCode() +" invalide : membre null");
        if (g.type != d.type) Logger.warn("Expression "+ this.hashCode() +" : types différents");
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
            if (this.gauche.type != this.droite.type) {
                Logger.error("Expression "+ this.hashCode() +" invalide : types différents");
                sortie = false;
            }
        }
        return sortie;
    }
}
