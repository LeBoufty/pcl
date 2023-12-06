package arbres;

import java.util.ArrayList;

import outils.Logger;

public class Struct implements Noeud, IType {
    public String nom;
    public ArrayList<String> champs;
    public ArrayList<IType> types;
    public Struct(String nom, ArrayList<String> champs, ArrayList<IType> types) {
        this.nom = nom;
        this.champs = champs;
        this.types = types;
    }
    public Struct() {
        this.nom = "";
        this.champs = new ArrayList<String>();
        this.types = new ArrayList<IType>();
    }
    public IType getChamp(String nom) {
        int i = this.champs.indexOf(nom);
        if (i == -1) {
            Logger.error(nom+" n'est pas un champ de "+this.nom);
            return Type.NULLTYPE;
        } else {
            return this.types.get(i);
        }
    }
    public String toString() {
        String sortie = "type" + this.nom + "is record ";
        for (int i = 0; i < this.champs.size(); i++) {
            sortie += this.champs.get(i) + " : " + this.types.get(i).toString() + "; ";
        }
        sortie += "end record";
        return sortie;
    }
    public boolean valide() {
        boolean sortie = true;
        for (IType t : types) {
            sortie = sortie && t.valide();
        }
        sortie = sortie && champs.size() == types.size();
        return sortie;
    }
}
