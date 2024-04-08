package arbres;


import outils.TDS.TDS_gen;

public class Return implements Noeud {
    public Evaluable valeur;
    public TDS_gen tds_parent = null;

    public Return(Evaluable valeur) {
        this.valeur = valeur;
    }
    public Return() {
        this.valeur = new Constante();
    }
    public boolean estVide() {
        return this.valeur.type == Type.NULLTYPE;
    }
    public String toString() {
        if (!estVide()) {
            return "return " + this.valeur.toString() + ";";
        } else {
            return "return;";
        }
    }
    public boolean valide() {
        return this.estVide() || this.valeur.valide();
    }

    public String produire(TDS_gen tds_actuelle) {
         System.out.println("Return : " + valeur);

         return "";
// TODO : on définit ce qu'on met dans le registre de sortie (ou dans la pile)
    }

    public void TDS_creation(TDS_gen Parent, int type_variable) {
        // Ne fait rien
    }

    public void TDS_link(TDS_gen Parent) {
        this.tds_parent = Parent;
        if (!this.estVide()) {
            this.valeur.TDS_link(Parent);
        }
    }
    
    public TDS_gen getTDS() {
        return this.tds_parent;
    }

    public void TDS_variable() {
        if (!this.estVide()) {
            if (this.valeur instanceof Variable) {
                ((Variable) this.valeur).TDS_variable();
            } else {
                this.valeur.TDS_variable();
            }
        }
    }
}
