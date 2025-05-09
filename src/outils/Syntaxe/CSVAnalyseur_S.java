package outils.Syntaxe;

import java.util.HashMap;
import java.util.List;
import java.util.Stack;

import arbres.Noeud;
import outils.Logger;
import outils.Arbre_Syntaxique.Elagueur;
import outils.Arbre_Syntaxique.Generator_UML;
import outils.Arbre_Syntaxique.Noeud_Non_Terminal;
import outils.Arbre_Syntaxique.Noeud_Terminal;

// Obligation CSV : Le premier non-terminal engendrant la grammaire doit être le premier non terminal dans le CSV. Le dernier terminal engendrant la grammaire doit être le dernier terminal dans le CSV. Les index associés aux IDF ou constantes doivent être mis dans la liste associée

// Information : les non-terminaux sont négatifs, les terminaux sont positifs

// Classe pour l'analyseur syntaxique
public class CSVAnalyseur_S {
    
    private Stack<Integer> pile;
    private Stack<Noeud_Terminal> pile_AST_Terminal;
    private Stack<Noeud_Non_Terminal> pile_AST_Non_Terminal;
    private Lecteur_S lect;
    private Lecteur_IDF lect_idf;
    private boolean en_erreur;

    private Noeud_Non_Terminal AST;

    private List<List<String>> records;
    private List<List<List<List<Integer>>>> rules;

    private HashMap<Integer, String> dico_terminaux;
    private HashMap<Integer, String> dico_non_terminaux;

    private Vecteur_Passage_CSV vecteur_passage;

    public CSVAnalyseur_S(String code_filename, String CSV_Grammar_filename, String idf_filename) throws Exception {
        pile = new Stack<Integer>();
        en_erreur = false;
        
        lect = new Lecteur_S(code_filename);
        lect_idf = new Lecteur_IDF(idf_filename);
        records = CSVParser.parse(CSV_Grammar_filename);
        CSVParser.setConstantes(records);
        lect.setConstantes(CSVParser.IDF, CSVParser.CAR, CSVParser.ENTIER);
        rules = CSVParser.parseRules(records);

        dico_terminaux = CSVParser.getFirstLigne_Inverse(records);
        dico_non_terminaux = CSVParser.getFirstColonne_Inverse(records);

        vecteur_passage = new Vecteur_Passage_CSV(CSVParser.getFirstLigne(records));
    }

    public void affiche_UML(String chemin_fichier) throws Exception {
        Generator_UML generator = new Generator_UML(chemin_fichier, AST, dico_non_terminaux, dico_terminaux);
        generator.generer();
    }

