package arbres;

public class Instanciation implements Noeud {
    public Type type;
    public Variable variable;
    public Instanciation(Type t) {type = t; variable = new Variable(t);}
    public String toString() {
        return variable.toString() + " : " + type.toString() + ";";
    }
    public boolean valide() {
        return true;
    }
}
