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
    public int num_imbr;
    public int num_reg;
    public String nom_fonction;
    public ArrayList<String> nom_variable;
    public ArrayList<Integer> deplacement;
    public ArrayList<Integer> taille;

    public ArrayList<Integer> tds_code;

    public TDS_gen(Noeud noeud_associé, int num_imbr, int num_reg, String nom_fonction) {
        this.noeud_associé = noeud_associé;
        this.tds_childrens = new ArrayList<TDS_gen>();
        this.tds_code = new ArrayList<Integer>();
        this.tds_parent = null;
        this.num_imbr = num_imbr;
        this.num_reg = num_reg;
        this.nom_fonction = nom_fonction;
    }

    public void add_TDS_child(TDS_gen child) {
        this.tds_childrens.add(child);
        child.tds_parent = this;
        child.num_imbr = this.num_imbr + 1;
    }

    public void remove_TDS_child(TDS_gen child) {
        this.tds_childrens.remove(child);
        child.tds_parent = null;
        child.num_imbr = 0;
    }

    public void add_TDS_code(int code) {
        this.tds_code.add(code);
    }
    
    public void remove_TDS_code(int code) {
        this.tds_code.remove(code);
    }

    public void add_variable(String nom, int deplacement, int taille) {
        this.nom_variable.add(nom);
        this.deplacement.add(deplacement);
        this.taille.add(taille);
    }

    public void remove_variable(String nom) {
        int index = this.nom_variable.indexOf(nom);
        this.nom_variable.remove(index);
        this.deplacement.remove(index);
        this.taille.remove(index);
    }

    public void set_deplacement(String nom, int deplacement) {
        int index = this.nom_variable.indexOf(nom);
        this.deplacement.set(index, deplacement);
    }

    public void set_taille(String nom, int taille) {
        int index = this.nom_variable.indexOf(nom);
        this.taille.set(index, taille);
    }

    public int get_deplacement(String nom) {
        int index = this.nom_variable.indexOf(nom);
        return this.deplacement.get(index);
    }

    public int get_taille(String nom) {
        int index = this.nom_variable.indexOf(nom);
        return this.taille.get(index);
    }

    public TDS_gen get_parent() {
        return this.tds_parent;
    }

    public int get_num_imbr() {
        return this.num_imbr;
    }

    public int get_num_reg() {
        return this.num_reg;
    }

    public String get_nom_fonction() {
        return this.nom_fonction;
    }



}
