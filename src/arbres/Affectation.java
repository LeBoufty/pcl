package arbres;

import outils.Logger;

public class Affectation implements Noeud {
    public Variable gauche;
    public Evaluable droite;
    public Affectation(Variable g, Evaluable d) {
        this.gauche = g; this.droite = d;
        if (g.type != d.type) Logger.warn("Affectation "+ this.toString() +" : types différents");
    }
    public Affectation() {
        this.gauche = null; this.droite = null;
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
            if (this.gauche.type != this.droite.type) {
                Logger.error("Affectation "+ this.toString() +" invalide : types différents");
                sortie = false;
            }
        }
        return sortie;
    }

    public void produire() {
        System.out.println("Affectation gauche : " + this.gauche);
        System.out.println("Affectation droite : " + this.droite);
        
        this.gauche.produire();
        this.droite.produire();

        // TODO : changer la valeur d'une variable
    }
}
