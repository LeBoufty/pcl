package arbres;

import java.util.ArrayList;

import outils.Logger;
import outils.GestionFichier;
import outils.TDS.TDS_gen;

public class ProcedureParams implements Noeud {
    
    public int id;

    public String nom;
    public ArrayList<Parametre> params;
    public Noeud definitions;
    public Noeud instructions;
    public TDS_gen tds = null;

    public ProcedureParams(String nom, Parametre[] parametres, Noeud def, Noeud inst) {
        this.nom = nom;
        this.definitions = def;
        this.instructions = inst;
        this.params = new ArrayList<>();
        for (Parametre p : parametres) {
            this.params.add(p);
        }
    }
    public ProcedureParams(String nom, Parametre[] parametres) {
        this(nom, parametres, new Bloc(), new Bloc());
    }
    public ProcedureParams(String nom) {
        this(nom, new Parametre[] {}, new Bloc(), new Bloc());
    }
    public String toString() {
        String sortie = "procedure " + this.nom + "(";
        ArrayList<String> paramStrings = new ArrayList<>();
        for (Parametre p : params) {
            paramStrings.add(p.toString());
        }
        sortie += String.join(" ", paramStrings);
        sortie += ") is ";
        sortie += definitions.toString() + " begin ";
        sortie += instructions.toString() + " end " + this.nom +";";
        return sortie;
    }
    public boolean valide() {
        boolean sortie = true;
        for (Instanciation p : params) {
            sortie = sortie && p.valide();
        }
        if (!nom.matches("[a-zA-Z][a-zA-Z0-9_]*")) {
            Logger.error("Nom de procédure invalide : "+nom);
            sortie = false;
        }
        // if (!(instructions instanceof Bloc) && !(instructions instanceof Return)) {
        //     Logger.error("La fonction "+ nom +" doit se terminer par un return");
        //     sortie = false;
        // } else if (instructions instanceof Bloc) {
        //     Bloc instrbloc = (Bloc) instructions;
        //     if (!(instrbloc.instructions.get(instrbloc.instructions.size()-1) instanceof Return)) {
        //         Logger.error("La fonction "+ nom +" doit se terminer par un return");
        //         sortie = false;
        //     }

        // }
        return sortie && definitions.valide() && instructions.valide();
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

    public String produire(TDS_gen tds_actuelle) {
        // TODO: Produire le code assembleur pour la procédure

        return "";
    }

    public void TDS_creation(TDS_gen Parent, int variable_type) {
        // Cree une nouvelle TDS pour la fonction
        this.tds = new TDS_gen(this, Parent, nom);
        this.id = this.tds.num_reg;
        Logger.info("Création de la TDS de la procédure " + nom + " n°" + this.id);
        
        for (Parametre p : params) {
            p.TDS_creation(this.tds, 1);
        }
        definitions.TDS_creation(this.tds, 2);
        instructions.TDS_creation(this.tds, 2);
    }

    public void TDS_link(TDS_gen Parent) {
        for (Parametre p : params) {
            p.TDS_link(this.tds);
        }
        definitions.TDS_link(this.tds);
        instructions.TDS_link(this.tds);
    }

    public TDS_gen getTDS() {
        return this.tds;
    }

    public void TDS_variable() {
        // for (Parametre p : params) {
        //     // p.TDS_variable(variables); // On ne change pas l'identifiant du paramètre, il agit comme une déclaration
        // }
        definitions.TDS_variable();
    

        if (instructions instanceof Variable) {
            instructions = tds.get_Variable_string_and_parent(((Variable) instructions).nom);
        } else {
            instructions.TDS_variable();
        }
    }
}
