package arbres;

import java.util.ArrayList;
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
            noeud.produire(tds_parent);
        }
        return "";
    }

    public String produire(TDS_gen tds_actuelle){
        String res = "";
        for (Noeud noeud : instructions) {
            res += noeud.produire(tds_actuelle);
        }
        return res;
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

    public void TDS_variable() {

        for (int i = 0; i < instructions.size(); i++) {
            if (instructions.get(i) instanceof Variable) {
                instructions.set(i, tds_parent.get_Variable_string_and_parent(((Variable) instructions.get(i)).nom));
            }
            else {
                instructions.get(i).TDS_variable();
            }
        }
    }

    public void TDS_func_proc_creation() {
        for (Noeud noeud : instructions) {
            noeud.TDS_func_proc_creation();
        }
    }

    public void TDS_func_proc_change() {
        
        for (int i = 0; i < instructions.size(); i++) {
            if (instructions.get(i) instanceof AppelFonction) {
                String nom = ((AppelFonction) instructions.get(i)).fonction.nom;
                instructions.set(i, tds_parent.get_new_Appel(nom, (AppelFonction) instructions.get(i)));
            }
            else if (instructions.get(i) instanceof AppelProcedure) {
                String nom = ((AppelProcedure) instructions.get(i)).procedure.nom;
                instructions.set(i, tds_parent.get_new_Appel(nom, (AppelProcedure) instructions.get(i)));
            }
            else {
                instructions.get(i).TDS_func_proc_change();
            }
        }
    }
}
