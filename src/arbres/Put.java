package arbres;

import java.util.HashMap;
import java.util.ArrayList;

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
        return "// Printf\n"+this.expression.produire() + "bl printf\nADD sp, sp, #8 // On dépile la valeur\n";
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

    public void TDS_variable(HashMap<String, ArrayList<Integer>> variables) {
        this.expression.TDS_variable(variables);
    }

}
