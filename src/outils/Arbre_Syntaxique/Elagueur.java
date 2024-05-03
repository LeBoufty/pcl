package outils.Arbre_Syntaxique;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Stack;

import arbres.*;
import outils.Error_list;
import outils.Logger;
import outils.Syntaxe.CSVParser;

public class Elagueur {
    private Noeud_Non_Terminal Arbre_Syntaxique;
    private static String[] nt_etoile_nom={"£DECLEtoile","£CHAMPEtoile","£PARAMEtoile","£OPERATEUREtoile","£INSTREtoile","£ELSIFEtoile"};
    private static String[] nt_prime_nom = {"£ORPrime","£ANDPrime","£NOTPrime","£EQUALSPrime","£COMPARATORSPrime","£ADDPrime", "£MULTPrime"};
    private static String[] nt_operation_nom = {"£OR", "£AND", "£EQUALS","£COMPARATORS", "£ADD", "£MULT"};
    private static String[] nt_plus_nom={"£CHAMPPlus","£PARAMPlus","£INSTRPlus"};
    private static String[] t_utile = {"IDF", "caractere", "entier", "false", "true", "null"};
    private static HashMap<String, Integer> nonterminaux;
    private static HashMap<String, Integer> terminaux;
    private TDS tds;

    public Elagueur(Noeud_Non_Terminal Arbre_Syntaxique, List<List<String>> records) {
        this.Arbre_Syntaxique = Arbre_Syntaxique;
        terminaux = CSVParser.getFirstLigne(records);
        nonterminaux = CSVParser.getFirstColonne(records);
        tds = new TDS();
    }

    public void elaguer() {
        Logger.milestone("Début de l'élagage");
        deprime_elague();

        //this.Arbre_Syntaxique.seSacrifier();
        //Logger.info("Première vague de sacrifices effectuée");
        for ( Noeud_Non_Terminal nnt : trouverNoeudsVides()) {
            nnt.supprimer();
        }

        Logger.info("Non-terminaux vides supprimés");
        this.Arbre_Syntaxique.seSacrifier();
        Logger.info("Sacrifices effectués");
        comprimerEtoiles();
        Logger.info("Etoiles compressées");
        transmettreetoileauplus();
        Logger.info("enfants des etoiles transmis aux plus");
        // mettreassertiondansdecl();
        Logger.info("assertions mis dans les declarations");
        //remonterPrimes();
        //Logger.info("Opérations simplifiées");
        supprimerInutiles();
        remonte_operation_elague();
        descend_appel_fonction_boucle();
        changement_LValue_boucle();
        changement_assertion_boucle();
        // ajoutCondition_boucle();
        Logger.info("Terminaux inutiles supprimés");
        Logger.milestone("Fin de l'élagage");
    }

    private ArrayList<Noeud_Non_Terminal> trouverNoeudsVides() {
        ArrayList<Noeud_Non_Terminal> tag = new ArrayList<>();
        Stack<Noeud_A> pile = new Stack<>();
        pile.push(this.Arbre_Syntaxique);
        while (!pile.isEmpty()) {
            Noeud_A noeud = pile.pop();
            if (noeud instanceof Noeud_Non_Terminal && noeud.sansEnfant()) {
                tag.add((Noeud_Non_Terminal)noeud);
            } else if (noeud instanceof Noeud_Non_Terminal) {
                for (Noeud_A enfant : ((Noeud_Non_Terminal) noeud).getEnfants()) {
                    pile.push(enfant);
                }
            }
        }
        return tag;
    }

    // private boolean estEtoile(Noeud_Non_Terminal noeud) {
    //     for (int i : nt_etoile) {
    //         if (noeud.getCode() == i) {
    //             return true;
    //         }
    //     }
    //     return false;
    // }

    private boolean estEtoile(Noeud_Non_Terminal noeud) {
        int[] nt_etoile = new int[nt_etoile_nom.length];
        for (int i=0 ; i<nt_etoile_nom.length ; i++){
            nt_etoile[i] = nonterminaux.get(nt_etoile_nom[i]);
        }
        for (int i : nt_etoile) {
            if (noeud.getCode() == i) {
                return true;
            }
        }
        return false;
    }

    private boolean estPlus(Noeud_Non_Terminal noeud) {
        int[] nt_plus = new int[nt_plus_nom.length];
        for (int i=0 ; i<nt_plus_nom.length ; i++){
            nt_plus[i] = nonterminaux.get(nt_plus_nom[i]);
        }
        for (int i : nt_plus) {
            if (noeud.getCode() == i) {
                return true;
            }
        }
        return false;
    }

    private boolean estPrime(Noeud_Non_Terminal noeud) {
        int[] nt_prime = new int[nt_prime_nom.length];

        for (int i=0 ; i<nt_prime_nom.length ; i++){
            nt_prime[i] = nonterminaux.get(nt_prime_nom[i]);
        }
        for (int i : nt_prime) {
            if (noeud.getCode() == i) {
                return true;
            }
        }
        return false;
    }

    // TODO : réécrire
    // private void remonterPrimes() {
    //     Stack<Noeud_A> pile = new Stack<>();
    //     ArrayList<Noeud_Non_Terminal> tag = new ArrayList<>();
    //     pile.push(this.Arbre_Syntaxique);
    //     while (!pile.isEmpty()) {
    //         Noeud_A noeud = pile.pop();
    //         if (noeud instanceof Noeud_Non_Terminal) {
    //             for (Noeud_A enfant : ((Noeud_Non_Terminal) noeud).getEnfants()) {
    //                 pile.push(enfant);
    //             }
    //             if (estPrime((Noeud_Non_Terminal)noeud)) {
    //                 tag.add((Noeud_Non_Terminal)noeud);
    //             }
    //         }
    //     }
    //     for (Noeud_Non_Terminal nnt : tag) {
    //         nnt.getParent().getEnfants().remove(nnt);
    //         nnt.getParent().ajouterEnfant(nnt.getEnfants().get(1));
    //         nnt.getParent().ajouterEnfant(nnt.getEnfants().get(0));
    //     }
    // }

