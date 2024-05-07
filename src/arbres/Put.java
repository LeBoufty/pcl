package arbres;


import outils.Error_list;
import outils.Logger;
import outils.TDS.TDS_gen;

public class Put implements Noeud {
    public Evaluable expression;
    public TDS_gen tds_parent = null;

    public Put(Evaluable expression) {
        this.expression = expression;
    }

    public String toString() {
        return "put(" + this.expression.toString() + ");";
    }

    public boolean valide() {
        return this.expression.valide();
    }

    public String produire(TDS_gen tds_actuelle) {
        String res = "// Printf\n";
        res += this.expression.produire(tds_parent);
        res += "MOV x1, x0\n";
        res += "ADRP x0, format\n";
        res += "ADD x0, x0, :lo12:format\n";
        res += "BL printf\n";
        res += "ADD sp, sp, #16\n";
        return res;
    }

    public void TDS_creation(TDS_gen Parent, int type_variable) {
        // Rien
    }

    public TDS_gen getTDS() {
        return this.tds_parent;
    }

    public void TDS_link(TDS_gen Parent) {
        this.tds_parent = Parent;
        this.expression.TDS_link(Parent);
    }

    public void TDS_variable() {
        if (this.expression instanceof Variable) {
            Variable tmp = this.tds_parent.get_Variable_string_and_parent(((Variable) this.expression).nom);
            if (tmp != null) {
                this.expression = tmp;
            }
            else {
                Logger.error("Variable " + ((Variable) this.expression).nom + " non déclarée dans la TDS : " + this.tds_parent.nom_fonction);
                Error_list.tdsgen = true;
            }
        }
        else {
            this.expression.TDS_variable();
        }
    }

    public void TDS_func_proc_creation() {
        // Rien à faire
    }

    public void TDS_func_proc_change() {
        if (this.expression instanceof AppelFonction) {
            String nom = ((AppelFonction) this.expression).fonction.nom;
            this.expression = this.tds_parent.get_new_Appel(nom, this.expression);
        }
        else if (this.expression instanceof AppelProcedure) {
            String nom = ((AppelProcedure) this.expression).procedure.nom;
            this.expression = this.tds_parent.get_new_Appel(nom, this.expression);
        }
        else {
            this.expression.TDS_func_proc_change();
        }
    }
}
