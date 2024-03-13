package arbres;

import outils.Logger;
import outils.TDS.TDS_gen;

public class InstructionWhile implements Noeud {
    public Evaluable condition;
    public Noeud corps;
    public TDS_gen tds_parent = null;

    public InstructionWhile(Evaluable cond, Noeud corps) {
        this.condition = cond;
        this.corps = corps;
    }
    public InstructionWhile() {
        this.corps = new Bloc();
    }
    public String toString() {
        String sortie = "while " + condition.toString() + " loop ";
        sortie += corps.toString();
        sortie += " end loop";
        return sortie;
    }
    public boolean valide() {
        if(this.condition == null) {
            Logger.error("InstructionWhile "+ this.toString() +" invalide : pas de condition");
            return false;
        }
        return condition.valide() && corps.valide();
    }
    public void ajouterInstruction(Noeud instruction) {
        if (this.corps instanceof Bloc) {
            ((Bloc) this.corps).ajouterInstruction(instruction);
        } else if (this.corps == null) {
            this.corps = instruction;
        } else {
            this.corps = new Bloc(new Noeud[] {this.corps, instruction});
        }
    }

    public String produire() {
        System.out.println("InstructionWhile");

        return "";
// TODO : probablement à mi-chemin entre for et if
    }

    public void TDS_creation(TDS_gen Parent) {
        this.tds_parent = Parent;
        this.condition.TDS_creation(Parent);
        this.corps.TDS_creation(Parent);
    }

    public TDS_gen getTDS() {
        return null;
    }
}