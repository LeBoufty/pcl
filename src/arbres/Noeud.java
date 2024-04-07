package arbres;



import outils.TDS.TDS_gen;

public interface Noeud {

    public static boolean en_erreur = false;

    public String toString();
    public boolean valide();
    public String produire();
    public void TDS_creation(TDS_gen Parent, int variable_type);
    public void TDS_link(TDS_gen Parent);
    public void TDS_variable();
    public TDS_gen getTDS();
}