    private boolean estInutile(Noeud_Terminal noeud) {
        for(String s : t_utile) {
            if (noeud.getCode() == terminaux.get(s)) {
                return false;
            }
        } return true;
    }

    private void supprimerInutiles() {
        Stack<Noeud_A> pile = new Stack<>();
        pile.push(this.Arbre_Syntaxique);
        while (!pile.isEmpty()) {
            Noeud_A noeud = pile.pop();
            if (noeud instanceof Noeud_Terminal) {
                if (estInutile((Noeud_Terminal)noeud)) {
                    noeud.supprimer();
                }
            } else if (noeud instanceof Noeud_Non_Terminal) {
                for (Noeud_A enfant : ((Noeud_Non_Terminal) noeud).getEnfants()) {
                    pile.push(enfant);
                }
            }
        }
    }

    private void comprimerEtoiles() {
        Stack<Noeud_A> pile = new Stack<>();
        ArrayList<Noeud_Non_Terminal> tag = new ArrayList<>();
        pile.push(this.Arbre_Syntaxique);
        while (!pile.isEmpty()) {
            Noeud_A noeud = pile.pop();
            if (noeud instanceof Noeud_Non_Terminal) {
                for (Noeud_A enfant : ((Noeud_Non_Terminal) noeud).getEnfants()) {
                    pile.push(enfant);
                }
                if (estEtoile((Noeud_Non_Terminal)noeud)) {
                    tag.add((Noeud_Non_Terminal)noeud);
                }
            }
        }
        for (Noeud_Non_Terminal nnt : (tag)) {
            if (nnt.getParent().getCode() == nnt.getCode()) {
                nnt.getParent().getEnfants().remove(nnt);
                ArrayList<Noeud_A> listeenfant=nnt.getEnfants();
                Collections.reverse(listeenfant);
                for (Noeud_A enfant : listeenfant) {
                    nnt.getParent().ajouterFirstEnfant(enfant);
                    enfant.setParent(nnt.getParent());
                }
            }
        }
    }

    private void changement_assertion(Noeud_Non_Terminal DECLARATION) {
        if (DECLARATION.getEnfants().size() < 2) {
            return;
        }
        try {
        Noeud_Non_Terminal Is_Assertion = (Noeud_Non_Terminal) DECLARATION.getEnfants().get(0);
        
        if (Is_Assertion.getCode() == nonterminaux.get("£ASSERTION")) {
            
            Noeud_A FirstIDF = DECLARATION.getEnfants().get(1);
            DECLARATION.getEnfants().remove(FirstIDF);
            Is_Assertion.getEnfants().add(FirstIDF);
            FirstIDF.setParent(Is_Assertion);
        }
        } catch (Exception e) {
        }
    }

    private void changement_assertion_boucle() {
        Stack<Noeud_A> pile = new Stack<>();
        ArrayList<Noeud_Non_Terminal> tag = new ArrayList<>();
        pile.push(this.Arbre_Syntaxique);
        while (!pile.isEmpty()) {
            Noeud_A noeud = pile.pop();
            if (noeud instanceof Noeud_Non_Terminal) {
                for (Noeud_A enfant : ((Noeud_Non_Terminal) noeud).getEnfants()) {
                    pile.push(enfant);
                }
                if (nonterminaux.get("£DECLARATION")==((Noeud_Non_Terminal)noeud).getCode() ) {
                    tag.add((Noeud_Non_Terminal)noeud);
                }
            }
        }
        for (Noeud_Non_Terminal nnt : (tag)) {
            changement_assertion(nnt);
        }
    }

    private void changement_LValue(Noeud_Non_Terminal LValue) {
        Noeud_Non_Terminal Fils = (Noeud_Non_Terminal) LValue.getEnfants().get(0);
        if (Fils.getCode() == nonterminaux.get("£APPELfonction")) {
            LValue.setCode(nonterminaux.get("£APPELfonction"));
            Fils.setCode(nonterminaux.get("£PARAMPlus"));
        }
        if (Fils.getCode() == nonterminaux.get("£POINTrecord")) {
            LValue.setCode(nonterminaux.get("£POINTrecord"));
            Fils.setCode(nonterminaux.get("£PARAMPlus"));
        }
    }

    private void changement_LValue_boucle() {
        Stack<Noeud_A> pile = new Stack<>();
        ArrayList<Noeud_Non_Terminal> tag = new ArrayList<>();
        pile.push(this.Arbre_Syntaxique);
        while (!pile.isEmpty()) {
            Noeud_A noeud = pile.pop();
            if (noeud instanceof Noeud_Non_Terminal) {
                for (Noeud_A enfant : ((Noeud_Non_Terminal) noeud).getEnfants()) {
                    pile.push(enfant);
                }
                if (nonterminaux.get("£LVALUE")==((Noeud_Non_Terminal)noeud).getCode() ) {
                    tag.add((Noeud_Non_Terminal)noeud);
                }
            }
        }
        for (Noeud_Non_Terminal nnt : (tag)) {
            changement_LValue(nnt);
        }
    }

