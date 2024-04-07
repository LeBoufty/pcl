package arbres;

import java.util.ArrayList;

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
        String res = "F" + this.tds.get_num_reg() + " : // Début de la fonction\n"; 

        // *Code appelé
        res += "STP x29, lr, [sp, #-16]! // Sauvegarde x29 et LR\n";
        res += "MOV x29, sp // Changement du x29 pour la fonction\n";
        res += "STR x19, [sp, -16] // Sauvegarde de X19\n";
        // Réserve de l'espace pour les variables locales
        int taille_locale = this.tds.get_taille_variables_locales();
        res += "SUB SP, SP, " + taille_locale + " // Réserve de l'espace pour les variables locales\n";

        for (Noeud n : ((Bloc) instructions).instructions) {
            res += n.produire();
        }

        res += "ADD SP, SP, " + taille_locale + " // Libération de l'espace pour les variables locales\n";
        res += "LDP x29, lr, [sp], #16 // Restauration x29 et LR\n";
        res += "RET // Retour de la fonction\n";
        GestionFichier.AddcontenuFooter(res);

        System.out.println("=== Fin Fonction ===");

        return "";
    }

    public void TDS_creation(TDS_gen Parent, int variable_type) {
        // Cree une nouvelle TDS pour la fonction
        this.tds = new TDS_gen(this, Parent, nom);
        this.id = this.tds.num_reg;
        Logger.info("Création de la TDS de la fonction " + nom + " n°" + this.id);
        
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
