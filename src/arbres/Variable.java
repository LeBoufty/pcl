package arbres;

import outils.TDS.TDS_gen;
import outils.Logger;
// ?import outils.Arbre_Syntaxique.TDS;

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


    public String produire(TDS_gen tds_actuelle) {
        System.out.println(nom + " var type : " + type);
        System.out.println(nom + " var id : " + identifiant);

        String res = "";

        // On va chercher la variable dans la TDS
        int depl = tds_actuelle.get_index(this.identifiant)*16;
        int num_imbr_ici = tds_actuelle.get_num_imbr();
        int num_imbr_var = tds_actuelle.search_imbrication_TDS(this.identifiant);

        System.out.println("Deplacement : " + depl + " Num imbrication : " + num_imbr_ici + " Num imbrication var : " + num_imbr_var);

        if (num_imbr_var == num_imbr_ici) { // Cas variable locale
            res += Store_Variable_X0_locale(depl);
            res += "SUB sp, sp, #16 // " + this.nom + " Mise en pile var\n";
            res += "STR x0, [sp] // " + this.nom + " Mise en pile var\n";
        } else { // Cas variable globale
            if (depl < 0) {res += "MOVN x0, #" + -depl + " // Deplacement en pile VAR GLOBALE \n";}
            else{res += "MOVZ x0, #" + depl + " // Deplacement en pile VAR GLOBALE \n";} // TODO : depl > 256
            res += "MOVZ x1, #" + (num_imbr_ici - num_imbr_var) + " // " + this.nom + " Nb saut VAR GLOBALE\n";
            res += "BL get_global_var // " + this.nom + " Mise en pile var\n";
            // Déplace le sommet de pile de 2*16 bits pour supprimer les deux valeurs depl et nb_saut
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
            Parent.add_parametre(this, taille);
        } else if (type_variable == 2) {
            Parent.add_variable(this, taille);
        } else {
            Logger.warn("Type de variable ou paramètres inconnu");
        }
        
    }

    public void TDS_link(TDS_gen Parent) {
        // this.tds_parent = Parent; // Ne pas le faire ici
    }

    public TDS_gen getTDS() {
        return this.tds_parent;
    }

    public void TDS_variable() {
        // Rien à faire car on le fait dans le noeud parent
    }

    public String Store_Variable_X0_locale(int depl){
        String res = "";
        if (depl < 256 ) {res += "LDR x0, [x29, #"+ -depl + "] // On récupère la valeur de la variable "+ this.nom +"\n";}
        else {
        int nb_depl = depl/256;
        int reste = depl%256;
        for (int i = 0; i < nb_depl; i++) {
            res += "SUB x29, x29, #256 // On déplace le frame pointer pour éviter les overflow dans le déplacement \n";
        }
        res += "LDR x0, [x29, #-" + reste + "] // On récupère la valeur de la variable "+ this.nom +"\n";
        for (int i = 0; i < nb_depl; i++) {
            res += "ADD x29, x29, #256 // On restaure le frame pointer \n";
        }
        }
        return res;
    }
}
