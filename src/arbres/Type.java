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

    public String produire() {
        System.out.println("Type");

        return "";
// TODO : probablement rien à produire, c'est sémantique.
    }

    public void TDS_creation(TDS_gen Parent) {
        // Rien à faire
    }
}
