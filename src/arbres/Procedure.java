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
            this.tds = new TDS_gen(this, nom);
        }
        else {
            this.tds = new TDS_gen(this, Parent, nom);
        }

        this.id = this.tds.num_reg;

        for (Noeud noeud : ((Bloc) definitions).instructions) {
            noeud.TDS_creation(this.tds, 2);
        }
        for (Noeud noeud : ((Bloc) instructions).instructions) {
            noeud.TDS_creation(this.tds, 2);
        }

        if (Parent == null) {
            this.TDS_link(null);
            TDS_variable();
        }
    }

    public String produire() {
        System.out.println("procedure "+nom+" is");
        
        String res = "";

        if (this.tds.get_num_reg() == 0) {
            GestionFichier.AddcontenuHeader(".global F"+ this.tds.get_num_reg() +"\n.extern printf // Import printf\n.section .data\n");
            GestionFichier.Addcontenu(".section .text\nF"+ this.tds.get_num_reg() +" :\n");
            GestionFichier.AddcontenuFooter("bl exit\n\nexit : //Fonction de sortie du programme \nmov x0,#0\nmov x8,#93\nsvc #0\nret\n");
            GestionFichier.AddcontenuFooter("\nget_global_var : ADD fp, fp, #8 // On passe à la variable suivante, x0 depl, x1 nb_saut\nSUBS x1, x1, #1 // On décrémente le nombre de saut\nBNE get_global_var // On boucle tant que x1 != 0\nLDR x0, [fp, x0] // On charge la valeur de la variable\nSUB sp,sp, #8 // On fait de la place dans la pile pour le retour\nSTR x0, [sp] // On met la valeur de la variable en pile\nRET\n");
            GestionFichier.AddcontenuFooter("set_global_var : ADD fp, fp, #8 // On passe à la variable suivante, x0 depl, x1 nb_saut\nSUBS x1, x1, #1 // On décrémente le nombre de saut\nBNE set_global_var // On boucle tant que x1 != 0\nSTR x2, [fp, x0] // On charge la valeur de la variable\nRET\n");
        } else {
            res += "F"+this.tds.get_num_reg() + " :\n";
            res += "STP LR, X11, [SP, #-16]! // Sauvegarde LR\n";
            res += "STP X10, XZR, [SP, #-16]! // Sauvegarde X10\n";
        }

        for (Noeud noeud : ((Bloc) definitions).instructions) {
            res += noeud.produire();
        }

        for (Noeud noeud : ((Bloc) instructions).instructions) {
            res += noeud.produire();
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

        for (Noeud noeud : ((Bloc) definitions).instructions) {
            noeud.TDS_link(this.tds);
        }
        for (Noeud noeud : ((Bloc) instructions).instructions) {
            noeud.TDS_link(this.tds);
        }
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