    private void descend_appel_fonction(Noeud_Non_Terminal noeud) {
        Noeud_Non_Terminal APPELFonction = noeud;

        if (APPELFonction.getEnfants().size() < 2) {
            return;
        }

        Noeud_Non_Terminal OPERATEUREtoile = (Noeud_Non_Terminal) APPELFonction.getEnfants().get(0);
        Noeud_A FirstParam = APPELFonction.getEnfants().get(1);

        APPELFonction.getEnfants().remove(FirstParam);
        APPELFonction.getEnfants().remove(OPERATEUREtoile);

        for (Noeud_A enfant : OPERATEUREtoile.getEnfants()) {
            APPELFonction.ajouterEnfant(enfant);
            enfant.setParent(APPELFonction);
        }
        APPELFonction.ajouterEnfant(FirstParam);
        FirstParam.setParent(APPELFonction);

    }

    private void descend_appel_fonction_boucle() {
        Stack<Noeud_A> pile = new Stack<>();
        ArrayList<Noeud_Non_Terminal> tag = new ArrayList<>();
        pile.push(this.Arbre_Syntaxique);
        while (!pile.isEmpty()) {
            Noeud_A noeud = pile.pop();
            if (noeud instanceof Noeud_Non_Terminal) {
                for (Noeud_A enfant : ((Noeud_Non_Terminal) noeud).getEnfants()) {
                    pile.push(enfant);
                }
                if (nonterminaux.get("£APPELfonction")==((Noeud_Non_Terminal)noeud).getCode() ) {
                    tag.add((Noeud_Non_Terminal)noeud);
                }
            }
        }
        for (Noeud_Non_Terminal nnt : (tag)) {
            descend_appel_fonction(nnt);
        }
    }

    /*private void mettreassertiondansdecl() // Ne pas UTILISER
    {
        Stack<Noeud_A> pile = new Stack<>();
        ArrayList<Noeud_Non_Terminal> tag = new ArrayList<>();
        pile.push(this.Arbre_Syntaxique);
        while (!pile.isEmpty()) {
            Noeud_A noeud = pile.pop();
            if (noeud instanceof Noeud_Non_Terminal) {
                for (Noeud_A enfant : ((Noeud_Non_Terminal) noeud).getEnfants()) {
                    pile.push(enfant);
                }
                if (nonterminaux.get("£DECLARATION")==((Noeud_Non_Terminal)noeud).getCode() ) {
                    tag.add((Noeud_Non_Terminal)noeud);
                }
            }
        }
        Collections.reverse(tag);
        for (Noeud_Non_Terminal nnt : (tag)) {
            ArrayList<Noeud_A> listeenfant=nnt.getEnfants();
            Noeud_A idfenfant=null;
            for(int i=listeenfant.size()-1;i>=0;i--)
            {
                if(listeenfant.get(i) instanceof Noeud_Terminal)
                {
                    if(terminaux.get("IDF")==((Noeud_Terminal)listeenfant.get(i)).getCode() )
                    {
                        idfenfant=listeenfant.get(i);
                        listeenfant.remove(i);
                    }
                }
                else
                {
                    if(nonterminaux.get("£LVALUE")==((Noeud_Non_Terminal)listeenfant.get(i)).getCode() )
                    {
                        idfenfant=listeenfant.get(i);
                        listeenfant.remove(i);
                    }
                }
                
            }
            for (Noeud_A enfant : listeenfant) {
                if(enfant instanceof Noeud_Non_Terminal)
                {
                    if(nonterminaux.get("£ASSERTION")==((Noeud_Non_Terminal)enfant).getCode())
                    {
                        nnt.getParent().ajouterEnfant(enfant);
                        ((Noeud_Non_Terminal) enfant).ajouterEnfant(idfenfant);
                        enfant.setParent(nnt.getParent());
                        idfenfant.setParent((Noeud_Non_Terminal) enfant);
                    }
                }
                
            }
            nnt.supprimer();
        }
    }*/

    private void transmettreetoileauplus()
    {
        Stack<Noeud_A> pile = new Stack<>();
        ArrayList<Noeud_Non_Terminal> tag = new ArrayList<>();
        pile.push(this.Arbre_Syntaxique);
        while (!pile.isEmpty()) {
            Noeud_A noeud = pile.pop();
            if (noeud instanceof Noeud_Non_Terminal) {
                for (Noeud_A enfant : ((Noeud_Non_Terminal) noeud).getEnfants()) {
                    pile.push(enfant);
                }
                if (estEtoile((Noeud_Non_Terminal)noeud)) {
                    tag.add((Noeud_Non_Terminal)noeud);
                }
            }
        }
        for (Noeud_Non_Terminal nnt : (tag)) {
            if(estPlus(nnt.getParent()))
            {
                ArrayList<Noeud_A> listeenfant=nnt.getEnfants();
                Collections.reverse(listeenfant);
                for (Noeud_A enfant : listeenfant) {
                    nnt.getParent().ajouterFirstEnfant(enfant);
                    enfant.setParent(nnt.getParent());
                }
                nnt.supprimer();
            }
            
        }
    }

    public Noeud_Non_Terminal getArbre_Syntaxique() {
        return this.Arbre_Syntaxique;
    }

    public ArrayList<Noeud_A> ArrayInverse(ArrayList<Noeud_A> array) {
        ArrayList<Noeud_A> inverse = new ArrayList<>();
        for (int i = array.size() - 1; i >= 0; i--) {
            inverse.add(array.get(i));
        }
        return inverse;
    }

    public ArrayList<Noeud_Non_Terminal> ArrayInverseNT(ArrayList<Noeud_Non_Terminal> array) {
        ArrayList<Noeud_Non_Terminal> inverse = new ArrayList<>();
        for (int i = array.size() - 1; i >= 0; i--) {
            inverse.add(array.get(i));
        }
        return inverse;
    }

    public String getNomNT(int code) {
        for (String s : nonterminaux.keySet()) {
            if (nonterminaux.get(s) == code) {
                return s;
            }
        }
        return null;
    }

