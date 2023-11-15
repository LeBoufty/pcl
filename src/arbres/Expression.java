package arbres;

import outils.Logger;

public abstract class Expression extends Evaluable {
    public Evaluable gauche;
    public Evaluable droite;
    protected String operateur;
    public Expression(Evaluable g, Evaluable d) {
        if (g == null || d == null) Logger.warn("Expression "+ this.hashCode() +" invalide : membre null");
        this.type = g.type;
        this.gauche = g; this.droite = d;
        if (g.type != d.type) Logger.warn("Expression "+ this.toString() +" : types différents");
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
                Logger.error("Expression "+ this.toString() +" invalide : types différents");
                sortie = false;
            }
        }
        return sortie;
    }
    public String toString() {
        return this.gauche.toString() +" "+ this.operateur +" "+ this.droite.toString();
    }
}
