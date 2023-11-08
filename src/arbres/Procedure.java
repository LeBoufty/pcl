package arbres;

public class Procedure implements Noeud {
    public String nom;
    public Noeud definitions;
    public Noeud instructions;
    public Procedure(String nom, Noeud def, Noeud inst) {
        this.nom = nom;
        this.definitions = def;
        this.instructions = inst;
    }
    public String toString() {
        return "procedure "+nom+" is "+definitions.toString()+" begin "+instructions.toString()+" end "+nom+";";
    }
}
