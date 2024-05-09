package arbres;

import outils.Error_list;
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
        Boolean sortie = true;

        if(this.condition != null) {
            sortie = this.condition.valide();
        }
        else {
            Logger.error("InstructionIf "+ this.toString() +" invalide : pas de condition");
            sortie = false;
        }

        if(this.alors != null) {
            sortie = this.alors.valide() && sortie;
        }
        else {
            Logger.error("InstructionIf "+ this.toString() +" invalide : pas de alors");
            sortie = false;
        }

        if(this.sinon != null) {
            sortie = this.sinon.valide() && sortie;
        }

        return sortie;
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

    public String produire(TDS_gen tds_actuelle) {
        String ifid = this.hashCode() + "";
        String res = "// if "+ifid+"\n";
        res += this.condition.produire(tds_parent);
        res += "LDR x0, [sp] // Chargement de la condition\n";
        res += "ADD sp, sp, #16 // Décrémentation du pointeur de pile\n";
        System.out.println("InstructionIf");
        res += "CMP x0, #0 // Comparaison de la condition\n";
        res += "BNE then"+ifid+" // Branchement si la condition est vraie\n";
        if (this.sinon != null) {
            res += this.sinon.produire(tds_parent);
        }
        res += "B end"+ifid+" // Branchement à la fin du if\n";
        res += "then"+ifid+" :\n";
        res += this.alors.produire(tds_parent);
        res += "end"+ifid+" :\n";

        return res;
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

    public void TDS_variable() {
        if (this.condition instanceof Variable) {
            Variable tmp = tds_parent.get_Variable_string_and_parent(((Variable) this.condition).nom);
            if (tmp != null) {
                this.condition = tmp;
            }
            else {
                Logger.error("Variable "+ ((Variable) this.condition).nom +" non déclarée dans la TDS : "+tds_parent.nom_fonction);
                Error_list.tdsgen = true;
            }

        }
        else {
            condition.TDS_variable();
        }

        if (this.alors instanceof Variable) {
            Variable tmp = tds_parent.get_Variable_string_and_parent(((Variable) this.alors).nom);
            if (tmp != null) {
                this.alors = tmp;
            }
            else {
                Logger.error("Variable "+ ((Variable) this.alors).nom +" non déclarée dans la TDS : "+tds_parent.nom_fonction);
                Error_list.tdsgen = true;
            }
        }
        else {
            alors.TDS_variable();
        }

        if (this.sinon != null && this.sinon instanceof Variable) {
            Variable tmp = tds_parent.get_Variable_string_and_parent(((Variable) this.sinon).nom);
            if (tmp != null) {
                this.sinon = tmp;
            }
            else {
                Logger.error("Variable "+ ((Variable) this.sinon).nom +" non déclarée dans la TDS : "+tds_parent.nom_fonction);
                Error_list.tdsgen = true;
            }
        }
        else if (this.sinon != null) {
            sinon.TDS_variable();
        }
    }

    public void TDS_func_proc_creation() {
        // On ne fait rien car il n'y a pas de création de fonction ou procédure dans un if
    }

    public void TDS_func_proc_change() {
        // Cas pour la pour la condition
        if (this.condition instanceof AppelFonction) {
            String nom = ((AppelFonction) this.condition).fonction.nom;
            this.condition = this.tds_parent.get_new_Appel(nom, (AppelFonction) this.condition);
        }
        else if (this.condition instanceof AppelProcedure) {
            String nom = ((AppelProcedure) this.condition).procedure.nom;
            this.condition = this.tds_parent.get_new_Appel(nom, (AppelProcedure) this.condition);
        }
        else {
            this.condition.TDS_func_proc_change();
        }

        // Cas pour le alors du if
        if (this.alors instanceof AppelFonction) {
            String nom = ((AppelFonction) this.alors).fonction.nom;
            this.alors = this.tds_parent.get_new_Appel(nom, (AppelFonction) this.alors);
        }
        else if (this.alors instanceof AppelProcedure) {
            String nom = ((AppelProcedure) this.alors).procedure.nom;
            this.alors = this.tds_parent.get_new_Appel(nom, (AppelProcedure) this.alors);
        }
        else {
            this.alors.TDS_func_proc_change();
        }

        // Cas pour le sinon du if
        if (this.sinon != null && this.sinon instanceof AppelFonction) {
            String nom = ((AppelFonction) this.sinon).fonction.nom;
            this.sinon = this.tds_parent.get_new_Appel(nom, (AppelFonction) this.sinon);
        }
        else if (this.sinon != null && this.sinon instanceof AppelProcedure) {
            String nom = ((AppelProcedure) this.sinon).procedure.nom;
            this.sinon = this.tds_parent.get_new_Appel(nom, (AppelProcedure) this.sinon);
        }
        else if (this.sinon != null) {
            this.sinon.TDS_func_proc_change();
        }
    }
}
