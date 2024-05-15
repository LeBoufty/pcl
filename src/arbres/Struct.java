package arbres;

import java.util.ArrayList;

import outils.Logger;

import outils.TDS.TDS_gen;

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

    public String produire(TDS_gen tds_actuelle) {
        Logger.debug(nom);

        return "";
// TODO : cf Record. Il faudra utiliser des déplacements pour les champs.
    }

    public void TDS_creation(TDS_gen Parent, int type_variable) {
        // TODO : à faire 
    }

    public void TDS_link(TDS_gen Parent) {
        // TODO : à faire
    }

    public TDS_gen getTDS() {
        // TODO : à faire
        return null;
    }

    public void TDS_variable() {
        // TODO : à faire
    }

    public void TDS_func_proc_creation() {
        // TODO : à faire
    }

    public void TDS_func_proc_change() {
        // TODO : à faire
    }
}