    public boolean analyse() throws Exception {
        Logger.milestone("Début de l'analyse syntaxique");
        pile.push(records.get(0).size() - 1); // empile le terminal de fin de grammaire $
        pile.push(-1); // empile le premier non-terminal de la grammaire

        AST = new Noeud_Non_Terminal(1); // On crée le noeud racine de l'AST
        pile_AST_Terminal = new Stack<Noeud_Terminal>();
        pile_AST_Non_Terminal = new Stack<Noeud_Non_Terminal>();
        pile_AST_Non_Terminal.push(AST);
        
        int tete = lect.lire();
        // Logger.debug("Tete : " + dico_terminaux.get(tete) + " code : " + tete);
        tete = vecteur_passage.get_vecteur_passage_Lexeur_CSV(tete);
        // Logger.debug("Tete : " + dico_terminaux.get(tete) + " code : " + tete);

        lect_idf.lire();
        List<String> liste_idf = lect_idf.getListe_idf();

        while (!pile.empty()) {
            int element = pile.pop();
            // if (element < 0) {
            //     Logger.info("Element Pile Non-Terminal : " + dico_non_terminaux.get(-element) + " code : " + element);
            // }
            // else {
            //     Logger.info("Element Pile Terminal : " + dico_terminaux.get(element) + " code : " + element);
            // }
            // Logger.info("Tete : " + dico_terminaux.get(tete) + " code : " + tete);

            if (element > 0) { // si c'est un terminal


                if (element == tete) { // si c'est le terminal attendu

                    Noeud_Terminal noeud_terminal;
                    
                    if (element != Lecteur_S.DOLLAR) { // si c'est pas le terminal de fin de grammaire
                        noeud_terminal = pile_AST_Terminal.pop();

                        if (element == CSVParser.IDF || element == CSVParser.CAR || element == CSVParser.ENTIER) { // si c'est un IDF ou un CAR ou un ENTIER
                            noeud_terminal.setCodeIdf(lect.getCode_idf());

                            if (element == CSVParser.IDF) {
                                noeud_terminal.setValeurIdf(liste_idf.get(lect.getCode_idf() - 1));
                            }
                            
                            if (element == CSVParser.ENTIER) {
                                noeud_terminal.setValeurIdf(Integer.toString(lect.getCode_idf()));
                            }

                            if (element == CSVParser.CAR) {
                                noeud_terminal.setValeurIdf(Character.toString((char) lect.getCode_idf()));
                            }
                        }
                    }

                    tete = lect.lire();
                    // Logger.debug("Tete : " + dico_terminaux.get(tete) + " code : " + tete);
                    tete = vecteur_passage.get_vecteur_passage_Lexeur_CSV(tete);
                    // Logger.debug("Tete : " + dico_terminaux.get(tete) + " code : " + tete);
                }

                else { // si c'est pas le terminal attendu
                    en_erreur = true; 
                    Logger.error("Erreur : terminal attendu : " + dico_terminaux.get(element) + " avec le code " + element + " - terminal lu : " + dico_terminaux.get(tete) + " avec le code " + tete + " - ligne : " + lect.getNum_ligne_en_lecture());
                    return false;
                }
            }

            else { // si c'est un non-terminal - parmis les règles, on prend la première règle qui match
                int num_ligne = -element;
                int num_colonne = tete;
                
                // Test si on ne dépasse pas la taille de la grammaire
                if (num_ligne > rules.size() || num_ligne < 1) {
                    en_erreur = true;
                    Logger.error("Erreur : dépassement de la taille de la grammaire : " + num_ligne + " - " + num_colonne);
                    return false;
                }
                if (num_colonne > rules.get(num_ligne - 1).size() || num_colonne < 1) {
                    en_erreur = true;
                    Logger.error("Erreur : dépassement de la taille de la grammaire : " + num_ligne + " - " + num_colonne);
                    return false;
                }

                //Logger.debug("Règle : " + rules.get(num_ligne - 1).get(num_colonne - 1).get(0));
                List<Integer> regles = rules.get(num_ligne - 1).get(num_colonne - 1).get(0);
                if (regles == null) { // si la règle est vide
                    en_erreur = true;
                    Logger.error("Erreur : règle vide : " + num_ligne + " - " + num_colonne + " - ligne : " + lect.getNum_ligne_en_lecture());
                    return false;
                }
                else {
                    push_rule(regles);
                }
            }
                
        }
        Logger.milestone("Analyse syntaxique terminée avec succès");
        return true;
    }

    private void push_rule(List<Integer> rules) {

        Noeud_Non_Terminal noeud_parent = pile_AST_Non_Terminal.pop();

        for (int i = rules.size() - 1; i >= 0; i--) {

            // On ne push pas les règles avec epsilon
            if (rules.get(i) != 0) {
                //Logger.debug("Push : " + rules.get(i));
                pile.push(rules.get(i));

                if (rules.get(i) < 0) { // si c'est un non-terminal
                    Noeud_Non_Terminal noeud_non_terminal = new Noeud_Non_Terminal(-rules.get(i));
                    pile_AST_Non_Terminal.push(noeud_non_terminal);
                    noeud_parent.ajouterEnfant(noeud_non_terminal);
                }
                else { // si c'est un terminal
                    Noeud_Terminal noeud_terminal = new Noeud_Terminal(rules.get(i));
                    pile_AST_Terminal.push(noeud_terminal);
                    noeud_parent.ajouterEnfant(noeud_terminal);
                }
            }
        }
    }

    // Getters

    public boolean getEn_erreur() {
        return en_erreur;
    }

    public Noeud_Non_Terminal getAST() {
        return AST;
    }

    public Noeud elaguer() {
        Elagueur elagueur = new Elagueur(getAST(), records);
        elagueur.elaguer();
        return elagueur.traduire();
    }

    public List<String> getIDFList() {
        return lect_idf.getListe_idf();
    }
}
