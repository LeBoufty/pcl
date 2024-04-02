package arbres;

import java.util.HashMap;
import java.util.ArrayList;

import outils.Logger;
import outils.TDS.TDS_gen;

public class InstructionIf implements Noeud {
    public Evaluable condition;
    public Noeud alors;
    public Noeud sinon;
    public TDS_gen tds_parent = null;

    public InstructionIf(Evaluable cond, Noeud alors) {
        this.condition = cond;
        this.alors = alors;
        this.sinon = null;
    }
    public InstructionIf(Evaluable cond, Noeud alors, Noeud sinon) {
        this.condition = cond;
        this.alors = alors;
        this.sinon = sinon;
    }
    public InstructionIf() {
        this.alors = new Bloc();
        this.sinon = null;
    }
    public String toString() {
        String sortie = "if " + condition.toString() + " then ";
        sortie += alors.toString();
        if (this.sinon != null) {
            sortie += " else " + sinon.toString();
        }
        sortie += " end if";
        return sortie;
    }
    public boolean valide() {
        if(this.condition == null) {
            Logger.error("InstructionIf "+ this.toString() +" invalide : pas de condition");
            return false;
        }
        return condition.valide() && alors.valide() && (sinon == null || sinon.valide());
    }
    public void ajouterInstructionAlors(Noeud instruction) {
        if (this.alors instanceof Bloc) {
            ((Bloc) this.alors).ajouterInstruction(instruction);
        } else if (this.alors == null) {
            this.alors = instruction;
        } else {
            this.alors = new Bloc(new Noeud[] {this.alors, instruction});
        }
    }
    public void ajouterInstructionSinon(Noeud instruction) {
        if (this.sinon instanceof Bloc) {
            ((Bloc) this.sinon).ajouterInstruction(instruction);
        } else if (this.sinon == null) {
            this.sinon = instruction;
        } else {
            this.sinon = new Bloc(new Noeud[] {this.sinon, instruction});
        }
    }

    public String produire() {
        System.out.println("InstructionIf");

        return "";
// TODO : on l'a fait en ASM.
    }

    public void TDS_creation(TDS_gen Parent, int type_variable) {
        this.alors.TDS_creation(Parent, type_variable);
        if (this.sinon != null) {
            this.sinon.TDS_creation(Parent ,type_variable);
        }
    }

    public void TDS_link(TDS_gen Parent) {
        this.tds_parent = Parent;
        this.condition.TDS_link(Parent);
        this.alors.TDS_link(Parent);
        if (this.sinon != null) {
            this.sinon.TDS_link(Parent);
        }
    }

    public TDS_gen getTDS() {
        return this.tds_parent;
    }

    public void TDS_variable(HashMap<String, ArrayList<Integer>> variables) {
        this.condition.TDS_variable(variables);
        this.alors.TDS_variable(variables);
        if (this.sinon != null) {
            this.sinon.TDS_variable(variables);
        }
    }
}
