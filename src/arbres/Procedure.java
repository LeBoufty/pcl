package arbres;


import outils.GestionFichier;
import outils.Logger;
import outils.TDS.TDS_gen;

public class Procedure implements Noeud {

    public int id;

    public String nom;
    public Noeud definitions;
    public Noeud instructions;
    public TDS_gen tds = null;

    public Procedure(String nom, Noeud def, Noeud inst) {
        this.nom = nom;
        this.definitions = def;
        this.instructions = inst;
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
        if (this.definitions instanceof Bloc) {
            ((Bloc) this.definitions).ajouterInstruction(definition);
        } else if (this.definitions == null) {
            this.definitions = definition;
        } else {
            this.definitions = new Bloc(new Noeud[] {this.definitions, definition});
        }
    }
    public void ajouterInstruction(Noeud instruction) {
        if (this.instructions instanceof Bloc) {
            ((Bloc) this.instructions).ajouterInstruction(instruction);
        } else if (this.instructions == null) {
            this.instructions = instruction;
        } else {
            this.instructions = new Bloc(new Noeud[] {this.instructions, instruction});
        }
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
            this.TDS_variable();
            if (!this.tds.valide_et_enfants()) {
                Logger.error("TDS invalide - Arrêt du programme");
                System.exit(1);
            }
            Logger.milestone("Fin de la vérification des TDS");
        }
    }

    public String produire(TDS_gen tds_actuelle) {
        System.out.println("procedure "+nom+" is");
        
        String res = "";

        if (this.tds.get_num_reg() == 0) {
            GestionFichier.AddcontenuHeader(".global main\n.extern printf // Import printf\n.section .data\nformat :\n.string \"%d\\n\"\nerreur_division_msg :\n.string \"Erreur : division par zéro\\n\"\n");
            GestionFichier.Addcontenu(".section .text\nmain :\n");
            GestionFichier.Addcontenu("STP x29, lr, [sp, #-16] // Sauvegarde du pointeur de pile et du lien de retour\nMOV x29, sp // Mise à jour du pointeur de pile\nSUB sp, sp, #32 // Déplacement du stack pointer pour fp et lr\n");
            GestionFichier.AddcontenuFooter("bl exit_program\n\nexit_program : //Fonction de sortie du programme \nmov x0,#0\nmov x8,#93\nsvc #0\nret\n");
            GestionFichier.AddcontenuFooter("\nget_global_var : ADD x29, x29, #16 // On passe à la variable suivante, x0 depl, x1 nb_saut\nSUBS x1, x1, #1 // On décrémente le nombre de saut\nBNE get_global_var // On boucle tant que x1 != 0\nLDR x0, [x29, x0] // On charge la valeur de la variable\nSUB sp,sp, #16 // On fait de la place dans la pile pour le retour\nSTR x0, [sp] // On met la valeur de la variable en pile\nRET\n");
            GestionFichier.AddcontenuFooter("set_global_var : ADD x29, x29, #16 // On passe à la variable suivante, x0 depl, x1 nb_saut\nSUBS x1, x1, #1 // On décrémente le nombre de saut\nBNE set_global_var // On boucle tant que x1 != 0\nSTR x2, [x29, x0] // On charge la valeur de la variable\nRET\n");
            GestionFichier.AddcontenuFooter("erreur_division : // Fonction d'erreur de division\nLDR x0, =erreur_division_msg // On charge le message d'erreur\nBL printf // On affiche le message d'erreur\nBL exit_program // On quitte le programme\n");
        } else {
            res += "F"+this.tds.get_num_reg() + " :\n";
            res += "SUB sp, sp, #16 // On décrémente le pointeur de pile\nSTR x29, [sp] // Sauvegarde du pointeur de pile statique\nSUB sp, sp, #16 // On décrémente le pointeur de pile dynamique\nSTR x29, [sp] // Sauvegarde du pointeur de pile\nSUB sp, sp, #16 // On décrémente le pointeur de pile\nSTR lr, [sp] // Sauvegarde du lien de retour\n";
        }

        for (Noeud noeud : ((Bloc) definitions).instructions) {
            res += noeud.produire(tds)+"\n";
        }
        res += "// Instructions de la procédure "+nom+"\n";
        for (Noeud noeud : ((Bloc) instructions).instructions) {
            res += noeud.produire(tds)+"\n";
        }

        if (this.tds.num_reg == 0) {
            GestionFichier.Addcontenu(res);
        }
        else {
            GestionFichier.AddcontenuHeader(res);
        }
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

        if (instructions instanceof Variable) {
            instructions = tds.get_Variable_string_and_parent(((Variable) instructions).nom);
        } else {
            instructions.TDS_variable();
        }
    }
}
