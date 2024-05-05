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

    public String produire(TDS_gen tds_actuelle) {
        System.out.println("Affectation gauche : " + this.gauche.identifiant);
        System.out.println("Affectation droite : " + this.droite);
        
        String res = "";

        res += this.droite.produire(tds_parent); // Le résultat est en sommet de pile
        res += "LDR x2, [sp] // On met la valeur de la variable droite dans x2 \n";
        
        // On va chercher la variable dans la TDS
        int depl = this.tds_parent.get_index(this.gauche.identifiant)*16;
        int Nb_saut = this.tds_parent.search_imbrication_TDS(this.gauche.identifiant);
        
        // Cas variable locale
        if (Nb_saut == 0) {
            res += "STR x2, [x29, #" + -depl + "] // On met la valeur de la variable droite dans la variable gauche \n";
            res += "ADD sp, sp, #16 // On dépile la valeur \n";
        }
        else {// Cas variable globale
            // On met le nombre depl, nb_saut en pile
            res += "SUB sp, sp, #16 // On décrémente le pointeur de pile \n";
            if (depl < 0) {res += "MOVN x0, #" + -depl + " // On met le deplacement en pile \n";}
            else{res += "MOVZ x0, #" + depl + " // On met le deplacement en pile \n";}
            res += "MOVZ x1, #" + Nb_saut + " // On met le nombre de saut en pile \n"; //TODO : A vérifier
            res += "BL set_global_var // On met la valeur de la variable droite dans la variable gauche \n";
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

    public void TDS_variable() {
        this.gauche = this.tds_parent.get_Variable_string_and_parent(this.gauche.nom);
        if (this.droite instanceof Variable) {
            this.droite = this.tds_parent.get_Variable_string_and_parent(((Variable) this.droite).nom);
        }
        else {
            this.droite.TDS_variable();
        }
    }

    public void TDS_func_proc_creation() {
        // Rien à faire
    }

    public void TDS_func_proc_change() {
        if (this.droite instanceof AppelFonction) {
            String nom = ((AppelFonction) this.droite).fonction.nom;
            this.droite = this.tds_parent.get_new_Appel(nom, droite);
        }
        else if (this.droite instanceof AppelProcedure) {
            String nom = ((AppelProcedure) this.droite).procedure.nom;
            this.droite = this.tds_parent.get_new_Appel(nom, droite);
        }
        else {
            this.droite.TDS_func_proc_change();
        }
    }
}
