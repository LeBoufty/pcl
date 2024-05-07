package arbres;

import outils.Error_list;
import outils.Logger;
import outils.TDS.TDS_gen;

public class Operation extends Evaluable {
    public Evaluable gauche;
    public Evaluable droite;
    private Operateur operateur;
    public TDS_gen tds_parent = null;

    public Operation(Evaluable g, Evaluable d, Operateur o) {
        this.gauche = g; this.droite = d; this.operateur = o;
        if (g.type != d.type) {
            Logger.warn("Opération "+ this.toString() +" : types différents");
            // Un peu moche : si les types ne correspondent pas on prend NULL.
            this.type = Type.NULLTYPE;
        }
        // On prend le type de sortie de l'opérateur.
        else this.type = operateur.getType();
    }
    public Operation() {
        this.gauche = null; this.droite = null; this.operateur = Operateur.NONE;
        this.type = Type.NULLTYPE;
    }
    public Operateur getOperateur() {
        return this.operateur;
    }
    public void setOperateur(Operateur o) {
        this.operateur = o;
        this.type = o.getType();
    }
    public boolean valide() {
        boolean sortie = true;
        if (this.gauche == null) {
            Logger.error("Opération "+ this.hashCode() +" invalide : membre gauche null");
            sortie = false;
        } else if (this.droite == null) {
            Logger.error("Opération "+ this.hashCode() +" invalide : membre droit null");
            sortie = false;
        } else {
            sortie = this.gauche.valide() && this.droite.valide();
            if (this.gauche.type != this.droite.type) {
                Logger.error("Opération "+ this.toString() +" invalide : types différents");
                sortie = false;
            }
        }
        return sortie;
    }
    public String toString() {
        return this.gauche.toString() +" "+ this.operateur.toString() +" "+ this.droite.toString();
    }

    public String produire(TDS_gen tds_actuelle) {
        System.out.println("Operation gauche : " + this.gauche);
        System.out.println("Operation droite : " + this.droite);

        String res = "\n// Opération\n";

        if (this.gauche.isConstant() && this.droite.isConstant()) {
            // Si les deux opérandes sont des constantes, on peut les évaluer à la compilation
            int valeur = this.operateur.getvalue((Constante) this.gauche, (Constante) this.droite);
            if (valeur < 0) {res += "MOVN x0, #" + -valeur + "// On met la constante en négatif \n";} 
            else {res += "MOVZ x0, #" + valeur + "\n";}
            res += "SUB sp, sp, #16 // On décrémente le pointeur de pile\n";
            res += "STR x0, [sp] // On met le résultat en pile\n";
            return res;
        }
        
        res += this.gauche.produire(tds_parent);
        res += this.droite.produire(tds_parent);

        // On met les premières valeurs de la pile dans x0 et x1
        res += "LDR x1, [sp] // On met l'opérande droite dans x1\n";
        res += "ADD sp, sp, #16 // On décrémente le pointeur de pile\n";
        res += "LDR x0, [sp] // On met l'opérande gauche dans x0\n";
        res += "ADD sp, sp, #16 // On décrémente le pointeur de pile\n";

        // On effectue l'opération
        res += operateur.produire();
        
        // On met le résultat en pile
        res += "SUB sp, sp, #16 // On décrémente le pointeur de pile\n";
        res += "STR x0, [sp] // On met le résultat en pile\n";
        return res;
    }

    public void TDS_creation(TDS_gen Parent, int type_variable) {
        // Ne fait rien
    }

    public void TDS_link(TDS_gen Parent) {
        this.tds_parent = Parent;
        this.gauche.TDS_link(Parent);
        this.droite.TDS_link(Parent);
    }

    public TDS_gen getTDS(){
        return this.tds_parent;
    }

    public void TDS_variable() {
        if (this.gauche instanceof Variable) {
            Variable tmp = tds_parent.get_Variable_string_and_parent(((Variable) this.gauche).nom);
            if (tmp != null) {
                this.gauche = tmp;
            }
            else {
                Logger.error("Variable "+((Variable) this.gauche).nom+" non déclarée dans la TDS : "+tds_parent.nom_fonction);
                Error_list.tdsgen = true;
            }
        }
        else {
            this.gauche.TDS_variable();
        }

        if (this.droite instanceof Variable) {
            Variable tmp = tds_parent.get_Variable_string_and_parent(((Variable) this.droite).nom);
            if (tmp != null) {
                this.droite = tmp;
            }
            else {
                Logger.error("Variable "+((Variable) this.droite).nom+" non déclarée dans la TDS : "+tds_parent.nom_fonction);
                Error_list.tdsgen = true;
            }
        }
        else {
            this.droite.TDS_variable();
        }
    }

    public void TDS_func_proc_change() {
        // Cas du membre gauche
        if (this.gauche instanceof AppelFonction) {
            String nom = ((AppelFonction) this.gauche).fonction.nom;
            this.gauche = this.tds_parent.get_new_Appel(nom, this.gauche);
        }
        else if (this.gauche instanceof AppelProcedure) {
            String nom = ((AppelProcedure) this.gauche).procedure.nom;
            this.gauche = this.tds_parent.get_new_Appel(nom, this.gauche);
        }
        else {
            this.gauche.TDS_func_proc_change();
        }

        // Cas du membre droit
        if (this.droite instanceof AppelFonction) {
            String nom = ((AppelFonction) this.droite).fonction.nom;
            this.droite = this.tds_parent.get_new_Appel(nom, this.droite);
        }
        else if (this.droite instanceof AppelProcedure) {
            String nom = ((AppelProcedure) this.droite).procedure.nom;
            this.droite = this.tds_parent.get_new_Appel(nom, this.droite);
        }
        else {
            this.droite.TDS_func_proc_change();
        }
    }

}
