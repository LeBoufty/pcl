package arbres;


import outils.Error_list;
import outils.Logger;
import outils.TDS.TDS_gen;

public class InstructionFor implements Noeud {

    public int id;
    public static int id_for = 0;

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
        Boolean sortie = true;

        if (this.iterateur != null) {
            sortie = this.iterateur.valide() && sortie;
        }
        else {
            Logger.error("InstructionFor "+ this.toString() +" invalide : pas d'itérateur");
            sortie = false;
        }

        if (this.borneInf != null) {
            sortie = this.borneInf.valide() && sortie;
            if (is_iterateur_in_evaluable(this.borneInf)) {
                Logger.error("InstructionFor "+ this.tds.nom_fonction +" invalide : l'itérateur ne peut pas être dans la borne inférieure");
                sortie = false;
            }
        }
        else {
            Logger.error("InstructionFor "+ this.toString() +" invalide : pas de borne inférieure");
            sortie = false;
        }

        if (this.borneSup != null) {
            sortie = this.borneSup.valide() && sortie;
            if (is_iterateur_in_evaluable(this.borneSup)) {
                Logger.error("InstructionFor "+ this.tds.nom_fonction +" invalide : l'itérateur ne peut pas être dans la borne supérieure");
                sortie = false;
            }
        }
        else {
            Logger.error("InstructionFor "+ this.toString() +" invalide : pas de borne supérieure");
            sortie = false;
        }
        
        sortie = this.corps.valide() && sortie;
        if (is_iterateur_in_noeud_mod(this.corps)) {
            Logger.error("InstructionFor "+ this.tds.nom_fonction +" invalide : l'itérateur ne peut pas être modifié dans le corps de la boucle");
            sortie = false;
        }

        return sortie;
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
        String res = "";

        res += "// Gestion du chainage statique (oui un chainage statique dans un for)\n";
        res += "SUB sp, sp, #16 // Incrémentation du pointeur de pile\n";
        res += "STR x29, [sp] // Sauvegarde du chainage statique\n";
        res += "MOV x29, sp // Mise à jour du pointeur de pile\n";
        res += "MOV x27, x29 // Mise à jour du chainage statique\n";
        res += "SUB sp, sp, #48 // Déplacement du stack pointer pour fp, lr et l'itéareur\n";

        InstructionWhile whileLoop = new InstructionWhile();
        Affectation finDeBoucle = new Affectation();
        Affectation affectdepart;
        finDeBoucle.gauche = this.iterateur;
        if (reverse) {
            whileLoop.condition = new Operation(this.iterateur, borneInf, Operateur.SUPERIEUR_EGAL);
            finDeBoucle.droite = new Operation(this.iterateur, new Constante(1), Operateur.MOINS);
            affectdepart = new Affectation(this.iterateur, borneSup);
        } else {
            whileLoop.condition = new Operation(this.iterateur, borneSup, Operateur.INFERIEUR_EGAL);
            finDeBoucle.droite = new Operation(this.iterateur, new Constante(1), Operateur.PLUS);
            affectdepart = new Affectation(this.iterateur, borneInf);
        }
        
