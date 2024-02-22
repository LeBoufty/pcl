package outils.TDS;

import java.util.ArrayList;

import arbres.Noeud;

public class Struct_TDS2 {
    //doit contenir num imbr, num reg, nom de fonction
    //mettre nom deplacement taille pour chaque variable
    
    public ArrayList<Struct_TDS2> tds_childrens;
    public Struct_TDS2 tds_parent;
    public Noeud noeud_associé;
    public int tds_depth;

    public ArrayList<Integer> tds_code;

    public Struct_TDS2(Noeud noeud_associé) {
        this.noeud_associé = noeud_associé;
        this.tds_childrens = new ArrayList<Struct_TDS2>();
        this.tds_code = new ArrayList<Integer>();
        this.tds_parent = null;
        this.tds_depth = 0;
    }

    public void add_TDS_child(Struct_TDS2 child) {
        this.tds_childrens.add(child);
        child.tds_parent = this;
        child.tds_depth = this.tds_depth + 1;
    }

    public void remove_TDS_child(Struct_TDS2 child) {
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
