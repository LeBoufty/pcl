package arbres;

import outils.Logger;

public enum Type implements IType, Noeud {
    INTEGER, CHARACTER, BOOLEAN, NULLTYPE;
    public boolean valide() {
        return true;
    }
    public IType getChamp(String nom) {
        Logger.error("Tentative d'accès à un champ d'un type non structuré");
        return NULLTYPE;
    }

    public void produire() {
         System.out.println("Type");
// TODO : probablement rien à produire, c'est sémantique.
    }
}
