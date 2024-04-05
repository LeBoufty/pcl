package arbres;

import java.util.HashMap;
import java.util.ArrayList;

import outils.TDS.TDS_gen;
import outils.Logger;

public class Variable extends Evaluable {
    public int identifiant;
    public static int nbvariables = 0;
    public String nom;
    public TDS_gen tds_parent = null;

    public Variable(IType t) {
        this.identifiant = nbvariables;
        this.type = t;
        this.nom = "var"+String.valueOf(identifiant);
        nbvariables++;
    }
    public Variable(IType t, String nom) {
        this.identifiant = nbvariables;
        this.type = t;
        this.nom = nom;
        nbvariables++;
    }
    public String toString() {
        return "&"+String.valueOf(identifiant)+"-"+nom;
    }
    public boolean valide() {
        return true;
    }

    public String produire() {
        System.out.println(nom + " var type : " + type);
        System.out.println(nom + " var id : " + identifiant);

        String res = "";

        // On va chercher la variable dans la TDS
        int depl = this.tds_parent.get_index(this.identifiant);
        int num_imbr_ici = this.tds_parent.get_num_imbr();
        int num_imbr_var = this.tds_parent.search_imbrication_TDS(this.identifiant);

        System.out.println("Deplacement : " + depl + " Num imbrication : " + num_imbr_ici + " Num imbrication var : " + num_imbr_var);

        if (num_imbr_var == num_imbr_ici) { // Cas variable locale
            res += "LDR x0, [x29, #-" + depl + "] // " + this.nom + " Mise en pile var\n";
            res += "SUB sp, sp, #8 // " + this.nom + " Mise en pile var\n";
            res += "STR x0, [sp] // " + this.nom + " Mise en pile var\n";
        } else { // Cas variable globale
            res += "MOVZ x0, #" + depl + " // " + this.nom + " Mise en pile depl var\n";
            res += "MOVZ x1, #" + (num_imbr_ici - num_imbr_var) + " // " + this.nom + " Mise en pile nb saut var\n";
            res += "BL get_global_var // " + this.nom + " Mise en pile var\n";
            // Déplace le sommet de pile de 2*8 octets pour supprimer les deux valeurs depl et nb_saut
            res += "STR x2, [sp, #0] // " + this.nom + " Mise en pile var depuis le registre de retours des fonctions :)\n";
        }
        return res;
    }

    public void TDS_creation(TDS_gen Parent, int type_variable) {
        // On ajoute la variable à la TDS du parent
        //INTEGER, CHARACTER, BOOLEAN, NULLTYPE;
        int taille=0;
        if(this.type==Type.INTEGER)
        {
            taille=Integer.SIZE/8;
        }
        else if(this.type==Type.CHARACTER)
        {
            taille=Character.SIZE/8;
        }
        else if(this.type==Type.BOOLEAN)
        {
            taille=Byte.SIZE/8;
        }
        else if(this.type==Type.NULLTYPE)
        {
            taille=0;
        }
        else
        {
            Logger.error("Type de variable inconnu");
        }

        if (type_variable == 1) {
            Parent.add_parametre(this.identifiant, taille, this.nom);
        } else if (type_variable == 2) {
            Parent.add_variable(this.identifiant, taille, this.nom);
        } else {
            Logger.warn("Type de variable ou paramètres inconnu");
        }
        
    }

    public void TDS_link(TDS_gen Parent) {
        this.tds_parent = Parent;
    }

    public TDS_gen getTDS() {
        return this.tds_parent;
    }

    public void TDS_variable(HashMap<String, ArrayList<Integer>> variables) {
        ArrayList<Integer> tmp = variables.get(this.nom);

        // On prend la première variable trouvée
        TDS_gen tds = this.tds_parent;
        while (tds != null) {
            for (int i = 0; i < tmp.size(); i++) {
                if (tds.contains_variables(tmp.get(i))) {
                    Logger.debug("Variable : " + this.nom + " trouvée dans la TDS : " + tds.nom_fonction + " à l'index : " + tmp.get(i) + " ancien id : " + this.identifiant);
                    this.identifiant = tmp.get(i);
                    
                    return;
                }
            }

            tds = tds.tds_parent;    
        }

    }
}
