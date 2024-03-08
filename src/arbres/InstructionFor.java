package arbres;

import outils.Logger;
import outils.TDS.TDS_gen;

public class InstructionFor implements Noeud {
    public Variable iterateur;
    public boolean reverse;
    public Evaluable borneInf;
    public Evaluable borneSup;
    public Noeud corps;
    public TDS_gen tds = null;
    public int id_tds = -1;

    public InstructionFor(Variable iterateur, boolean reverse, Evaluable borneInf, Evaluable borneSup, Noeud corps) {
        this.iterateur = iterateur;
        this.reverse = reverse;
        this.borneInf = borneInf;
        this.borneSup = borneSup;
        this.corps = corps;
    }
    public InstructionFor() {
        this.reverse = false;
        this.corps = new Bloc();
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
    public boolean valide() {
        if(this.iterateur == null) {
            Logger.error("InstructionFor "+ this.toString() +" invalide : pas d'itérateur");
            return false;
        }
        if(this.borneInf == null) {
            Logger.error("InstructionFor "+ this.toString() +" invalide : pas de borne inférieure");
            return false;
        }
        if(this.borneSup == null) {
            Logger.error("InstructionFor "+ this.toString() +" invalide : pas de borne supérieure");
            return false;
        }
        return this.iterateur.valide() && this.borneInf.valide() && this.borneSup.valide() && this.corps.valide();
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
         System.out.println("InstructionFor");

         return "";
// TODO : apparemment c'est dans le cours ? i foror 💀
    }

    public void TDS_creation(TDS_gen Parent) {
        this.tds = new TDS_gen(this, Parent, "for");
        this.id_tds = this.tds.id_tds;
        
        // Ajouter l'itérateur à la TDS
        this.tds.add_variable(iterateur.identifiant, 0, 0);

        // this.iterateur.TDS_creation(this.TDS);
        // this.borneInf.TDS_creation(this.TDS); // Ne rien faire pour les bornes
        // this.borneSup.TDS_creation(this.TDS); // Ne rien faire pour les bornes
        this.corps.TDS_creation(this.tds);
    }

    public TDS_gen getTDS() {
        return this.tds;
    }
}
