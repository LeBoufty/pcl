package outils.TDS;

import java.util.ArrayList;

import arbres.Noeud;

public class TDS_gen {
    //doit contenir num imbr, num reg, nom de fonction
    //mettre nom deplacement taille pour chaque variable
    //doit pouvoir donner le père
    
    public ArrayList<TDS_gen> tds_childrens;
    public TDS_gen tds_parent;
    public Noeud noeud_associé;
    public int tds_depth;

    public ArrayList<Integer> tds_code;

    public TDS_gen(Noeud noeud_associé) {
        this.noeud_associé = noeud_associé;
        this.tds_childrens = new ArrayList<TDS_gen>();
        this.tds_code = new ArrayList<Integer>();
        this.tds_parent = null;
        this.tds_depth = 0;
    }

    public void add_TDS_child(TDS_gen child) {
        this.tds_childrens.add(child);
        child.tds_parent = this;
        child.tds_depth = this.tds_depth + 1;
    }

    public void remove_TDS_child(TDS_gen child) {
        this.tds_childrens.remove(child);
        child.tds_parent = null;
        child.tds_depth = 0;
    }

    public void add_TDS_code(int code) {
        this.tds_code.add(code);
    }
    
    public void remove_TDS_code(int code) {
        this.tds_code.remove(code);
    }

}
