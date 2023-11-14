package arbres;

public class InstructionFor implements Noeud {
    public Variable iterateur;
    public boolean reverse;
    public Evaluable borneInf;
    public Evaluable borneSup;
    public Noeud corps;
    public InstructionFor(Variable iterateur, boolean reverse, Evaluable borneInf, Evaluable borneSup, Noeud corps) {
        this.iterateur = iterateur;
        this.reverse = reverse;
        this.borneInf = borneInf;
        this.borneSup = borneSup;
        this.corps = corps;
    }
    public String toString() {
        String sortie = "for " + this.iterateur.toString() + " in ";
        if (this.reverse) {
            sortie += "reverse ";
        }
        sortie += this.borneInf.toString() + ".." + this.borneSup.toString() + " loop ";
        sortie += this.corps.toString();
        sortie += " end loop";
        return sortie;
    }
}