    public String getNomT(int code) {
        for (String s : terminaux.keySet()) {
            if (terminaux.get(s) == code) {
                return s;
            }
        }
        return null;
    }

    private Noeud traduire(Noeud_A noeud) {
        if (noeud instanceof Noeud_Non_Terminal) {
            return traduire((Noeud_Non_Terminal) noeud);
        } else if (noeud instanceof Noeud_Terminal) {
            return traduire((Noeud_Terminal) noeud);
        }
        return null;
    }

    private Noeud traduire(Noeud_Non_Terminal noeud) {
        String nom = getNomNT(noeud.getCode());
        //Logger.debug(nom);
        switch (nom) {
            case "£FICHIER":
                try { // Code devenu illisble par Pierre, vaut mieux me demander si besoin de relire

                    Boolean il_y_a_definition = true;


                    // Test si l'enfant 0 n'est pas de type "£BEGIN", sinon continue
                    if (noeud.getEnfants().get(0).getCode() != nonterminaux.get("£BEGIN")) {
                        
                        // Test si l'enfant 2 peut être cast en Noeud_Terminal puis si c'est de type "IDF", sinon continue
                        if ((noeud.getEnfants().get(2) instanceof Noeud_Terminal)) {
                            il_y_a_definition = false;
                            if (((Noeud_Terminal)noeud.getEnfants().get(2)).getCode() == terminaux.get("IDF")) {
                                // Test si les deux noms de la procédure sont identiques (nom après le procedure et nom après le end)
                                if (!((Noeud_Terminal)noeud.getEnfants().get(0)).getValeurIdf().equals(((Noeud_Terminal)noeud.getEnfants().get(2)).getValeurIdf())) {
                                    Error_list.traduction = true;
                                    Logger.error("Erreur : les deux noms de la procédure ne sont pas identiques.");
                                    throw new Exception("Erreur : les deux noms de la procédure ne sont pas identiques.");
                                }
                            }
                            else {
                                Logger.error("Erreur qui ne devrait pas arriver.");
                            }
                        }
                        else if (!((Noeud_Terminal)noeud.getEnfants().get(0)).getValeurIdf().equals(((Noeud_Terminal)noeud.getEnfants().get(3)).getValeurIdf())) { // Même test pour l'enfant 3
                            Error_list.traduction = true;
                            Logger.error("Erreur : les deux noms de la procédure ne sont pas identiques.");
                            throw new Exception("Erreur : les deux noms de la procédure ne sont pas identiques.");
                        }
                        
                        Procedure programme = new Procedure(((Noeud_Terminal)noeud.getEnfants().get(0)).getValeurIdf());

                        if (il_y_a_definition) {
                            programme.ajouterDefinition(traduire(noeud.getEnfants().get(2)));
                        } 

                        programme.ajouterInstruction(traduire(noeud.getEnfants().get(1)));

                        return programme;

                    }

                    // Si l'enfant 0 est de type "£BEGIN"
                    // regarde si l'enfant 1 est de type "IDF"
                    if (noeud.getEnfants().get(1) instanceof Noeud_Terminal && noeud.getEnfants().get(1).getCode() == terminaux.get("IDF")) {
                        Procedure programme = new Procedure(((Noeud_Terminal)noeud.getEnfants().get(1)).getValeurIdf());
                        programme.ajouterInstruction(traduire(noeud.getEnfants().get(0)));
                        return programme;
                    }

                    // Sinon c'est l'enfant 2 qui est de type "IDF" et l'enfant 1 sont les définitions
                    Procedure programme2 = new Procedure(((Noeud_Terminal)noeud.getEnfants().get(2)).getValeurIdf());
                    programme2.ajouterDefinition(traduire(noeud.getEnfants().get(1)));
                    programme2.ajouterInstruction(traduire(noeud.getEnfants().get(0)));
                    return programme2;
                    
                    

                    
                } catch (Exception e) {
                    Logger.error("Erreur syntaxique empêchant la construction de l'arbre : Traduire - FICHIER");
                    // Logger.error(e.getMessage());
                    return null;
                }
            case "£DECLEtoile":
            case "£CHAMPEtoile":
            case "£INSTRPlus":
            case "£INSTREtoile":
                Bloc bloc = new Bloc();
                for (Noeud_A enfant : ArrayInverse(noeud.getEnfants())) {
                    bloc.ajouterInstruction(traduire(enfant));
                }
                return bloc;
            case "£BEGIN":
                return traduire(noeud.getEnfants().get(0));
            case "£RETURN":
                return new Return((Evaluable) traduire(noeud.getEnfants().get(0)));
            case "£ADDITION":
                return new Operation((Evaluable) traduire(noeud.getEnfants().get(1)), (Evaluable) traduire(noeud.getEnfants().get(0)), Operateur.PLUS);
            case "£SUBSTRACTION":
                return new Operation((Evaluable) traduire(noeud.getEnfants().get(1)), (Evaluable) traduire(noeud.getEnfants().get(0)), Operateur.MOINS);
            case "£MULTIPLY":
                return new Operation((Evaluable) traduire(noeud.getEnfants().get(1)), (Evaluable) traduire(noeud.getEnfants().get(0)), Operateur.FOIS);
            case "£DIVIDE":
                return new Operation((Evaluable) traduire(noeud.getEnfants().get(1)), (Evaluable) traduire(noeud.getEnfants().get(0)), Operateur.DIV);
            case "£REM":
                return new Operation((Evaluable) traduire(noeud.getEnfants().get(1)), (Evaluable) traduire(noeud.getEnfants().get(0)), Operateur.REM);
            case "£EXPRESSIONparenthese":
                return traduire(noeud.getEnfants().get(0));
            case "£ASSERTION":
                if (noeud.getEnfants().size()==1) return traduire(noeud.getEnfants().get(0));
                return new Affectation((Variable) traduire(noeud.getEnfants().get(1)), (Evaluable) traduire(noeud.getEnfants().get(0)));
            case "£ACCESSDECL":
                Declaration declaration;
                Noeud_Terminal type = (Noeud_Terminal) noeud.getEnfants().get(noeud.getEnfants().size()-2);
                String nom_variable = ((Noeud_Terminal) noeud.getEnfants().get(noeud.getEnfants().size()-1)).getValeurIdf();
                if (noeud.getEnfants().size()==3) {
                    Noeud valeur = traduire(noeud.getEnfants().get(0));
                    declaration = new Declaration(getType(type), nom_variable, (Evaluable) valeur);
                } else {
                    declaration = new Declaration(getType(type), nom_variable);
                }
                tds.ajouter(((Noeud_Terminal)noeud.getEnfants().get(noeud.getEnfants().size()-1)).getCodeIdf(), declaration.variable);
                return declaration;
            case "£MOINSUnairePresent":
                return new OperationUnaire((Evaluable)traduire(noeud.getEnfants().get(0)), OperateurUnaire.MOINS);
            case "£APPELfonction":
                try{
                
                // fonction put gérée à part
                if (((Noeud_Terminal)noeud.getEnfants().get(1)).getValeurIdf().equals("put")) {
                    return new Put((Evaluable) traduire(((Noeud_Non_Terminal)noeud.getEnfants().get(0)).getEnfants().get(0)));
                }
                
                Noeud fonc_or_proc = tds.getFonctionOrProcedureParams(((Noeud_Terminal)noeud.getEnfants().get(1)).getCodeIdf());

                if (fonc_or_proc == null) {
                    Logger.error("Fonction ou procédure " + ((Noeud_Terminal)noeud.getEnfants().get(1)).getValeurIdf() + " non déclarée - Création d'une fonction temporaire.");
                    fonc_or_proc = new Fonction(((Noeud_Terminal)noeud.getEnfants().get(1)).getValeurIdf());
                }

                if (fonc_or_proc instanceof Fonction) {
                    Fonction fonction = (Fonction) fonc_or_proc;

                    AppelFonction appel = new AppelFonction(fonction);
                    for (Noeud_A enfant : ((Noeud_Non_Terminal)noeud.getEnfants().get(0)).getEnfants()) {
                        appel.ajouterParametre((Evaluable) traduire(enfant));
                    }
                    return appel;
                }

                if (fonc_or_proc instanceof ProcedureParams) {
                    ProcedureParams procedure = (ProcedureParams) fonc_or_proc;

                    AppelProcedure appel = new AppelProcedure(procedure);
                    for (Noeud_A enfant : ((Noeud_Non_Terminal)noeud.getEnfants().get(0)).getEnfants()) {
                        appel.ajouterParametre((Evaluable) traduire(enfant));
                    }
                    return appel;
                }
                

                } catch (Exception e) {
                    Logger.error("Erreur syntaxique empêchant la construction de l'arbre. traduire - APPELfonction");
                    // Error_list.traduction = true;
                    Logger.error(e.getMessage());
                    return null;
                }
            case "£DECLARATION":
                return traduire(noeud.getEnfants().get(0));
            case "£IDFInterro":
                return traduire(noeud.getEnfants().get(0));
            case "£PROCEDUREDECL":
            try {
            
                // Va chercher le nom de la fonction
                Noeud_Non_Terminal noeud_name = (Noeud_Non_Terminal) noeud.getEnfants().get(noeud.getEnfants().size() - 1);
                
                String name_fun = ((Noeud_Terminal) noeud_name.getEnfants().get(noeud_name.getEnfants().size() - 1)).getValeurIdf();

                int code_name = ((Noeud_Terminal)noeud_name.getEnfants().get(noeud_name.getEnfants().size() - 1)).getCodeIdf();

                
                int slider = 0;
                Noeud_A noeud_temp = noeud.getEnfants().get(0);
                if (noeud_temp instanceof Noeud_Non_Terminal && ((Noeud_Non_Terminal)noeud_temp).getCode() == nonterminaux.get("£BEGIN")) {
                    slider = 1;
                }
                else if (!((Noeud_Terminal) noeud.getEnfants().get(0)).getValeurIdf().equals(name_fun)) { // Si le nom de la fonction est différent du nom de la fonction après end
                    Logger.error("Erreur : les deux noms de la fonction ne sont pas identiques.");
                    throw new Exception("Erreur : les deux noms de la fonction ne sont pas identiques.");
                }

                ProcedureParams fonc = new ProcedureParams(name_fun);
                tds.ajouter(code_name, fonc);


                Noeud_Non_Terminal decletoile = (Noeud_Non_Terminal) noeud.getEnfants().get(2 - slider);

                if (decletoile.getCode() != nonterminaux.get("£NAME")) {
                    fonc.definitions = traduire(decletoile);
                }

                Noeud_Non_Terminal paramplus = ((Noeud_Non_Terminal)noeud.getEnfants().get(noeud.getEnfants().size() - 1));

                while (!getNomNT(paramplus.getEnfants().get(0).getCode()).equals("£PARAMUnique")) {
                    paramplus = (Noeud_Non_Terminal) paramplus.getEnfants().get(0);
                }

                for (Noeud_A na : paramplus.getEnfants()) {
                    fonc.params.add((Parametre)traduire(na));
                }

                fonc.instructions = traduire(noeud.getEnfants().get(1 - slider));

                return fonc;
                    
                } catch (Exception e) {
                    Logger.error("Erreur syntaxique empêchant la construction de l'arbre. traduire - PROCEDUREDECL");
                    Error_list.traduction = true;
                    // Logger.error(e.getMessage());
                    return null;
                }
                
            case "£FUNCTIONDECL":
                try {
            
                // Va chercher le nom de la fonction
                Noeud_Non_Terminal noeud_name = (Noeud_Non_Terminal) noeud.getEnfants().get(noeud.getEnfants().size() - 1);
                
                String name_fun = ((Noeud_Terminal) noeud_name.getEnfants().get(noeud_name.getEnfants().size() - 1)).getValeurIdf();

                int code_name = ((Noeud_Terminal)noeud_name.getEnfants().get(noeud_name.getEnfants().size() - 1)).getCodeIdf();

                
                int slider = 0;
                Noeud_A noeud_temp = noeud.getEnfants().get(0);
                if (noeud_temp instanceof Noeud_Non_Terminal && ((Noeud_Non_Terminal)noeud_temp).getCode() == nonterminaux.get("£BEGIN")) {
                    slider = 1;
                }
                else if (!((Noeud_Terminal) noeud.getEnfants().get(0)).getValeurIdf().equals(name_fun)) { // Si le nom de la fonction est différent du nom de la fonction après end
                    Logger.error("Erreur : les deux noms de la fonction ne sont pas identiques.");
                    throw new Exception("Erreur : les deux noms de la fonction ne sont pas identiques.");
                }

                Fonction fonc = new Fonction(name_fun);
                tds.ajouter(code_name, fonc);

                Noeud_Non_Terminal returnfonction = (Noeud_Non_Terminal) noeud.getEnfants().get(2 - slider);

                fonc.type = getType((Noeud_Terminal)returnfonction.getEnfants().get(returnfonction.getEnfants().size() - 1));

                if (returnfonction.getEnfants().size() > 1) {
                    fonc.ajouterDefinition(traduire(returnfonction.getEnfants().get(0)));
                }

                Noeud_Non_Terminal paramplus = ((Noeud_Non_Terminal)noeud.getEnfants().get(noeud.getEnfants().size() - 1));

                while (!getNomNT(paramplus.getEnfants().get(0).getCode()).equals("£PARAMUnique")) {
                    paramplus = (Noeud_Non_Terminal) paramplus.getEnfants().get(0);
                }

                for (Noeud_A na : paramplus.getEnfants()) {
                    fonc.params.add((Parametre)traduire(na));
                }

                fonc.ajouterInstruction(traduire(noeud.getEnfants().get(1 - slider)));

                return fonc;
                    
                } catch (Exception e) {
                    Logger.error("Erreur syntaxique empêchant la construction de l'arbre. traduire - FUNCTIONDECL");
                    Error_list.traduction = true;
                    // Logger.error(e.getMessage());
                    return null;
                }

            case "£PARAMUnique":
                IType paratype = getType((Noeud_Terminal)noeud.getEnfants().get(0));
                String paranom = ((Noeud_Terminal)noeud.getEnfants().get(1)).getValeurIdf();
                Parametre param = new Parametre(paratype, paranom);
                tds.ajouter(((Noeud_Terminal)noeud.getEnfants().get(1)).getCodeIdf(), param.variable);
                return param;
            case "£ELSIFEtoile":
                InstructionIf premier = new InstructionIf();
                InstructionIf courant = premier;
                ArrayList<Noeud> liste = new ArrayList<>();
                for (Noeud_A na : noeud.getEnfants()) {
                    liste.add(traduire(na));
                }
                for (int i = 0; i < liste.size(); i++) {
                    if (i%2 == 1) {
                        courant.condition = (Evaluable) liste.get(i);
                        if (i < liste.size() - 2) {
                            courant.sinon = new InstructionIf();
                            courant = (InstructionIf) courant.sinon;
                        }
                    } else {
                        courant.alors = liste.get(i);
                    }
                } 
                return premier;
            case "£ELSEINSTRInterro":
                return traduire(noeud.getEnfants().get(0));
            case "£IF":
                InstructionIf ifinstr = new InstructionIf();
                ifinstr.condition = (Evaluable) traduire(noeud.getEnfants().get(noeud.getEnfants().size()-1));
                ifinstr.alors = traduire(noeud.getEnfants().get(noeud.getEnfants().size()-2));
                if (noeud.getEnfants().size() > 2) {
                    ifinstr.sinon = traduire(noeud.getEnfants().get(noeud.getEnfants().size()-3));
                }
                if (noeud.getEnfants().size() > 3) {
                    Noeud elseinstr = traduire(noeud.getEnfants().get(0));
                    InstructionIf courant2 = (InstructionIf)ifinstr.sinon;
                    while (courant2.sinon != null) {
                        courant2 = (InstructionIf)courant2.sinon;
                    }
                    courant2.sinon = elseinstr;
                }
                return ifinstr;
            case "£EQUAL":
                return new Operation((Evaluable) traduire(noeud.getEnfants().get(1)), (Evaluable) traduire(noeud.getEnfants().get(0)), Operateur.EGAL);
            case "£NOTEQUAL":
                return new Operation((Evaluable) traduire(noeud.getEnfants().get(1)), (Evaluable) traduire(noeud.getEnfants().get(0)), Operateur.DIFFERENT);
            case "£INFERIOR":
                return new Operation((Evaluable) traduire(noeud.getEnfants().get(1)), (Evaluable) traduire(noeud.getEnfants().get(0)), Operateur.INFERIEUR_EGAL);
            case "£SUPERIOR":
                return new Operation((Evaluable) traduire(noeud.getEnfants().get(1)), (Evaluable) traduire(noeud.getEnfants().get(0)), Operateur.SUPERIEUR_EGAL);
            case "£INFERIORStrict":
                return new Operation((Evaluable) traduire(noeud.getEnfants().get(1)), (Evaluable) traduire(noeud.getEnfants().get(0)), Operateur.INFERIEUR);
            case "£SUPERIORStrict":
                return new Operation((Evaluable) traduire(noeud.getEnfants().get(1)), (Evaluable) traduire(noeud.getEnfants().get(0)), Operateur.SUPERIEUR);
            case "£OR2":
                return new Operation((Evaluable) traduire(noeud.getEnfants().get(1)), (Evaluable) traduire(noeud.getEnfants().get(0)), Operateur.OR);
            case "£AND2":
                return new Operation((Evaluable) traduire(noeud.getEnfants().get(1)), (Evaluable) traduire(noeud.getEnfants().get(0)), Operateur.AND);
            case "£NOT":
                return new OperationUnaire((Evaluable) traduire(noeud.getEnfants().get(0)), OperateurUnaire.NOT);
            case "£ORELSE":
                return new Operation((Evaluable) traduire(noeud.getEnfants().get(1)), (Evaluable) traduire(noeud.getEnfants().get(0)), Operateur.OR);
            case "£ANDTHEN":
                return new Operation((Evaluable) traduire(noeud.getEnfants().get(1)), (Evaluable) traduire(noeud.getEnfants().get(0)), Operateur.AND);
            case "£WHILE":
                InstructionWhile whileinstr = new InstructionWhile();
                whileinstr.condition = (Evaluable) traduire(noeud.getEnfants().get(noeud.getEnfants().size()-1));
                whileinstr.corps = traduire(noeud.getEnfants().get(noeud.getEnfants().size()-2));
                return whileinstr;
            case "£FOR":
                InstructionFor forinstr = new InstructionFor();
                tds.ajouter(((Noeud_Terminal)noeud.getEnfants().get(noeud.getEnfants().size()-1)).getCodeIdf(), new Variable(Type.INTEGER, ((Noeud_Terminal)noeud.getEnfants().get(noeud.getEnfants().size()-1)).getValeurIdf()));
                forinstr.iterateur = (Variable) traduire(noeud.getEnfants().get(noeud.getEnfants().size()-1));
                forinstr.borneInf = (Evaluable) traduire(noeud.getEnfants().get(noeud.getEnfants().size()-2));
                forinstr.borneSup = (Evaluable) traduire(noeud.getEnfants().get(noeud.getEnfants().size()-3));
                forinstr.corps = traduire(noeud.getEnfants().get(noeud.getEnfants().size()-4));
                return forinstr;
            case "£TYPEDECL":
                arbres.Record record = new arbres.Record();
                Struct struct = record.type;
                struct.nom = ((Noeud_Terminal)noeud.getEnfants().get(1)).getValeurIdf();
                tds.ajouter(((Noeud_Terminal)noeud.getEnfants().get(1)).getCodeIdf(), record.type);
                Noeud_Non_Terminal champplus = (Noeud_Non_Terminal)noeud.getEnfants().get(0);
                while (!getNomNT(champplus.getEnfants().get(0).getCode()).equals("£CHAMP")) {
                    champplus = (Noeud_Non_Terminal) champplus.getEnfants().get(0);
                }
                for (Noeud_A na : champplus.getEnfants()) {
                    struct.champs.add((Champ)traduire(na));
                }
                //Logger.debug(record.toString());
                return record;
            case "£CHAMP":
                Noeud_Terminal champidf = (Noeud_Terminal)noeud.getEnfants().get(1);
                IType champtype = getType((Noeud_Terminal)noeud.getEnfants().get(0));
                Champ champ = new Champ(champtype, champidf.getValeurIdf());
                tds.ajouter(champidf.getCodeIdf(), champ.variable);
                return champ;
            case "£POINTrecord":
                Variable recordvar = (Variable) traduire(noeud.getEnfants().get(1));
                Noeud_Non_Terminal paramplusacces = (Noeud_Non_Terminal)noeud.getEnfants().get(0);
                String champnom = ((Noeud_Terminal)paramplusacces.getEnfants().get(0)).getValeurIdf();
                Acces acces = new Acces(recordvar, champnom);
                return acces;
        }
        Logger.error("Erreur : noeud non reconnu lors de la traduction : " + nom);
        return null;
    }

