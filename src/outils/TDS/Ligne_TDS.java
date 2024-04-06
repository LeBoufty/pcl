package outils.TDS;

import arbres.Variable;

public class Ligne_TDS {

    public Integer contenu_base;
    public Integer taille;
    public Boolean est_une_variable;
    public Variable variable;

    public Ligne_TDS(Integer contenu_base) {
        this.contenu_base = contenu_base;
        this.taille = 0;
        this.est_une_variable = false;
        this.variable = null;
    }

    public Ligne_TDS(Variable var_obj, Integer taille) {
        this.contenu_base = null;
        this.taille = taille;
        this.est_une_variable = true;
        this.variable = var_obj;
    }
}
