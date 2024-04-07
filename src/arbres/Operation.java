package arbres;

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

    public String produire() {
        System.out.println("Operation gauche : " + this.gauche);
        System.out.println("Operation droite : " + this.droite);

        String res = "\n// Opération\n";

        if (this.gauche.isConstant() && this.droite.isConstant()) {
            // Si les deux opérandes sont des constantes, on peut les évaluer à la compilation
            res += "MOVZ x0, #" + this.operateur.getvalue((Constante) this.gauche, (Constante) this.droite) + " // On met le résultat de l'opération en x0\n";
            res += "SUB sp, sp, #16 // On décrémente le pointeur de pile\n";
            res += "STR x0, [sp] // On met le résultat en pile\n";
            return res;
        }

        res += this.gauche.produire();
        res += this.droite.produire();

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
            this.gauche = tds_parent.get_Variable_string_and_parent(((Variable) this.gauche).nom);
        }
        else {
            this.gauche.TDS_variable();
        }

        if (this.droite instanceof Variable) {
            this.droite = tds_parent.get_Variable_string_and_parent(((Variable) this.droite).nom);
        }
        else {
            this.droite.TDS_variable();
        }
    }
}
