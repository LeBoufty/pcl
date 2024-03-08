package arbres;

import java.util.ArrayList;

import outils.Logger;
import outils.GestionFichier;
import outils.TDS.TDS_gen;

public class Fonction implements Noeud {
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
        System.out.println(nom + " fonc type : " + type);
        System.out.println(nom + " fonc params : " + params);
        System.out.println(nom + " fonc definition : " + definitions);
        System.out.println(nom + " fonc instr : " + instructions);
        
        // Générer la TDS
        for (Parametre p : params) {
            p.produire();
        }

        for (Noeud n : ((Bloc) definitions).instructions) {
            n.produire();
        }

        String res = nom + " :" ;;

        //Code appelé
        res += "STP LR, X11, [SP, #-16]!\n";
        res += "STP X10, XZR, [SP, #-16]!\n";
        res += "SUB SP, SP, taille_locale\n";


        for (Noeud n : ((Bloc) instructions).instructions) {
            res += n.produire();
        }

        res += "ADD SP, SP, taille_locale\n";
        res += "LDP X10, XZR, [SP], #16\n";
        res += "LDP LR, X11, [SP], #16\n";
        res += "RET\n";

        GestionFichier.AddcontenuFooter(res);

        return "";
    }

    public void TDS_creation(TDS_gen Parent) {
        // Cree une nouvelle TDS pour la fonction
        this.tds = new TDS_gen(this, Parent, nom);
        for (Parametre p : params) {
            p.TDS_creation(this.tds);
        }
        definitions.TDS_creation(this.tds);
        instructions.TDS_creation(this.tds);
    }

    public TDS_gen getTDS() {
        return this.tds;
    }
}
