package outils.TDS;

import arbres.*;

public class Ligne_TDS_func {
    
    public Fonction fonction = null;
    public ProcedureParams procedure = null;

    public Ligne_TDS_func(Fonction f) {
        this.fonction = f;
    }

    public Ligne_TDS_func(ProcedureParams p) {
        this.procedure = p;
    }

    public boolean estFonction() {
        return this.fonction != null;
    }

    public boolean estProcedure() {
        return this.procedure != null;
    }

    public String getnom() {
        if (this.fonction != null) {
            return this.fonction.nom;
        } else if (this.procedure != null) {
            return this.procedure.nom;
        }
        return null;
    }

    public Noeud get_Fonc_Proc() {
        if (this.fonction != null) {
            return this.fonction;
        } else if (this.procedure != null) {
            return this.procedure;
        }
        return null;
    }
}
