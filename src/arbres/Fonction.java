package arbres;

import java.util.ArrayList;
import java.util.HashMap;

import outils.Logger;
import outils.GestionFichier;
import outils.TDS.TDS_gen;

public class Fonction implements Noeud {
    
    public int id;

    public String nom;
    public IType type;
    public ArrayList<Parametre> params;
    public Noeud definitions;
    public Noeud instructions;
    public TDS_gen tds = null;

    public Fonction(String nom, Parametre[] parametres, IType t, Noeud def, Noeud inst) {
        this.nom = nom;
        this.type = t;
        this.definitions = def;
        this.instructions = inst;
        this.params = new ArrayList<>();
        for (Parametre p : parametres) {
            this.params.add(p);
        }
    }
    public Fonction(String nom, Parametre[] parametres, IType t) {
        this(nom, parametres, t, new Bloc(), new Bloc());
    }
    public Fonction(String nom) {
        this(nom, new Parametre[] {}, Type.NULLTYPE, new Bloc(), new Bloc());
    }
    public String toString() {
        String sortie = "function " + this.nom + "(";
        ArrayList<String> paramStrings = new ArrayList<>();
        for (Parametre p : params) {
            paramStrings.add(p.toString());
        }
        sortie += String.join(" ", paramStrings);
        sortie += ") return " + this.type.toString() + " is ";
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
            Logger.error("Nom de fonction invalide : "+nom);
            sortie = false;
        }
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

    public String produire() {
        System.out.println("=== Fonction ===");
        System.out.println(nom + " fonc type : " + type);
        System.out.println(nom + " fonc params : " + params);
        System.out.println(nom + " fonc definition : " + definitions);
        System.out.println(nom + " fonc instr : " + instructions);

        // Générer le code
        String res = nom + " :" ;;

        // *Code appelé
        res += "STP LR, X11, [SP, #-16]! // Sauvegarde LR\n";
        res += "STP X10, XZR, [SP, #-16]! // Sauvegarde X10\n";
        // Réserve de l'espace pour les variables locales
        int taille_locale = this.tds.get_taille_variables_locales();
        res += "SUB SP, SP, " + taille_locale + " // Réserve de l'espace pour les variables locales\n";

        for (Noeud n : ((Bloc) instructions).instructions) {
            res += n.produire();
        }

        res += "ADD SP, SP, " + taille_locale + " // Libération de l'espace pour les variables locales\n";
        res += "LDP X10, XZR, [SP], #16 // Restauration de X10\n";
        res += "LDP LR, X11, [SP], #16 // Restauration de LR\n";
        res += "RET // Retour de la fonction\n";

        GestionFichier.AddcontenuFooter(res);

        System.out.println("=== Fin Fonction ===");

        return "";
    }

    public void TDS_creation(TDS_gen Parent, int variable_type) {
        // Cree une nouvelle TDS pour la fonction
        this.tds = new TDS_gen(this, Parent, nom);
        this.id = this.tds.num_reg;
        
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

    public void TDS_variable(HashMap<String, ArrayList<Integer>> variables) {
        for (Parametre p : params) {
            p.TDS_variable(variables);
        }
        definitions.TDS_variable(variables);
        instructions.TDS_variable(variables);
    }
}
