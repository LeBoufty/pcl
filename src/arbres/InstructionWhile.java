package arbres;

public class InstructionWhile implements Noeud {
    public Evaluable condition;
    public Noeud corps;
    public InstructionWhile(Evaluable cond, Noeud corps) {
        this.condition = cond;
        this.corps = corps;
    }
    public String toString() {
        String sortie = "while " + condition.toString() + " loop ";
        sortie += corps.toString();
        sortie += " end loop";
        return sortie;
    }
    public boolean valide() {
        return condition.valide() && corps.valide();
    }
}