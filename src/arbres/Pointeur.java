package arbres;

import outils.Logger;

public class Pointeur implements IType {
    public IType type;
    public Pointeur(IType t) {type = t;}
    public IType getChamp(String nom) {
        if (type instanceof Struct) {
            return ((Struct)type).getChamp(nom);
        } else {
            Logger.error("Le type " + type.toString() + " n'est pas une structure");
            return Type.NULLTYPE;
        }
    }
    public boolean valide() {
        return type.valide();
    }
    public String toString() {
        return type.toString()+"*";
    }
}
