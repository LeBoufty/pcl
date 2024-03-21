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
        return this.expression.produire() + "bl printf\n";
    }

    public void TDS_creation(TDS_gen Parent) {
        // Rien
    }

    public TDS_gen getTDS() {
        return this.tds_parent;
    }

    public void TDS_link(TDS_gen Parent) {
        this.tds_parent = Parent;
        this.expression.TDS_link(Parent);
    }

}
