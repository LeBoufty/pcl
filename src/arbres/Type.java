package arbres;

import outils.Logger;

import outils.TDS.TDS_gen;

public enum Type implements IType, Noeud {
    INTEGER, CHARACTER, BOOLEAN, NULLTYPE;
    public boolean valide() {
        return true;
    }
    public IType getChamp(String nom) {
        Logger.error("Tentative d'accès à un champ d'un type non structuré");
        return NULLTYPE;
    }

    public String produire(TDS_gen tds_actuelle) {
        Logger.debug("Type");
        return "";
    }

    public void TDS_creation(TDS_gen Parent, int type_variable) {
        // Rien à faire
    }

    public void TDS_link(TDS_gen Parent) {
        // Rien à faire - Mais je suis pas sûr que ça soit correct
    }

    public TDS_gen getTDS() {
        // Rien à faire - Mais je suis pas sûr que ça soit correct
        return null;
    }

    public void TDS_variable() {
        // Rien à faire
    }

    public void TDS_func_proc_creation() {
        // Rien à faire
    }

    public void TDS_func_proc_change() {
        // Rien à faire
    }
}
