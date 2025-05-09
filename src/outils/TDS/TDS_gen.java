package outils.TDS;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import outils.TDS.Ligne_TDS; // Faut le laisser pour l'ordi Arnaud
import outils.Error_list;
import outils.Logger;
import arbres.AppelFonction;
import arbres.AppelProcedure;
import arbres.Evaluable;
import arbres.Fonction;
import arbres.Noeud;
import arbres.ProcedureParams;
// ?import outils.Arbre_Syntaxique.TDS;
import arbres.Variable;

public class TDS_gen {
    //doit contenir num imbr, num reg, nom de fonction
    //mettre nom deplacement taille pour chaque variable
    //doit pouvoir donner le père
    
    public ArrayList<TDS_gen> tds_childrens;
    public TDS_gen tds_parent;
    public Noeud noeud_associé;
    public int num_imbr;
    public int num_reg;
    public String nom_fonction;
    public boolean est_fonction = false;
    public boolean est_procedure = false;


    public HashMap<Integer, Ligne_TDS> TDS_vari;
    public HashMap<Integer, Ligne_TDS_func> TDS_function;
    public int num_variables = 0;
    public int num_parametres = 0;

    public static int num_reg_global = 0;

    public TDS_gen(Noeud noeud_associé, String nom_fonction) {
        this.noeud_associé = noeud_associé;
        this.tds_childrens = new ArrayList<TDS_gen>();
        this.tds_parent = null;
        this.num_imbr = 0;

        this.num_reg = TDS_gen.num_reg_global;
        TDS_gen.num_reg_global++;

        this.nom_fonction = nom_fonction;

        this.initialize_TDS_vari();
    }

    public TDS_gen(Noeud noeud_associé, TDS_gen Parent, String nom) {
        if (Parent == null) {
            Logger.error("TDS_gen : Parent is null");
        }

        this.noeud_associé = noeud_associé;
        this.tds_childrens = new ArrayList<TDS_gen>();
        this.TDS_vari = new HashMap<Integer, Ligne_TDS>();
        this.tds_parent = Parent;
        this.num_imbr = Parent.num_imbr + 1;

        this.num_reg = TDS_gen.num_reg_global;
        TDS_gen.num_reg_global++;
        
        this.nom_fonction = nom;
        Parent.add_TDS_child(this);

        this.initialize_TDS_vari();
    }

    public void initialize_TDS_vari() {
        // Initialisation de la TDS
        this.TDS_vari = new HashMap<Integer, Ligne_TDS>();

        // Initialisation du static link avec le numéro de TDS du parent, ou -1 si c'est la TDS principale
        Ligne_TDS static_link = new Ligne_TDS(this.tds_parent == null ? null : this.tds_parent.num_reg);
        this.TDS_vari.put(0, static_link);

        // Initialisation du dynamic link
        Ligne_TDS dynamic_link = new Ligne_TDS(null);
        this.TDS_vari.put(1, dynamic_link);

        // Initialisation de la variable de retour
        Ligne_TDS variable_retour = new Ligne_TDS(null);
        this.TDS_vari.put(2, variable_retour);

    }


    public void add_TDS_child(TDS_gen child) {
        this.tds_childrens.add(child);
        child.tds_parent = this;
        child.num_imbr = this.num_imbr + 1;
    }

    public void remove_TDS_child(TDS_gen child) {
        this.tds_childrens.remove(child);
        child.tds_parent = null;
        child.num_imbr = 0;
    }


    public void add_variable(Variable var_obj, int taille) {
        // Check if the variable is already in the TDS with contains_variable
        if (this.contains_variable_and_parent(var_obj.identifiant)) {
            Logger.error("TDS_gen : Variable : " + var_obj.identifiant + " déjà présente dans la TDS : " + this.nom_fonction);
            return;
        }

        // Ajout de la variable dans la TDS
        Ligne_TDS variable_ligne = new Ligne_TDS(var_obj, taille);
        this.TDS_vari.put(num_variables + 3, variable_ligne); // +3 pour les variables de retour, dynamic link et static link
        num_variables++;
        
    }