        whileLoop.TDS_link(this.tds);
        affectdepart.TDS_link(this.tds);
        finDeBoucle.TDS_link(this.tds);
        whileLoop.corps = this.corps;
        whileLoop.ajouterInstruction(finDeBoucle);
        res += affectdepart.produire(tds);
        res += "\n" + whileLoop.produire(tds);
        res += "ADD sp, sp, #48 // Décrémentation du pointeur de pile\n";
        res += "LDR x29, [sp] // Restauration du chainage statique\n";
        res += "ADD sp, sp, #16 // Le chainage statique ça dégage\n";
        return res;
    }

    public void TDS_creation(TDS_gen Parent, int type_variable) {

        this.tds = new TDS_gen(this, Parent, "for" + id_for++);
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
            Variable tmp = this.tds.get_Variable_string_and_parent(((Variable) this.corps).nom);
            if (tmp != null) {
                this.corps = tmp;
            }
            else {
                Logger.error("Variable "+ ((Variable) this.corps).nom +" non déclarée dans la TDS : "+tds.nom_fonction);
                Error_list.tdsgen = true;
            }
        } else {
            this.corps.TDS_variable();
        }

        if (this.borneInf instanceof Variable) {
            Variable tmp = this.tds.get_Variable_string_and_parent(((Variable) this.borneInf).nom);
            if (tmp != null) {
                this.borneInf = tmp;
            }
            else {
                Logger.error("Variable "+ ((Variable) this.borneInf).nom +" non déclarée dans la TDS : "+tds.nom_fonction);
                Error_list.tdsgen = true;
            }
        } else {
            this.borneInf.TDS_variable();
        }

        if (this.borneSup instanceof Variable) {
            Variable tmp = this.tds.get_Variable_string_and_parent(((Variable) this.borneSup).nom);
            if (tmp != null) {
                this.borneSup = tmp;
            }
            else {
                Logger.error("Variable "+ ((Variable) this.borneSup).nom +" non déclarée dans la TDS : "+tds.nom_fonction);
                Error_list.tdsgen = true;
            }
        } else {
            this.borneSup.TDS_variable();
        }
    }

    public void TDS_func_proc_creation() {
        // On ne fait rien car il n'y a pas de création de fonction ou procédure dans une boucle for
    }

    public void TDS_func_proc_change() {

        // Pour le corps de la boucle
        if (this.corps instanceof AppelFonction) {
            String nom = ((AppelFonction) this.corps).fonction.nom;
            this.corps = this.tds.get_new_Appel(nom, (AppelFonction) this.corps);
        }
        else if (this.corps instanceof AppelProcedure) {
            String nom = ((AppelProcedure) this.corps).procedure.nom;
            this.corps = this.tds.get_new_Appel(nom, (AppelProcedure) this.corps);
        }
        else {
            this.corps.TDS_func_proc_change();
        }

        // Pour la borne inférieure
        if (this.borneInf instanceof AppelFonction) {
            String nom = ((AppelFonction) this.borneInf).fonction.nom;
            borneInf = this.tds.get_new_Appel(nom, (AppelFonction) this.borneInf);
        }
        else if (this.borneInf instanceof AppelProcedure) {
            String nom = ((AppelProcedure) this.borneInf).procedure.nom;
            borneInf = this.tds.get_new_Appel(nom, (AppelProcedure) this.borneInf);
        }
        else {
            this.borneInf.TDS_func_proc_change();
        }

        // Pour la borne supérieure
        if (this.borneSup instanceof AppelFonction) {
            String nom = ((AppelFonction) this.borneSup).fonction.nom;
            borneSup = this.tds.get_new_Appel(nom, (AppelFonction) this.borneSup);
        }
        else if (this.borneSup instanceof AppelProcedure) {
            String nom = ((AppelProcedure) this.borneSup).procedure.nom;
            borneSup = this.tds.get_new_Appel(nom, (AppelProcedure) this.borneSup);
        }
        else {
            this.borneSup.TDS_func_proc_change();
        }

    }


    private boolean is_iterateur_in_evaluable(Evaluable e) {
        if (e instanceof Variable) {
            return ((Variable) e).identifiant == this.iterateur.identifiant;
        }
        else if (e instanceof Operation) {
            return is_iterateur_in_evaluable(((Operation) e).gauche) || is_iterateur_in_evaluable(((Operation) e).droite);
        }
        else if (e instanceof OperationUnaire) {
            return is_iterateur_in_evaluable(((OperationUnaire) e).droite);
        }
        else if (e instanceof AppelFonction) {
            for (Evaluable arg : ((AppelFonction) e).params) {
                if (is_iterateur_in_evaluable(arg)) {
                    return true;
                }
            }
            return false;
        }
        else if (e instanceof AppelProcedure) {
            for (Evaluable arg : ((AppelProcedure) e).params) {
                if (is_iterateur_in_evaluable(arg)) {
                    return true;
                }
            }
            return false;
        }
        else if (e instanceof Constante) {
            return false;
        }
        else {
            return false;
        }
    }

    // Vérifie si l'itérateur est modifié dans le noeud
    private boolean is_iterateur_in_noeud_mod(Noeud nd) {
        if (nd instanceof Evaluable) {
            return false;
        }
        
        else if (nd instanceof Affectation) {
            if (is_iterateur_in_evaluable(((Affectation) nd).gauche)) {
                return true;
            }
            // Pas besoin de vérifier la droite car la variable n'est pas modifiée
            return false;
        }

        else if (nd instanceof Bloc) {
            for (Noeud n : ((Bloc) nd).instructions) {
                if (is_iterateur_in_noeud_mod(n)) {
                    return true;
                }
            }
            return false;
        }

        else if (nd instanceof InstructionIf) {
            if (is_iterateur_in_noeud_mod(((InstructionIf) nd).alors)) {
                return true;
            }
            if (is_iterateur_in_noeud_mod(((InstructionIf) nd).sinon)) {
                return true;
            }
            return false;
        }
        
        else if (nd instanceof InstructionFor) {
            if (is_iterateur_in_noeud_mod(((InstructionFor) nd).corps)) {
                return true;
            }
            return false;
        }
        else if (nd instanceof InstructionWhile) {
            if (is_iterateur_in_noeud_mod(((InstructionWhile) nd).corps)) {
                return true;
            }
            return false;
        }
        
        return false;
    }
    
}
