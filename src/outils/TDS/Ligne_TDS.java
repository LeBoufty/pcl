package outils.TDS;

public class Ligne_TDS {

    public Integer contenu;
    public Integer taille;
    public Boolean est_une_variable;
    public String nom_var = null;

    public Ligne_TDS(Integer contenu, Integer taille) {
        this.contenu = contenu;
        this.taille = taille;
        this.est_une_variable = true;
    }

    public Ligne_TDS(Integer contenu) {
        this.contenu = contenu;
        this.taille = 0;
        this.est_une_variable = false;
    }

    public Ligne_TDS(Integer contenu, Integer taille, String nom_var) {
        this.contenu = contenu;
        this.taille = taille;
        this.est_une_variable = true;
        this.nom_var = nom_var;
    }
}
