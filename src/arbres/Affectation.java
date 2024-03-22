package arbres;

import outils.Logger;
// ?import outils.Arbre_Syntaxique.TDS;
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
            // On affecte la valeur de la constante à la variable
            res += "MOV x0, " + this.droite.produire() + " // On met la constante dans x0 \n";
        }
        else {
            this.droite.produire();
            res += "MOV x0, x1 // Affectation \n";
        }

        // Cas variable locale
        if (this.gauche.getTDS().search_imbrication_TDS(this.gauche.identifiant) == 0) {
            res += "STR x0, [x29, #" + this.gauche.getTDS().search_deplacement_TDS(this.gauche.identifiant) + "] // On stocke la valeur de la variable locale \n";
        }
        else {
            // Cas variable globale
            res += "MOV x1, #" + (this.tds_parent.get_num_imbr() - this.gauche.getTDS().search_imbrication_TDS(this.gauche.identifiant)) + " // On met le nombre de saut dans x1 \n";
            // TODO : Soit une boucle java de saut soit une boucle d'assembleur générer par le main
        }
        return res;
        // TODO : Check les registres
    }

    public void TDS_creation(TDS_gen Parent) {
        // Rien à faire
    }

    public void TDS_link(TDS_gen Parent) {
        this.tds_parent = Parent;
        this.gauche.TDS_link(Parent);
        this.droite.TDS_link(Parent);
    }

    public TDS_gen getTDS(){
        return this.tds_parent;
    }
}
