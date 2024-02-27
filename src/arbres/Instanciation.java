package arbres;

public abstract class Instanciation implements Noeud {
    public IType type;
    public Variable variable;
    public String nom;
    public Instanciation(IType t) {type = t; variable = new Variable(t);}
    public Instanciation(IType t, String nom) {type = t; variable = new Variable(t, nom); this.nom = nom;}
    public Instanciation() {type = Type.NULLTYPE; variable = new Variable(Type.NULLTYPE);}
    public String toString() {
        return variable.toString() + " : " + type.toString() + ";";
    }
    public boolean valide() {
        return true;
    }
    public String produire() {
    System.out.println(nom + " declaration : " + type);
    System.out.println(nom + " declaration : " + variable);
    
    return "";
// TODO : Mettre dans la tds ou la pile
    }
}
