package arbres;


import outils.Error_list;
import outils.GestionFichier;
import outils.Logger;
import outils.TDS.TDS_gen;

public class Procedure implements Noeud {

    public int id;

    public String nom;
    public Bloc definitions;
    public Bloc instructions;
    public TDS_gen tds = null;

    public Procedure(String nom, Noeud def, Noeud inst) {
        this.nom = nom;
        if (!(def instanceof Bloc)) this.definitions = new Bloc(new Noeud[] {def});
        else this.definitions = (Bloc) def;
        if (!(inst instanceof Bloc)) this.instructions = new Bloc(new Noeud[] {inst});
        else this.instructions = (Bloc) inst;
    }
    public Procedure(String nom) {
        this(nom, new Bloc(), new Bloc());
    }
    public String toString() {
        return "procedure "+nom+" is "+definitions.toString()+" begin "+instructions.toString()+" end "+nom+";";
    }
    public boolean valide() {
        boolean sortie = definitions.valide() && instructions.valide();
        if (!nom.matches("[a-zA-Z][a-zA-Z0-9_]*")) {
            Logger.error("Nom de procédure invalide : "+nom);
            sortie = false;
        }
        if(nom==null) {
            Logger.error("procédure invalide : pas de nom");
            sortie = false;
        }
        if(definitions==null) {
            Logger.error("procédure "+nom+" invalide : pas de définitions");
            sortie = false;
        }
        if(instructions==null) {
            Logger.error("procédure "+nom+" invalide : pas d'instructions");
            sortie = false;
        }
        return sortie;
    }

    public void ajouterDefinition(Noeud definition) {
        if (definition instanceof Bloc) {
            Bloc defbloc = (Bloc) definition;
            for (Noeud def : defbloc.instructions) {
                ajouterDefinition(def);
            }
        } else definitions.ajouterInstruction(definition);
    }

    public void ajouterInstruction(Noeud instruction) {
        if (instruction instanceof Bloc) {
            Bloc instrbloc = (Bloc) instruction;
            for (Noeud instr : instrbloc.instructions) {
                ajouterInstruction(instr);
            }
        } else instructions.ajouterInstruction(instruction);
    }


    public void TDS_creation(TDS_gen Parent, int type_variable) {
        if (Parent == null) {
            Logger.milestone("Début de la création des TDS");
            this.tds = new TDS_gen(this, nom);
            
        }
        else {
            this.tds = new TDS_gen(this, Parent, nom);
        }

        this.id = this.tds.num_reg;
        Logger.info("Création de la TDS de la procédure "+nom+" n°"+this.id);


        definitions.TDS_creation(this.tds, 2);
        instructions.TDS_creation(this.tds, 2);
        
        Logger.milestone("Fin de la création des TDS");
        if (Parent == null) {
            Logger.milestone("Début de la vérification des TDS");
            this.TDS_link(null);
            this.TDS_func_proc_creation();
            this.TDS_variable();
            this.TDS_func_proc_change();
            if (!this.tds.valide_et_enfants()) {
                Logger.error("TDS invalide");
                Error_list.tdsgen = true;
            }
            Logger.milestone("Fin de la vérification des TDS");
        }
    }

    public String produire(TDS_gen tds_actuelle) {
        System.out.println("procedure "+nom+" is");
        
        String res = "";

        GestionFichier.AddcontenuHeader(".global main\n.extern printf // Import printf\n.section .data\nformat_char :\n.string \"%c\\n\"\nformat :\n.string \"%d\\n\"\nerreur_division_msg :\n.string \"Erreur : division par zéro\\n\"\n");
        GestionFichier.Addcontenu(".section .text\nmain :\n");
        GestionFichier.Addcontenu("STP x29, lr, [sp, #-16] // Sauvegarde du pointeur de pile et du lien de retour\nMOV x29, sp // Mise à jour du pointeur de pile\nSTR x29, [sp]\nSUB sp, sp, #32 // Déplacement du stack pointer pour fp et lr\n");
        GestionFichier.AddcontenuFooter("B exit_program\n\nexit_program : //Fonction de sortie du programme \nmov x0,#0\nmov x8,#93\nsvc #0\nret\n");
        GestionFichier.AddcontenuFooter("get_global_var : LDR x28, [x28] // On saute de chainage statique, x0 depl, x1 nb_saut\nSUBS x1, x1, #1 // On décrémente le nombre de saut\nBNE get_global_var // On boucle tant que x1 != 0\nSUB x28, x28, x0 // On déplace le pointeur de la variable\nLDR x0, [x28] // On charge la valeur de la variable\nSUB sp,sp, #16 // On fait de la place dans la pile pour le retour\nSTR x0, [sp] // On met la valeur de la variable en pile\nRET\n");
        GestionFichier.AddcontenuFooter("set_global_var : LDR x28, [x28] // On saute de chainage statique, x0 depl, x1 nb_saut\nSUBS x1, x1, #1 // On décrémente le nombre de saut\nBNE set_global_var // On boucle tant que x1 != 0\nSUB x28, x28, x0 // On déplace le pointeur de la variable\nSTR x2, [x28] // On charge la valeur de la variable\nRET\n");
        GestionFichier.AddcontenuFooter("erreur_division : // Fonction d'erreur de division\nLDR x0, =erreur_division_msg // On charge le message d'erreur\nBL printf // On affiche le message d'erreur\nB exit_program // On quitte le programme\n");

        res += "// Définitions de la procédure "+nom+"\n";
        for (Noeud noeud : ((Bloc) definitions).instructions) {
            res += noeud.produire(tds)+"\n";
        }

        res += "// Instructions de la procédure "+nom+"\n";
        for (Noeud noeud : ((Bloc) instructions).instructions) {
            res += noeud.produire(tds)+"\n";
        }

        GestionFichier.Addcontenu(res);
        
        return "";
    }

    public void TDS_link(TDS_gen Parent) {

        definitions.TDS_link(this.tds);
        instructions.TDS_link(this.tds);
    }

    public TDS_gen getTDS() {
        return this.tds;
    }

    public Boolean Is_main() {
        // Check n° imbrication
        if (this.tds.num_imbr == 0) {
            return true;
        }
        return false;
    }

    public void TDS_variable() {
        definitions.TDS_variable();
        instructions.TDS_variable();
    }

    public void TDS_func_proc_creation() {
        // La procédure de base n'est pas a rajouter dans la TDS
        definitions.TDS_func_proc_creation();
        // instructions.TDS_func_proc_creation(); // On ne rajoute pas les instructions dans la TDS
    }

    public void TDS_func_proc_change() {
        definitions.TDS_func_proc_change();
        instructions.TDS_func_proc_change();
    }
}
