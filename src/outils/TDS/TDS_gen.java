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

    public ArrayList<Integer> deplacement;
    public ArrayList<Integer> taille;

    public ArrayList<Integer> variable_code;

    public TDS_gen(Noeud noeud_associé, String nom_fonction) {
        this.noeud_associé = noeud_associé;
        this.tds_childrens = new ArrayList<TDS_gen>();
        this.variable_code = new ArrayList<Integer>();
        this.deplacement = new ArrayList<Integer>();
        this.taille = new ArrayList<Integer>();
        this.tds_parent = null;
        this.num_imbr = 0;
        this.num_reg = 0;
        this.nom_fonction = nom_fonction;
    }

    public TDS_gen(Noeud noeud_associé, TDS_gen Parent, String nom) {
        this.noeud_associé = noeud_associé;
        this.tds_childrens = new ArrayList<TDS_gen>();
        this.variable_code = new ArrayList<Integer>();
        this.deplacement = new ArrayList<Integer>();
        this.taille = new ArrayList<Integer>();
        this.tds_parent = Parent;
        this.num_imbr = Parent.num_imbr + 1;
        this.num_reg = 0;
        this.nom_fonction = nom;
        Parent.add_TDS_child(this);
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

    public void add_variable(int nom, int deplacement, int taille) {
        this.variable_code.add(nom);
        this.taille.add(taille);
        if(this.deplacement.size() == 0)
        {
            this.deplacement.add(taille);
        }   
        else if(this.deplacement.size() == 1)
        {
            this.deplacement.add(this.deplacement.get(0) + taille);
        }   
        else if(this.deplacement.size() > 1)
        {
            this.deplacement.add(this.deplacement.get(this.deplacement.size() - 1) + taille);
        }
    }

    public void remove_variable(int nom) {
        int index = this.variable_code.indexOf(nom);
        this.variable_code.remove(index);
        this.deplacement.remove(index);
        this.taille.remove(index);
    }

    public int get_deplacement(int nom) {
        int index = this.variable_code.indexOf(nom);
        return this.deplacement.get(index);
    }

    public int get_taille(int nom) {
        int index = this.variable_code.indexOf(nom);
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

    public String toString() {
        String sortie = "+==================+\n";
        for(int i = 0; i < this.variable_code.size(); i++) {
            sortie += "Code : " + this.variable_code.get(i) + " | Deplacement : " + this.deplacement.get(i) + " | Taille : " + this.taille.get(i) + "\n";
        }
        sortie += tds_childrens.size() + " enfants\n";
        for (TDS_gen tds : this.tds_childrens) {
            sortie += tds.toString();
        }
        sortie += "+==================+\n";
        return sortie;
    }
}
