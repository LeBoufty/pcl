package outils.Arbre_Syntaxique;

import java.util.HashMap;
import arbres.*;

public class TDS {
    private HashMap<Integer,Noeud> tds;

    public TDS() {
        this.tds = new HashMap<Integer,Noeud>();
    }

    public void ajouter(int id, Noeud n) {
        this.tds.put(id, n);
    }

    public Noeud get(int id) {
        return this.tds.get(id);
    }

    public Variable getVariable(int id) {
        return (Variable) this.tds.get(id);
    }

    public Fonction getFonction(int id) {
        return (Fonction) this.tds.get(id);
    }

    public ProcedureParams getProcedureParams(int id) {
        return (ProcedureParams) this.tds.get(id);
    }

    public Noeud getFonctionOrProcedureParams(int id) {
        return this.tds.get(id);
    }

    public IType getType(int id) {
        return (IType) this.tds.get(id);
    }
}
