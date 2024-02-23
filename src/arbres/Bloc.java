package arbres;

import java.util.ArrayList;

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

    public String produire() {
        String sortie = "";
        for (Noeud noeud : instructions) {
            sortie += noeud.produire();
        }
        return sortie;
    }
}
