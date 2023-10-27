package arbres;

public class InstructionIf implements Noeud {
    public Evaluable condition;
    public Noeud alors;
    public Noeud sinon;
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
    public String toString() {
        String sortie = "if (" + condition.toString() + ") ";
        sortie += alors.toString();
        if (this.sinon != null) {
            sortie += " else " + sinon.toString();
        }
        return sortie;
    }
}