    private Noeud traduire(Noeud_Terminal noeud) {
        String nom = getNomT(noeud.getCode());
        //Logger.debug(nom);
        switch (nom) {
            case "entier":
                return new Constante(noeud.getCodeIdf());
            case "caractere":
                return new Constante((char)noeud.getCodeIdf());
            case "true":
                return new Constante(true);
            case "false":
                return new Constante(false);
            case "null":
                return new Constante();
            case "IDF":
                if (tds.get(noeud.getCodeIdf()) != null) {
                    return tds.get(noeud.getCodeIdf());
                }
                Logger.error("Variable "+noeud.getValeurIdf()+" non initialisée");
                Error_list.elaguage = true;
                return new Variable(Type.INTEGER, noeud.getValeurIdf());
        }
        return null;
    }

    public Noeud traduire() {
        return traduire(this.Arbre_Syntaxique);
    }

    private IType getType(Noeud_Terminal nt) {
        String nom = nt.getValeurIdf();
        //Logger.debug(nom);
        switch (nom) {
            case "integer":
                return Type.INTEGER;
            case "character":
                return Type.CHARACTER;
            case "boolean":
                return Type.BOOLEAN;
            case "caractere":
                return Type.CHARACTER;
            case "entier":
                return Type.INTEGER;
            default:
                return tds.getType(nt.getCodeIdf());
        }
    }

