package arbres;

import java.util.ArrayList;

import outils.Error_list;
import outils.GestionFichier;
import outils.Logger;
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
        String sortie = "procedure " + this.nom + "-p&" + this.id + "(";
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
            sortie = p.valide() && sortie;
        }

        if (!nom.matches("[a-zA-Z][a-zA-Z0-9_]*")) {
            Logger.error("Nom de procédure invalide : "+nom);
            sortie = false;
        }
        if (definitions != null) {
            sortie = definitions.valide() && sortie;
        }
        if (instructions != null) {
            sortie = instructions.valide() && sortie;
        }
        if (recherche_return()) {
            Logger.error("procédure "+nom+" invalide : return dans les instructions");
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

    public String produire(TDS_gen tds_actuelle) {
        Logger.debug("=== Procédure ===");
        Logger.debug(nom + " proc params : " + params);

        String res = "// Procédure " + this.nom + "\n";

        res += "P"+this.tds.get_num_reg() + " :\n";
        res += "STP x29, lr, [sp, #-16] // Sauvegarde du pointeur de pile et du lien de retour\n";
        res += "MOV x29, sp // Mise à jour du pointeur de pile\n";
        res += "SUB sp, sp, #32 // Déplacement du stack pointer pour fp et lr\n";
        
        res += "// Définitions de la procédure "+nom+"\n";
        res += definitions.produire(tds)+"\n";
        // for (Noeud noeud : ((Bloc) definitions).instructions) {
        //     res += noeud.produire(tds)+"\n";
        // }

        res += "// Instructions de la procédure "+nom+"\n";
        res += instructions.produire(tds)+"\n";
        // if (instructions instanceof Bloc) {
        //     for (Noeud noeud : ((Bloc) instructions).instructions) {
        //         res += noeud.produire(tds)+"\n";
        //     }
        // } else if (instructions != null) {
        //     res += instructions.produire(tds)+"\n";
        // }

        // Restauration du pointeur de pile
        res += "MOV sp, x29 // Restauration du pointeur de pile\n";  
        // Restauration du pointeur de pile et du lien de retour
        res += "LDP x29, lr, [sp, #-16] // Restauration du pointeur de pile et du lien de retour\n";
        res += "RET // Retour de la fonction\n";
        GestionFichier.AddcontenuFooter(res);

        return "";
    }

    public void TDS_creation(TDS_gen Parent, int variable_type) {
        // Cree une nouvelle TDS pour la fonction
        this.tds = new TDS_gen(this, Parent, nom);
        this.tds.est_procedure = true;
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
            Variable tmp = tds.get_Variable_string_and_parent(((Variable) instructions).nom);
            if (tmp != null) {
                instructions = tmp;
            }
            else {
                Logger.error("Variable "+ ((Variable) instructions).nom +" non déclarée dans la TDS : "+tds.nom_fonction);
                Error_list.tdsgen = true;
            }

        } else {
            instructions.TDS_variable();
        }
    }

    public void TDS_func_proc_creation() {
        // On rajoute la fonction à la TDS parent
        TDS_gen tds_parent = this.tds.get_parent();
        tds_parent.TDS_add_func_proc(this);

        definitions.TDS_func_proc_creation();
    }

    public void TDS_func_proc_change() {
        definitions.TDS_func_proc_change();
        instructions.TDS_func_proc_change();
    }

    // Cherche si il y a un return dans les instructions, si oui renvoie true
    private boolean recherche_return() {
        ArrayList<Noeud> liste = new ArrayList<>();
        liste.add(instructions);

        while (!liste.isEmpty()) {
            Noeud n = liste.remove(0);
            
            if (n == null) {
                continue;
            }
            switch (n.getClass().getName()) {
                case "arbres.Return":
                    return true;
                case "arbres.Bloc":
                    liste.addAll(((Bloc) n).instructions);
                    break;
                case "arbres.InstructionIf":
                    liste.add(((InstructionIf) n).alors);
                    liste.add(((InstructionIf) n).sinon);
                    break;
                case "arbres.InstructionWhile":
                    liste.add(((InstructionWhile) n).corps);
                    break;
                case "arbres.InstructionFor":
                    liste.add(((InstructionFor) n).corps);
                    break;
                default:
                    break;
            }
            
        }
        return false;
    }
}