    public void add_parametre(Variable var_obj, int taille) {
        // Check if the variable is already in the TDS with contains_variable
        if (this.contains_variable_and_parent(var_obj.identifiant)) {
            Logger.error("TDS_gen : Variable : " + var_obj.identifiant + " déjà présente dans la TDS : " + this.nom_fonction);
            return;
        }

        // On fait de la place pour les paramètres
        this.deplace_parametre(-1);

        // Ajout du paramètre dans la TDS
        Ligne_TDS parametre = new Ligne_TDS(var_obj, taille);
        this.TDS_vari.put(-1, parametre);
        num_parametres++;
    }

    public void deplace_parametre(int deplacement) {
        // Déplacement des paramètres dans la TDS (partie négative de la pile) vers le bas

        // Test si le déplacement est possible
        if (deplacement > 0) {
            Logger.error("TDS_gen : Déplacement uniquement possible si déplacement <= 0");
            return;
        }

        for (int i = - num_parametres; i < 0; i++) {
            Ligne_TDS parametre = this.TDS_vari.get(i);
            this.TDS_vari.remove(i);
            this.TDS_vari.put(i + deplacement, parametre);
        }
    }

    public boolean contains_variables(int identifiant) {
        // Check if the variable is in the TDS
        for (Map.Entry<Integer, Ligne_TDS> entry : this.TDS_vari.entrySet()) {
            if (entry.getValue().variable == null) { // Éviter les erreurs de pointeurs null
                continue;
            }
            if (entry.getValue().variable.identifiant == identifiant && (entry.getKey() > 2 || entry.getKey() < 0)) {
                return true;
            }
        }
        
        return false;
    }

    public boolean contains_variable_and_parent(int identifiant) {
        // Check if the variable is in the TDS or in the parent TDS
        TDS_gen TDS_parent = this;

        while(TDS_parent != null) {
            if (TDS_parent.contains_variables(identifiant)) {
                return true;
            }

            TDS_parent = TDS_parent.tds_parent;
        }

        return false;
    }

    public boolean contains_variable_string(String nom) {
        // Check if the variable is in the TDS
        for (Map.Entry<Integer, Ligne_TDS> entry : this.TDS_vari.entrySet()) {
            if (entry.getValue().variable == null) { // Éviter les erreurs de pointeurs null
                continue;
            }
            if (entry.getValue().variable.nom.equals(nom) && (entry.getKey() > 2 || entry.getKey() < 0)) {
                return true;
            }
        }
        
        return false;
    }

    public Variable get_Variable_string(String nom) {
        // Check if the variable is in the TDS
        for (Map.Entry<Integer, Ligne_TDS> entry : this.TDS_vari.entrySet()) {
            if (entry.getValue().variable == null) { // Éviter les erreurs de pointeurs null
                continue;
            }
            if (entry.getValue().variable.nom.equals(nom) && (entry.getKey() > 2 || entry.getKey() < 0)) {
                return entry.getValue().variable;
            }
        }
        
        return null;
    }

    public Variable get_Variable_string_and_parent(String nom) {
        // Check if the variable is in the TDS or in the parent TDS
        TDS_gen TDS_parent = this;

        while(TDS_parent != null) {
            Variable var = TDS_parent.get_Variable_string(nom);

            if(var != null) {
                return var;
            }

            TDS_parent = TDS_parent.tds_parent;
        }

        return null;
    }

    public TDS_gen get_parent() {
        return this.tds_parent;
    }

    public int get_num_imbr() {
        return this.num_imbr;
    }

    public int get_num_reg() {
        return this.num_reg;
    }

    public String get_nom_fonction() {
        return this.nom_fonction;
    }

    public Integer get_index(int identifiant) {
        for (Map.Entry<Integer, Ligne_TDS> entry : this.TDS_vari.entrySet()) {
            if (entry.getValue().variable == null) { // Éviter les erreurs de pointeurs null
                continue;
            }
             // Si la variable est trouvée et que ce n'est pas l'un des 3 premiers éléments
            if (entry.getValue().variable.identifiant == identifiant && (entry.getKey() > 2 || entry.getKey() < 0)) {
                return entry.getKey();
            }
        }
        // Logger.error("TDS_gen : Variable : " + identifiant + " non trouvée dans la TDS : " + this.nom_fonction);
        return null;
    }

    public Integer get_index_and_parent(int nom) {
        TDS_gen TDS_parent = this;

        while(TDS_parent != null) {
            Integer index = TDS_parent.get_index(nom);

            if(index != null) {
                return index;
            }

            TDS_parent = TDS_parent.tds_parent;
        }

        return null;
    }