    public void associativite_gauche_prime(Noeud_Non_Terminal noeud) {
        // Le but est de trouver les noeuds de type prime ayant un parent de type prime, ce type de noeud est nommé P4
        // Le parent de P2 de type prime est nommé P3
        // Le parent de P1 est de type non terminal (par exemple £ADD) et est nommé N2
        // Le parent de N1 est de type non terminal (par exemple £COMPARATOR) et est nommé N0
        // Le but est de rajouter N1 en tant qu'enfant de N0 et de remplacer N2 en tant qu'enfant de N1
        // Puis de remplacer P4 en tant qu'enfant de N1
        // Donne en paramètre le noeud P4

        Noeud_Non_Terminal P4 = noeud;
        // System.out.println("P4 : " + P4.getCode());
        Noeud_Non_Terminal P3 = P4.getParent();
        // System.out.println("P3 : " + P3.getCode());
        Noeud_Non_Terminal N2 = P3.getParent();
        // System.out.println("N2 : " + N2.getCode());
        Noeud_Non_Terminal N0 = N2.getParent();
        // System.out.println("N0 : " + N0.getCode());

        // On supprime P4 de la liste des enfants de P3
        P3.getEnfants().remove(P4);

        // On duplique N2 en N1
        Noeud_Non_Terminal N1 = new Noeud_Non_Terminal(N2.getCode());

        // On remplace N2 par N1 dans la liste des enfants de N0
        N0.getEnfants().remove(N2);
        N0.getEnfants().add(N1);

        // Change les parents de N1
        N1.setParent(N0);

        // On remplace P4 par N1 dans la liste des enfants de P3
        N1.ajouterEnfant(P4);
        
        // Change les parents de P4
        P4.setParent(N1);

        // On rajooute N2 en tant qu'enfant de N1
        N1.ajouterEnfant(N2);

        // Change les parents de N2
        N2.setParent(N1);
    }

