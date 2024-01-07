package outils.Syntaxe;

import java.util.Stack;

import outils.Logger;
import outils.Arbre_Syntaxique.Noeud_Non_Terminal;
import outils.Arbre_Syntaxique.Noeud_Terminal;

import outils.Arbre_Syntaxique.Generator_UML;

import java.util.List;
import java.util.HashMap;

// Obligation CSV : Le premier non-terminal engendrant la grammaire doit être le premier non terminal dans le CSV. Le dernier terminal engendrant la grammaire doit être le dernier terminal dans le CSV. Les index associés aux IDF ou constantes doivent être mis dans la liste associée

// Information : les non-terminaux sont négatifs, les terminaux sont positifs

// Classe pour l'analyseur syntaxique
public class CSVAnalyseur_S {
    
    private Stack<Integer> pile;
    private Stack<Noeud_Terminal> pile_AST_Terminal;
    private Stack<Noeud_Non_Terminal> pile_AST_Non_Terminal;
    private Lecteur_S lect;
    private boolean en_erreur;

    private Noeud_Non_Terminal AST;

    private List<List<String>> records;
    private List<List<List<List<Integer>>>> rules;

    private HashMap<Integer, String> dico_terminaux;
    private HashMap<Integer, String> dico_non_terminaux;


    public CSVAnalyseur_S(String code_filename, String CSV_Grammar_filename) throws Exception {
        pile = new Stack<Integer>();
        en_erreur = false;
        
        lect = new Lecteur_S(code_filename);
        records = CSVParser.parse(CSV_Grammar_filename);
        rules = CSVParser.parseRules(records);

        dico_terminaux = CSVParser.getFirstLigne_Inverse(records);
        dico_non_terminaux = CSVParser.getFirstColonne_Inverse(records);
    }

    public void affiche_UML(String chemin_fichier) throws Exception {
        Generator_UML generator = new Generator_UML(chemin_fichier, AST, dico_non_terminaux, dico_terminaux);
        generator.generer();
    }

    public boolean analyse() throws Exception {
        pile.push(records.get(0).size() - 1); // empile le terminal de fin de grammaire $
        pile.push(-1); // empile le premier non-terminal de la grammaire

        AST = new Noeud_Non_Terminal(1); // On crée le noeud racine de l'AST
        pile_AST_Terminal = new Stack<Noeud_Terminal>();
        pile_AST_Non_Terminal = new Stack<Noeud_Non_Terminal>();
        pile_AST_Non_Terminal.push(AST);
        
        int tete = lect.lire();

        while (!pile.empty()) {
            int element = pile.pop();
            if (element < 0) {
                Logger.debug("Element Pile Non-Terminal : " + dico_non_terminaux.get(-element) + " code : " + element);
            }
            else {
                Logger.debug("Element Pile Terminal : " + dico_terminaux.get(element) + " code : " + element);
            }
            Logger.debug("Tete : " + dico_terminaux.get(tete) + " code : " + tete);

            if (element > 0) { // si c'est un terminal


                if (element == tete) { // si c'est le terminal attendu

                    Noeud_Terminal noeud_terminal;
                    
                    if (element != Lecteur_S.DOLLAR) { // si c'est pas le terminal de fin de grammaire
                        noeud_terminal = pile_AST_Terminal.pop();

                        if (element == Lecteur_S.IDF || element == Lecteur_S.CAR || element == Lecteur_S.ENTIER) { // si c'est un IDF ou un CAR ou un ENTIER
                            noeud_terminal.setCodeIdf(lect.getCode_idf());
                        }
                    }

                    tete = lect.lire();
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

}
