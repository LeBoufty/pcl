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

        String res = "// Return \n";

        if (!this.estVide()) {
            res += this.valeur.produire(tds_actuelle);
        }

        // Mise en place de la valeur de retour
        res += "LDR x6, [sp] // Valeur de retour dans le registre x6\n";
        // Restauration du pointeur de pile
        res += "MOV sp, x29 // Restauration du pointeur de pile\n";  
        // Restauration du pointeur de pile et du lien de retour
        res += "LDP x29, lr, [sp, #16] // Restauration du pointeur de pile et du lien de retour\n";
        res += "RET // Retour de la fonction\n";

        return res;
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

    public void TDS_func_proc_creation() {
        // Ne fait rien
    }

    public void TDS_func_proc_change() {
        if (!this.estVide()) {
            if (this.valeur instanceof AppelFonction) {
                String nom = ((AppelFonction) this.valeur).fonction.nom;
                this.valeur = this.tds_parent.get_new_Appel(nom, this.valeur);
            } else if (this.valeur instanceof AppelProcedure) {
                String nom = ((AppelProcedure) this.valeur).procedure.nom;
                this.valeur = this.tds_parent.get_new_Appel(nom, this.valeur);
            } else {
                this.valeur.TDS_func_proc_change();
            }
        }
    }
}