    public int trouve_et_deprime() {
        // Renvoie 1 si un noeud de type prime (avec un parent de type prime) a été trouvé et déprimé, 0 sinon

        Stack<Noeud_A> pile = new Stack<>();
        pile.push(this.Arbre_Syntaxique);
        while (!pile.isEmpty()) {
            Noeud_A noeud = pile.pop();
            if (noeud instanceof Noeud_Non_Terminal) {
                for (Noeud_A enfant : ((Noeud_Non_Terminal) noeud).getEnfants()) {
                    pile.push(enfant);
                }
                if (estPrime((Noeud_Non_Terminal)noeud) && estPrime(((Noeud_Non_Terminal)noeud).getParent())) {
                    associativite_gauche_prime((Noeud_Non_Terminal)noeud);
                    return 1;
                }
            }
        }
        return 0;
    }

    public void deprime_elague() {
        // Tant qu'un noeud de type prime (avec un parent de type prime) est trouvé, on le déprime
        retire_prime_sans_enfant();

        while (trouve_et_deprime() == 1) {
            Logger.info("Déprimé");
            
        }
    }

    public boolean estOperation(Noeud_Non_Terminal noeud) {
        int[] nt_operation = new int[nt_operation_nom.length];
        for (int i=0 ; i<nt_operation_nom.length ; i++){
            // System.out.println(nt_operation_nom[i]);
            nt_operation[i] = nonterminaux.get(nt_operation_nom[i]);
        }
        for (int i : nt_operation) {
            if (noeud.getCode() == i) {
                return true;
            }
        }
        return false;
    }

