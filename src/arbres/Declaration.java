package arbres;

public class Declaration extends Instanciation {
    public Evaluable valeur;
    public Declaration(IType t, String nom) {super(t, nom); valeur=null;}
    public Declaration(IType t, String nom, Evaluable valeur) {type = t; this.nom = nom; this.valeur = valeur;}
}
