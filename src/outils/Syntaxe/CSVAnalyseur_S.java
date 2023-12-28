package outils.Syntaxe;

import java.util.Stack;

import outils.Logger;

import java.util.List;

// Obligation CSV : Le premier non-terminal engendrant la grammaire doit être le premier non terminal dans le CSV. Le dernier terminal engendrant la grammaire doit être le dernier terminal dans le CSV. Les index associés aux IDF ou constantes doivent être mis dans la liste associée

// Information : les non-terminaux sont négatifs, les terminaux sont positifs

// Classe pour l'analyseur syntaxique
public class CSVAnalyseur_S {
    
    private Stack<Integer> pile;
    private Lecteur_S lect;
    private boolean en_erreur;

    private List<List<String>> records;
    private List<List<List<List<Integer>>>> rules;


    public CSVAnalyseur_S(String code_filename, String CSV_Grammar_filename) throws Exception {
        pile = new Stack<Integer>();
        en_erreur = false;
        
        lect = new Lecteur_S(code_filename);
        records = CSVParser.parse(CSV_Grammar_filename);
        rules = CSVParser.parseRules(records);
    }

    public boolean analyse() throws Exception {
        pile.push(records.get(0).size() - 1); // empile le terminal de fin de grammaire $
        pile.push(-1); // empile le premier non-terminal de la grammaire
        
        int tete = lect.lire();

        while (!pile.empty()) {
            int element = pile.pop(); // TODO Déplacement dans l'AST
            Logger.debug("Element : " + element);
            Logger.debug("Tete : " + tete);

            if (element > 0) { // si c'est un terminal
                if (element == tete) { // si c'est le terminal attendu
                    // TODO Récupérer la valeur du terminal et l'ajouter à l'AST

                    tete = lect.lire();
                }
                else { // si c'est pas le terminal attendu
                    en_erreur = true; // TODO afficher l'erreur et la ligne + Créer une gestion d'erreur
                    Logger.error("Erreur : terminal attendu : " + element + " - terminal lu : " + tete);
                    return false;
                }
            }
            else { // si c'est un non-terminal - parmis les règles, on prend la première règle qui match
                int num_ligne = -element;
                int num_colonne = tete;
                
                // Test si on ne dépasse pas la taille de la grammaire
                if (num_ligne > rules.size() || num_ligne < 1) {
                    en_erreur = true; // TODO afficher l'erreur et la ligne + Créer une gestion d'erreur
                    Logger.error("Erreur : dépassement de la taille de la grammaire : " + num_ligne + " - " + num_colonne);
                    return false;
                }
                if (num_colonne > rules.get(num_ligne - 1).size() || num_colonne < 1) {
                    en_erreur = true; // TODO afficher l'erreur et la ligne + Créer une gestion d'erreur
                    Logger.error("Erreur : dépassement de la taille de la grammaire : " + num_ligne + " - " + num_colonne);
                    return false;
                }

                List<Integer> regles = rules.get(num_ligne - 1).get(num_colonne - 1).get(0);
                if (regles == null) { // si la règle est vide
                    en_erreur = true; // TODO afficher l'erreur et la ligne + Créer une gestion d'erreur
                    Logger.error("Erreur : règle vide : " + num_ligne + " - " + num_colonne);
                    return false;
                }
                else {
                    // TODO Récupérer la valeur du non-terminal et l'ajouter à l'AST (si besoin) + Déplacement dans l'AST
                    push_rule(regles);
                }
            }
                
        }
        return true;
    }

    private void push_rule(List<Integer> rules) {
        for (int i = rules.size() - 1; i >= 0; i--) {
            // On ne push pas les règles avec epsilon
            if (rules.get(i) != 0) {
                pile.push(rules.get(i));
            }
        }
    }

    // Getters

    public boolean getEn_erreur() {
        return en_erreur;
    }

}
