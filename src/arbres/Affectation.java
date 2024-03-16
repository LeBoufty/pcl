package arbres;

import outils.Logger;
import outils.TDS.TDS_gen;

public class Affectation implements Noeud {
    public Variable gauche;
    public Evaluable droite;
    public TDS_gen tds_parent = null;

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

    public String produire() {
        System.out.println("Affectation gauche : " + this.gauche);
        System.out.println("Affectation droite : " + this.droite);
        
        String res = "";

        if (this.droite.isConstant()) {
            res += "MOV x0, #"+((Constante) this.droite).valeur+"\n";
        }
        else {
            this.droite.produire();
            res += "MOV x0, x0\n";
        }

        return res;
        // TODO : Check les registres
    }

    public void TDS_creation(TDS_gen Parent) {
        // Rien à faire
    }

    public TDS_gen getTDS() {
        return null;
    }
}
