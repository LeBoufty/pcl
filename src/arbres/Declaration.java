package arbres;

public class Declaration extends Instanciation {
    public Evaluable valeur;
    public Declaration(IType t, String nom) {super(t, nom); valeur=null;}
    public Declaration(IType t, String nom, Evaluable valeur) {super(t, nom); this.valeur = valeur;}

    @Override
    public String produire() {
        System.out.println(nom + " type declaration : " + type);
        System.out.println(nom + " id declaration : " + variable.identifiant);
        System.out.println(nom + " valeur declaration : " + valeur);
        
        String res = "";
    
        int depl = this.tds_parent.get_index(variable.identifiant);
        // ?int num_imbr_ici = this.tds_parent.get_num_imbr();
        // ?int num_imbr_var = this.tds_parent.search_imbrication_TDS(variable.identifiant);
    
        if (variable.isConstant()) {
            // On affecte la valeur de la variable en pile
            res += "MOV x0, " + variable.produire() + " // On met la constante dans x0 \n";
            res += "SUB sp, sp, #16 // On alloue de la place pour la variable \n";
            res += "STR x0, [x29, #" + depl + "] // On stocke la valeur de la constante \n";
        } else {
            variable.produire();
    
            res += "SUB sp, sp, #16 // On alloue de la place pour la variable \n";
            res += "STR x0, [x29, #" + depl + "] // On stocke la valeur de la variable \n";
        }
    
        return res;
        }
}
