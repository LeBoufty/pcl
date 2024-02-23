package arbres;

import java.util.ArrayList;
//import outils.GestionFichier;


public class Bloc implements Noeud {
    public ArrayList<Noeud> instructions;
    public void ajouterInstruction(Noeud instr) {
        instructions.add(instr);
    }
    public Bloc() {
        instructions = new ArrayList<>();
    }
    public Bloc(Noeud[] instr) {
        instructions = new ArrayList<>();
        for (Noeud noeud : instr) {
            ajouterInstruction(noeud);
        }
    }
    public String toString() {
        ArrayList<String> instructionsStrings = new ArrayList<>();
        for (Noeud noeud : instructions) {
            instructionsStrings.add(noeud.toString());
        }
        return String.join(" ", instructionsStrings);
    }
    public boolean valide() {
        boolean valide = true;
        for (Noeud noeud : instructions) {
            valide = valide && noeud.valide();
        }
        return valide;
    }

    public void produire() {
        System.err.println("Bloc");
        for (Noeud noeud : instructions) {
            noeud.produire();
        }
    }
}
