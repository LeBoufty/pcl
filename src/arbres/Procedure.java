package arbres;

import outils.GestionFichier;
import outils.Logger;
import outils.TDS.TDS_gen;

public class Procedure implements Noeud {
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

    public String produire() {
        System.out.println("procedure "+nom+" is");
        System.out.println(nom);
    // TODO : soit c'est comme une fonction, soit on considère ça comme le fichier.

        return "";
    }

    public void TDS_creation(){
        this.tds = new TDS_gen(this, nom);
        for (Noeud noeud : ((Bloc) definitions).instructions) {
            noeud.TDS_creation(this.tds);
        }
        for (Noeud noeud : ((Bloc) instructions).instructions) {
            noeud.TDS_creation(this.tds);
        }
    }

    public void TDS_creation(TDS_gen Parent) {
        if (Parent == null) {
            this.TDS_creation();
            return;
        }

        this.tds = new TDS_gen(this, Parent, nom);
    }

    public String produire(String nomFichier) {
        System.out.println("Main : "+nomFichier);
        GestionFichier.AddcontenuHeader(".global "+ nomFichier + "\n.extern printf\n.section .data\n");
        GestionFichier.Addcontenu(".section .text\n"+nomFichier+":\n");
        GestionFichier.AddcontenuFooter("bl exit\n\nexit:\nmov x0,#0\nmov x8,#93\nsvc #0\nret\n");


        for (Noeud noeud : ((Bloc) definitions).instructions) {
            noeud.produire();
        }

        for (Noeud noeud : ((Bloc) instructions).instructions) {
            noeud.produire();
        }

        return "";
    } 

    public TDS_gen getTDS() {
        return this.tds;
    }
}
