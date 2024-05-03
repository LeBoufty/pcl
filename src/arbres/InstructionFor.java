package arbres;


import outils.Logger;
import outils.TDS.TDS_gen;

public class InstructionFor implements Noeud {

    public int id;

    public Variable iterateur;
    public boolean reverse;
    public Evaluable borneInf;
    public Evaluable borneSup;
    public Noeud corps;
    public TDS_gen tds = null;

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

    public String produire(TDS_gen tds_actuelle) {
         System.out.println("InstructionFor");

         return "";
// TODO : apparemment c'est dans le cours ? i foror 💀
    }

    public void TDS_creation(TDS_gen Parent, int type_variable) {

        this.tds = new TDS_gen(this, Parent, "for");
        this.id = this.tds.get_num_reg();
        Logger.info("Création de la TDS de la boucle for n°" + this.id);
        
        // Ajouter l'itérateur à la TDS
        this.tds.add_variable(this.iterateur, 1);

        // this.iterateur.TDS_creation(this.tds);
        // this.borneInf.TDS_creation(this.tds);
        // this.borneSup.TDS_creation(this.tds);
        this.corps.TDS_creation(this.tds, type_variable);
    }

    public void TDS_link(TDS_gen Parent) {
        this.iterateur.TDS_link(this.tds);
        this.borneInf.TDS_link(this.tds);
        this.borneSup.TDS_link(this.tds);
        this.corps.TDS_link(this.tds);
    }

    public TDS_gen getTDS() {
        return this.tds;
    }

    public void TDS_variable() {
        // this.iterateur.TDS_variable(variables); // On ne change pas l'identifiant de l'itérateur
        if (this.corps instanceof Variable) {
            this.corps = this.tds.get_Variable_string_and_parent(((Variable) this.corps).nom);
        } else {
            this.corps.TDS_variable();
        }

        if (this.borneInf instanceof Variable) {
            borneInf = this.tds.get_Variable_string_and_parent(((Variable) borneInf).nom);
        } else {
            this.borneInf.TDS_variable();
        }

        if (this.borneSup instanceof Variable) {
            borneSup = this.tds.get_Variable_string_and_parent(((Variable) borneSup).nom);
        } else {
            this.borneSup.TDS_variable();
        }
    }

    public void TDS_func_proc_creation() {
        // On ne fait rien car il n'y a pas de création de fonction ou procédure dans une boucle for
    }
}