    public void remonte_operation(Noeud_A noeud) {
        // Le but est de remonter le noeud de type opération P2 (par exemple £ADDITION) en tant qu'enfant de P1 (par exemple £ADD)

        Noeud_Non_Terminal P1 = (Noeud_Non_Terminal) noeud;
        Noeud_Non_Terminal P2_2 = (Noeud_Non_Terminal) P1.getEnfants().get(0);
        Noeud_A P2_1 = P1.getEnfants().get(1);
        Noeud_Non_Terminal P0 = P1.getParent();

        int index_P1 = P0.getEnfants().indexOf(P1);
        P0.getEnfants().remove(P1);
        P0.getEnfants().add(index_P1, P2_2);
        P2_2.setParent(P0);

        P2_2.ajouterEnfant(P2_1);
        P2_1.setParent(P2_2);


    }

    public int trouve_et_remonte_operation() {
        // Renvoie 1 si un noeud de type opération (avec un parent de type opération) a été trouvé et remonté, 0 sinon

        Stack<Noeud_A> pile = new Stack<>();
        pile.push(this.Arbre_Syntaxique);
        while (!pile.isEmpty()) {
            Noeud_A noeud = pile.pop();
            if (noeud instanceof Noeud_Non_Terminal) {
                for (Noeud_A enfant : ((Noeud_Non_Terminal) noeud).getEnfants()) {
                    pile.push(enfant);
                }
                if (estOperation((Noeud_Non_Terminal)noeud)){
                    remonte_operation(noeud);
                    return 1;
                }
            }
        }
        return 0;
    }

    public void remonte_operation_elague() {
        // Tant qu'un noeud de type opération (avec un parent de type opération) est trouvé, on le remonte
        int i = 1;
        while (trouve_et_remonte_operation() == 1) {
            //Logger.info("Remonté");
            i++;
            if (i > 3) {
                //break;
            }
        }
    }

    public void retire_prime_sans_enfant() {
        // Le but est de trouver tous les primes sans enfant et de les supprimer

        Stack<Noeud_A> pile = new Stack<>();

        pile.push(this.Arbre_Syntaxique);
        while (!pile.isEmpty()) {
            Noeud_A noeud = pile.pop();
            if (noeud instanceof Noeud_Non_Terminal) {
                for (Noeud_A enfant : ((Noeud_Non_Terminal) noeud).getEnfants()) {
                    pile.push(enfant);
                }
                if (estPrime((Noeud_Non_Terminal)noeud) && noeud.sansEnfant()) {
                    noeud.supprimer();
                }
            }
        }
    }
}