    public Integer search_imbrication_TDS(int nom) {
      
        int imbrication = 0;
        TDS_gen TDS_parent = this;

        while(TDS_parent != null) {
            Integer index = TDS_parent.get_index(nom);

            if(index != null) {
                return imbrication;
            }
            
            TDS_parent = TDS_parent.tds_parent;
            
            imbrication++;
        }

        return null; // Erreur
    }

    public String toString() {
        // Donne un nombre de tabulation égal à l'imbrication
        String tab = "";
        for (int i = 0; i < this.num_imbr; i++) {
            tab += "\t";
        }
        String sortie = "\n";
        sortie += tab + "+========= DÉBUT TDS N." + this.num_reg + " =========+\n";
        sortie += "\n";
        sortie += tab + "Nom de la fonction : " + this.nom_fonction + "\n";
        sortie += tab + "Numéro d'imbrication : " + this.num_imbr + "\n";
        sortie += tab + "Numéro de region : " + this.num_reg + "\n";

        for (int i = - num_parametres; i < 0; i++) {
            sortie += tab + "ID TDS :" + i + " - Paramètre : " + this.TDS_vari.get(i).variable.identifiant + " | Taille : " + this.TDS_vari.get(i).taille + " | Nom : " + this.TDS_vari.get(i).variable.nom + "\n";
        }
            sortie += tab + "ID TDS : 0 - Static link : " + this.TDS_vari.get(0).contenu_base + "\n"; 
            sortie += tab + "ID TDS : 1 - Dynamic link \n";
            sortie += tab + "ID TDS : 2 - Variable de retour \n";
        for (int i = 3; i < num_variables + 3; i++) {
            sortie += tab + "ID TDS : " + i + " - Variable : " + this.TDS_vari.get(i).variable.identifiant + " | Taille : " + this.TDS_vari.get(i).taille + " | Nom : " + this.TDS_vari.get(i).variable.nom + "\n";
        }

        sortie += tab + "Nombre d'enfants : " + tds_childrens.size() + " enfants\n";

        // Partie Fonctions et Procédures
        if (this.TDS_function != null) {
            for (Map.Entry<Integer, Ligne_TDS_func> entry : this.TDS_function.entrySet()) {
                if (entry.getValue().estFonction()) {
                    sortie += tab + "Fonction : " + entry.getValue().getnom() + " : num_reg : " + entry.getKey() + "\n";
                } else if (entry.getValue().estProcedure()) {
                    sortie += tab + "Procédure : " + entry.getValue().getnom() + " : num_reg : " + entry.getKey() + "\n";
                }
            }
        }

        for (TDS_gen tds : this.tds_childrens) {
            sortie += tds.toString();
        }
        sortie += "\n";

        

        sortie += tab + "+========= FIN TDS N." + this.num_reg + " =========+\n";
        return sortie;
    }


    // TODO : Vérifier si cette fonction fonctionne bien avec la nouvelle version de la TDS (On en a besoin)
    public int get_taille_variables_locales(){ // Voir s'il faut prendre en compte les paramètres
        int taille = 0;
        for (int i = 3; i < num_variables + 3; i++) {
            taille += this.TDS_vari.get(i).taille;
        }
        return taille;
    }

    public boolean valide() {
        // Vérifie si la TDS est valide
        // Vérifie pour sa TDS si deux variables n'ont pas le même nom
        boolean valide_state = true;

        for (Map.Entry<Integer, Ligne_TDS> entry : this.TDS_vari.entrySet()) {
            if (entry.getValue().variable == null) { // Éviter les erreurs de pointeurs null
                continue;
            }
            for (Map.Entry<Integer, Ligne_TDS> entry2 : this.TDS_vari.entrySet()) {
                if (entry2.getValue().variable == null) { // Éviter les erreurs de pointeurs null
                    continue;
                }

                // Pour éviter d'avoir le message d'erreur deux fois, on vérifie si l'index est plus petit
                if (entry.getKey() < entry2.getKey() && entry.getValue().variable.nom.equals(entry2.getValue().variable.nom)) {
                    Logger.error("TDS_gen : Deux variables ont le même nom : " + entry.getValue().variable.nom + " dans la TDS : " + this.nom_fonction);
                    valide_state = false;
                    Error_list.tdsgen = true;
                }
            }
        }

        // Vérifie pour les fonctions et procédures
        if (this.TDS_function != null) {
            for (Map.Entry<Integer, Ligne_TDS_func> entry : this.TDS_function.entrySet()) {
                for (Map.Entry<Integer, Ligne_TDS_func> entry2 : this.TDS_function.entrySet()) {
                    if (entry.getKey() < entry2.getKey() && entry.getValue().getnom().equals(entry2.getValue().getnom())) {
                        Logger.error("TDS_gen : Deux fonctions ou procédures ont le même nom : " + entry.getValue().getnom() + " dans la TDS : " + this.nom_fonction);
                        valide_state = false;
                        Error_list.tdsgen = true;
                    }
                }
            }
        }

        return valide_state;

    }

