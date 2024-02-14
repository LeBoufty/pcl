package arbres;

import outils.Logger;

public class Procedure implements Noeud {
    public String nom;
    public Noeud definitions;
    public Noeud instructions;
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
}
