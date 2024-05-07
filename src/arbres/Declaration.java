package arbres;

import outils.Error_list;
import outils.Logger;
import outils.TDS.TDS_gen;

public class Declaration extends Instanciation {
    public Evaluable valeur;
    public Declaration(IType t, String nom) {super(t, nom); valeur=null;}
    public Declaration(IType t, String nom, Evaluable valeur) {super(t, nom); this.valeur = valeur;}

    @Override
    public String produire(TDS_gen tds_actuelle) {
        System.out.println(nom + " type declaration : " + type);
        System.out.println(nom + " id declaration : " + variable.identifiant);
        System.out.println(nom + " valeur declaration : " + valeur);
        
        String res = "// Declaration de la variable " + nom + "\n";
    
        if (valeur != null) {
            res += valeur.produire(tds_parent); // Le résultat est en sommet de pile 
        }
        else {
            res += "SUB sp, sp, #16 // Allocation de 16 octets pour la variable " + nom + "\n";
        }
    
        return res;
        }

    @Override
    public void TDS_variable() {

        if (valeur instanceof Variable) {
            Variable tmp = this.tds_parent.get_Variable_string_and_parent(((Variable) valeur).nom);
            if (tmp != null) {
                valeur = tmp;
            }
            else {
                Logger.error("Variable "+((Variable) valeur).nom+" non déclarée dans la TDS : "+tds_parent.nom_fonction);
                Error_list.tdsgen = true;
            }
        }
        else if (valeur != null){
            valeur.TDS_variable();
        }
    }

    @Override
    public void TDS_link(TDS_gen Parent) {
        this.tds_parent = Parent;
        variable.TDS_link(Parent);
        if (valeur != null) valeur.TDS_link(Parent);
    }

    @Override
    public void TDS_func_proc_change() {
        if (valeur == null) return;

        if (valeur instanceof AppelFonction) {
            String nom = ((AppelFonction) valeur).fonction.nom;
            valeur = this.tds_parent.get_new_Appel(nom, valeur);
        }
        else if (valeur instanceof AppelProcedure) {
            String nom = ((AppelProcedure) valeur).procedure.nom;
            valeur = this.tds_parent.get_new_Appel(nom, valeur);
        }
        else {
            valeur.TDS_func_proc_change();
        }
    }
}
