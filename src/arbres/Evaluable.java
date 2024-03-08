package arbres;

import outils.TDS.TDS_gen;

public abstract class Evaluable implements Noeud {
    protected IType type;
    public Evaluable() {
    }
    public IType getType() {
        return this.type;
    }

    public boolean isConstant() {
        return false;
    }

    public TDS_gen getTDS() {
        return null;
    }
}
