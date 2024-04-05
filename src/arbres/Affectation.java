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
        System.out.println("Affectation gauche : " + this.gauche.identifiant);
        System.out.println("Affectation droite : " + this.droite);
        
        String res = "";

        res += this.droite.produire(); // Le résultat est en sommet de pile
        res += "LDR x2, [sp] // On met la valeur de la variable droite dans x0 \n";
        
        // On va chercher la variable dans la TDS
        int depl = this.tds_parent.get_index(this.gauche.identifiant)*8;
        int num_imbr_ici = this.tds_parent.get_num_imbr();
        int num_imbr_var = this.tds_parent.search_imbrication_TDS(this.gauche.identifiant);
        
        // Cas variable locale
        if (num_imbr_var == num_imbr_ici) {
            res += "STR x2, [x29, #-" + depl + "] // On met la valeur de la variable droite dans la variable gauche \n";
            res += "ADD sp, sp, #8 // On dépile la valeur \n";
        }
        else {// Cas variable globale
            // On met le nombre depl, nb_saut en pile
            res += "SUB sp, sp, #16 // On décrémente le pointeur de pile \n";
            res += "MOVZ x0, #" + depl + " // On met le deplacement en pile \n";
            res += "MOVZ x1, #" + (num_imbr_ici - num_imbr_var) + " // On met le nombre de saut en pile \n"; //TODO : A vérifier
        }
        return res;
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
