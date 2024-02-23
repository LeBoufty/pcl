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
    public void produire() {
         System.out.println(nom);
// TODO : déclaration, je sais pas s'il y a quelque chose à produire précisément, mais en tout cas faut y prendre en compte
    }
}
