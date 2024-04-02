package arbres;

import java.util.HashMap;
import java.util.ArrayList;

import outils.TDS.TDS_gen;

public interface Noeud {
    public String toString();
    public boolean valide();
    public String produire();
    public void TDS_creation(TDS_gen Parent, int variable_type);
    public void TDS_link(TDS_gen Parent);
    public void TDS_variable(HashMap<String, ArrayList<Integer>> variables);
    public TDS_gen getTDS();
}
