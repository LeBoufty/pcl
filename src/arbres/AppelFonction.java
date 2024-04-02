package arbres;

import java.util.ArrayList;
import java.util.HashMap;

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
        String sortie = this.fonction.nom + "(";
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

    public String produire() {
        System.out.println("Appel de fonction "+ this.fonction.nom);
        System.out.println("Paramètres : "+ this.params);

        String res = "";

        // Sauvegarde des registres
        res += "stp x29, x30, [sp, #-16]! // Sauvegarde des registres\n"; // TODO : à vérifier

        // Met en place les paramètres
        for (int i = 0; i < params.size(); i++) {
            System.out.println("Paramètre "+ i +" : "+ params.get(i));
            // Mettre la valeur du paramètre dans le registre x0
            res += params.get(i).produire(); // TODO : à vérifier
            // Mettre la valeur du paramètre dans la pile
            res += "str x0, [sp, #"+ (i * 16) +"] // Mettre le paramètre "+ i +" dans la pile\n";
        }

        // Appel de la fonction
        res += "bl "+ this.fonction.nom +" // Appel de la fonction\n";

        // Restauration des registres
        res += "ldp x29, x30, [sp], #16 // Restauration des registres\n";// TODO : à vérifier

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

    public void TDS_variable(HashMap<String, ArrayList<Integer>> variables) {
        for (Evaluable p : params) {
            p.TDS_variable(variables);
        }
    }

}
