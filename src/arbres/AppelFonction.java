package arbres;

import java.util.ArrayList;

import outils.Error_list;
import outils.Logger;
import outils.TDS.TDS_gen;


public class AppelFonction extends Evaluable {
    public Fonction fonction;
    public ArrayList<Evaluable> params;
    public TDS_gen tds_parent = null;

    public AppelFonction(Fonction fonction, Evaluable[] parametres) {
        this.fonction = fonction;
        this.params = new ArrayList<>();
        for (Evaluable p : parametres) {
            this.params.add(p);
        }
        this.type = fonction.type;
    }
    public AppelFonction(Fonction fonction) {
        this.fonction = fonction;
        this.params = new ArrayList<>();
        this.type = fonction.type;
    }
    public void ajouterParametre(Evaluable parametre) {
        this.params.add(parametre);
    }
    public String toString() {
        String sortie = this.fonction.nom + "-f&" + this.fonction.id + "(";
        ArrayList<String> parStrings = new ArrayList<>();
        for (Evaluable p : params) {
            parStrings.add(p.toString());
        }
        sortie += String.join(", ", parStrings) + ")";
        return sortie;
    }
    public boolean valide() {
        boolean sortie = true;
        for (Evaluable p : params) {
            sortie = sortie && p.valide();
        }
        if (params.size() != fonction.params.size()) {
            Logger.error("Appel de fonction "+ this.fonction.nom +" invalide : nombre de paramètres incorrect");
            sortie = false;
        }
        else {
            for (int i = 0; i < params.size(); i++) {
                if (params.get(i).type != fonction.params.get(i).type) {
                    Logger.error("Appel de fonction "+ this.fonction.nom +" invalide : paramètre "+ i +" de type incorrect");
                    sortie = false;
                }
            }
        }
        return sortie;
    }

    public String produire(TDS_gen tds_actuelle) {
        System.out.println("Appel de fonction "+ this.fonction.nom);
        System.out.println("Paramètres : "+ this.params);

        String res = "// Appel de fonction "+ this.fonction.nom +"\n";

        // Met en place les paramètres
        for (int i = 0; i < params.size(); i++) {
            System.out.println("Paramètre "+ i +" : "+ params.get(i));
            // Mettre la valeur du paramètre dans le registre x0
            res += "// Paramètre "+ i +"\n";
            res += params.get(i).produire(this.tds_parent);
        }

        // Gestion du chainage statique
        res += "// Gestion du chainage statique\n";
        res += "SUB sp, sp, #16 // Incrémentation du pointeur de pile\n";
        if (this.tds_parent.get_num_reg() == this.fonction.getTDS().get_num_reg()) {
            // Sauvegarde du chainage statique cas récursif
            res += "STR x27, [sp] // Sauvegarde du chainage statique\n";
        } else {
            // Sauvegarde du chainage statique cas non récursif
            res += "STR x29, [sp] // Sauvegarde du chainage statique\n";
            res += "MOV x27, x29 // Mise à jour du chainage statique\n";
        }

        // Appel de la fonction
        res += "BL F"+ this.fonction.getTDS().get_num_reg() +" // Appel de la fonction\n";

        // Gestion du chainage statique
        res += "// Gestion du chainage statique\n";
        res += "ADD sp, sp, #16 // Le chainage statique ça dégage\n";

        // Récupération du résultat
        res += "// Récupération du résultat\n";
        res += "ADD sp, sp, #" + (params.size() * 16) + " // Décrémentation du pointeur de pile de la taille des paramètres\n";
        res += "SUB sp, sp, #16 // Réserve de l'espace pour le résultat\n";
        res += "STR x26, [sp] // Sauvegarde du résultat\n";

        return res;
    }

    public void TDS_creation(TDS_gen Parent, int variable_type) {
        // Rien à faire
    }

    public void TDS_link(TDS_gen Parent) {
        this.tds_parent = Parent;
        for (Evaluable p : params) {
            p.TDS_link(Parent);
        }
    }

    public TDS_gen getTDS() {
        return this.tds_parent;
    }

    public void TDS_variable() {

        for (int i = 0; i < params.size(); i++) {
            if (params.get(i) instanceof Variable) {
                Variable tmp = this.tds_parent.get_Variable_string_and_parent(((Variable) params.get(i)).nom);
                if (tmp != null) {
                    params.set(i, tmp);
                }
                else {
                    Logger.error("Variable "+((Variable) params.get(i)).nom+" non déclarée dans la TDS : "+tds_parent.nom_fonction);
                    Error_list.tdsgen = true;
                }
            }
            else {
                params.get(i).TDS_variable();
            }
        }
    }

    public void TDS_func_proc_change() {
        
        for (int i = 0; i < params.size(); i++) {
            if (params.get(i) instanceof AppelFonction) {
                String nom = ((AppelFonction) params.get(i)).fonction.nom;
                params.set(i, this.tds_parent.get_new_Appel(nom, params.get(i)));
            }
            else if (params.get(i) instanceof AppelProcedure) {
                String nom = ((AppelProcedure) params.get(i)).procedure.nom;
                params.set(i, this.tds_parent.get_new_Appel(nom, params.get(i)));
            }
            else {
                params.get(i).TDS_func_proc_change();
            }
        }
    }

}
