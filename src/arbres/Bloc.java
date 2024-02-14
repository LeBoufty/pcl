package arbres;

import java.util.ArrayList;

import outils.Logger;

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
        //ajout de la condition pour que le bloc soit valide si il n'y a pas d'instructions
        if(instructions.size() == 0) {
            valide = false;
            Logger.error("Bloc "+ this.toString() +" invalide : le bloc est vide");
        }
        return valide;
    }
}
