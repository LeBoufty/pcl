package arbres;


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

    public String produire() {
        String res = "// Printf\n";
        res += this.expression.produire();
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
            ((Variable) this.expression).TDS_variable();
        }
        else {
            this.expression.TDS_variable();
        }
    }

}
