package arbres;

import java.util.ArrayList;
import java.util.HashMap;
import outils.TDS.TDS_gen;
//import outils.GestionFichier;


public class Bloc implements Noeud {
    public ArrayList<Noeud> instructions;
    public TDS_gen tds_parent = null;

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
        System.err.println("Bloc");
        for (Noeud noeud : instructions) {
            noeud.produire();
        }
        return "";
    }

    public void TDS_creation(TDS_gen Parent, int variable_type) {
        for (Noeud noeud : instructions) {
            noeud.TDS_creation(Parent, variable_type);
        }
    }

    public void TDS_link(TDS_gen Parent) {
        this.tds_parent = Parent;
        for (Noeud noeud : instructions) {
            noeud.TDS_link(Parent);
        }
    }

    public TDS_gen getTDS() {
        return this.tds_parent;
    }

    public void TDS_variable(HashMap<Integer, String> variables) {
        for (Noeud noeud : instructions) {
            noeud.TDS_variable(variables);
        }
    }
}
