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

    public String produire(TDS_gen tds_actuelle) {
        String whileid = ""+this.hashCode();
        String res = "// while "+whileid+"\n";
        res += "while"+whileid+" :\n";
        res += this.condition.produire(tds_actuelle);
        res += "LDR x0, [sp] // Chargement de la condition\n";
        res += "ADD sp, sp, #16 // Dépilement de la condition\n";
        res += "CMP x0, #0\n";
        res += "\n";
        res += "BNE whilecontinue"+whileid+"\n";
        res += "B whileend"+whileid+"\n";
        res += "whilecontinue"+whileid+" :\n";
        res += this.corps.produire(tds_actuelle);
        res += "B while"+whileid+"\n";
        res += "whileend"+whileid+" :\n";
        return res;
    }

    public void TDS_creation(TDS_gen Parent, int type_variable) {
        this.corps.TDS_creation(Parent, type_variable);
    }

    public void TDS_link(TDS_gen Parent) {
        this.tds_parent = Parent;
        this.condition.TDS_link(Parent);
        this.corps.TDS_link(Parent);
    }

    public TDS_gen getTDS() {
        return this.tds_parent;
    }

    public void TDS_variable() {
        
        if (this.condition instanceof Variable) {
            condition = tds_parent.get_Variable_string_and_parent(((Variable) condition).nom);
        }
        else {
            condition.TDS_variable();
        }

        if (this.corps instanceof Variable) {
            corps = tds_parent.get_Variable_string_and_parent(((Variable) corps).nom);
        } else {
            this.corps.TDS_variable();
        }
    }

    public void TDS_func_proc_creation() {
        // On ne fait rien car il n'y a pas de fonction ou procédure dans un while
    }

    public void TDS_func_proc_change() {
        // On fait le cas de la condition
        if (this.condition instanceof AppelFonction) {
            String nom = ((AppelFonction) this.condition).fonction.nom;
            this.condition = tds_parent.get_new_Appel(nom, condition);
        }
        else if (this.condition instanceof AppelProcedure) {
            String nom = ((AppelProcedure) this.condition).procedure.nom;
            this.condition = tds_parent.get_new_Appel(nom, condition);
        }
        else {
            this.condition.TDS_func_proc_change();
        }

        // On fait le cas du corps
        if (this.corps instanceof AppelFonction) {
            String nom = ((AppelFonction) this.corps).fonction.nom;
            this.corps = tds_parent.get_new_Appel(nom, (AppelFonction) this.corps);
        }
        else if (this.corps instanceof AppelProcedure) {
            String nom = ((AppelProcedure) this.corps).procedure.nom;
            this.corps = tds_parent.get_new_Appel(nom, (AppelProcedure) this.corps);
        }
        else {
            this.corps.TDS_func_proc_change();
        }


    }
}