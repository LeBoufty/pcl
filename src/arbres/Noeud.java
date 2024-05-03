package arbres;



import outils.TDS.TDS_gen;

public interface Noeud {

    public static boolean en_erreur = false;

    public String toString();
    public boolean valide();
    public String produire(TDS_gen tds_actuelle);
    public void TDS_creation(TDS_gen Parent, int variable_type); // Permet de créer les variables dans les TDS
    public void TDS_link(TDS_gen Parent); // Permet de lier les objets à leur TDS parent - à appeler après la création des TDS
    public void TDS_func_proc_creation(); // Permet de créer les fonctions et procédures dans les TDS - à appeler après le link des TDS
    public void TDS_variable(); // Permet de changer les variables en fonction des TDS - à appeler après le link des TDS
    public TDS_gen getTDS();
}
