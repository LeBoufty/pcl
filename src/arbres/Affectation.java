package arbres;

import java.util.HashMap;
import java.util.ArrayList;
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

        res += this.droite.produire();
        res += "MOV x1, x0 // On met la valeur de la droite dans x1 \n";

        // Cas variable locale
        if (this.gauche.getTDS().search_imbrication_TDS(this.gauche.identifiant) == 0) {
            res += "STR x0, [x29, #" + this.gauche.getTDS().search_deplacement_TDS(this.gauche.identifiant) + "] // On stocke la valeur de la variable locale \n";
        }
        else {
            // Cas variable globale
            res += "MOV x0, " + this.gauche.getTDS().search_deplacement_TDS(this.gauche.identifiant) + " // On met le déplacement de la variable dans x0 \n";
            res += "MOV x1, #" + (this.tds_parent.get_num_imbr() - this.gauche.getTDS().search_imbrication_TDS(this.gauche.identifiant)) + " // On met le nombre de saut dans x1 \n";
            res += "BL loop_search_var_global_515 // On cherche la variable globale \n"; // Il va falloir vérifier que la fonction n'existe pas déjà
        }
        return res;
        // TODO : Check les registres
    }

    public void TDS_creation(TDS_gen Parent, int variable_type) {
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

    public void TDS_variable(HashMap<String, ArrayList<Integer>> variables) {
        this.gauche.TDS_variable(variables);
        this.droite.TDS_variable(variables);
    }
}
