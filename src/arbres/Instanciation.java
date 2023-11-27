package arbres;

public class Instanciation implements Noeud {
    public Type type;
    public Variable variable;
    public String nom;
    public Instanciation(Type t) {type = t; variable = new Variable(t); nom = Repertoire.createID(this);}
    public Instanciation(Type t, String nom) {type = t; variable = new Variable(t, nom); this.nom = nom;}
    public String toString() {
        return variable.toString() + " : " + type.toString() + ";";
    }
    public boolean valide() {
        return true;
    }
}