    public boolean valide_et_enfants() {
        // Vérifie si la TDS est valide et si ses enfants le sont aussi
        boolean valide_state = true;

        if (!this.valide()) {
            valide_state = false;
        }
        
        for (TDS_gen tds : this.tds_childrens) {
            if (!tds.valide_et_enfants()) {
                valide_state = false;
            }
        }

        return valide_state;
    }

    public void TDS_add_func_proc(Noeud func_proc) {
        // Logger.debug("TDS_gen : Ajout de la fonction ou procédure à la TDS : " + func_proc.toString());
        // Ajoute une fonction à la TDS
        if (this.TDS_function == null) {
            this.TDS_function = new HashMap<Integer, Ligne_TDS_func>();
        }

        if (func_proc instanceof Fonction) {
            Ligne_TDS_func func = new Ligne_TDS_func((Fonction) func_proc);
            this.TDS_function.put(func_proc.getTDS().num_reg, func);
            return;
        }
        if (func_proc instanceof ProcedureParams) {
            Ligne_TDS_func proc = new Ligne_TDS_func((ProcedureParams) func_proc);
            this.TDS_function.put(func_proc.getTDS().num_reg, proc);
            return;
        }

        Logger.error("TDS_gen : Fonction ou procédure invalide");
        
    }

    public Noeud get_Fonc_Proc_string(String nom) {
        // Check if the TDS functions exist
        if (this.TDS_function == null) {
            return null;
        }

        // Check if the variable is in the TDS
        for (Map.Entry<Integer, Ligne_TDS_func> entry : this.TDS_function.entrySet()) {
            if (entry.getValue().getnom().equals(nom)) {
                return entry.getValue().get_Fonc_Proc();
            }
        }
        
        return null;
    }

    public Noeud get_Fonc_Proc_string_and_parent(String nom) {
        // Check if the variable is in the TDS or in the parent TDS
        TDS_gen TDS_parent = this;

        while(TDS_parent != null) {
            Noeud var = TDS_parent.get_Fonc_Proc_string(nom);

            if(var != null) {
                return var;
            }

            TDS_parent = TDS_parent.tds_parent;
        }

        return null;
    }

    public Evaluable get_new_Appel(String nom, Evaluable ancien_appel) {
        // Récupère la fonction ou procédure à partir de son nom
        Noeud func_proc = this.get_Fonc_Proc_string_and_parent(nom);

        // Si la fonction ou procédure n'est pas trouvée
        if (func_proc == null) {
            Logger.error("TDS_gen : Fonction ou procédure : " + nom + " non trouvée dans la TDS : " + this.nom_fonction);
            return null;
        }

        // Si c'est une fonction
        if (func_proc instanceof Fonction) {
            // Création d'un nouvel appel de fonction
            AppelFonction appel = new AppelFonction((Fonction) func_proc);
            // Ajout des paramètres de l'ancien appel
            appel.params = ((AppelFonction) ancien_appel).params;
            // Ajout de l'ancienne TDS
            appel.tds_parent = ((AppelFonction) ancien_appel).tds_parent;
            return appel;
        }


        // Si c'est une procédure
        if (func_proc instanceof ProcedureParams) {
            // Création d'un nouvel appel de procédure
            AppelProcedure appel = new AppelProcedure((ProcedureParams) func_proc);
            // Ajout des paramètres de l'ancien appel
            appel.params = ((AppelProcedure) ancien_appel).params;
            // Ajout de l'ancienne TDS
            appel.tds_parent = ((AppelProcedure) ancien_appel).tds_parent;
            return appel;
        }
        
        return null;
    }
}
