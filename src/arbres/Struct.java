package arbres;

import java.util.ArrayList;

import outils.Logger;

public class Struct implements Noeud, IType {
    public String nom;
    public ArrayList<Champ> champs;
    public Struct(String nom, ArrayList<Champ> champs) {
        this.nom = nom;
        this.champs = champs;
    }
    public Struct() {
        this.nom = "";
        this.champs = new ArrayList<Champ>();
    }
    public IType getChamp(String nom) {
        for (Champ c : champs) {
            if (c.nom.equals(nom)) {
                return c.type;
            }
        }
        Logger.error("Le champ " + nom + " n'existe pas dans la structure " + this.nom);
        return Type.NULLTYPE;
    }
    public String toString() {
        return this.nom;
    }
    public boolean valide() {
        boolean sortie = true;
        for (Champ t : champs) {
            sortie = sortie && t.valide();
        }
        return sortie;
    }
}
