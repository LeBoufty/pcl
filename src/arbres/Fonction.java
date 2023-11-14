package arbres;

import java.util.ArrayList;

public class Fonction implements Noeud {
    public String nom;
    public Type type;
    public ArrayList<Instanciation> params;
    public Noeud definitions;
    public Noeud instructions;
    public Fonction(String nom, Instanciation[] parametres, Type t, Noeud def, Noeud inst) {
        this.nom = nom;
        this.type = t;
        this.definitions = def;
        this.instructions = inst;
        this.params = new ArrayList<>();
        for (Instanciation p : parametres) {
            this.params.add(p);
        }
    }
    public String toString() {
        String sortie = "function " + this.nom + "(";
        ArrayList<String> paramStrings = new ArrayList<>();
        for (Instanciation p : params) {
            paramStrings.add(p.toString());
        }
        sortie += String.join(" ", paramStrings);
        sortie += ") return " + this.type.toString() + " is ";
        sortie += definitions.toString() + " begin ";
        sortie += instructions.toString() + " end " + this.nom +";";
        return sortie;
    }
    public boolean valide() {
        boolean valide = true;
        for (Instanciation p : params) {
            valide = valide && p.valide();
        }
        return valide && definitions.valide() && instructions.valide();
    }
}
