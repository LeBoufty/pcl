package outils.Syntaxe;

import java.io.BufferedReader;
import java.io.FileReader;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.HashMap;

import outils.Logger;

// Obligation : Le premier élément du fichier CSV n'est pas pris en compte. Les cases ne doivent pas être vides. La première colonne correspond aux non-terminaux. La première ligne correspond aux terminaux. Chaque case correspond à une liste de règles. Une règle vide est sumbolysé par RULE_EMPTY. S'il y a plusieurs règles dans une même case, les règles sont séparés par RULE_DELIMITER. Les terminaux sont symbolysés par leur propre nom. Les non-terminaux sont symbolysés par NON_TERMINAL + leur nom. Les terminaux et non-terminaux sont séparés par WORD_DELIMITER. Epsilon est symbolysé par EPSILON.

// Il ne doit pas y avoir d'espaces dans le fichier CSV.

// Classe pour parser un fichier CSV d'une grammaire
public class CSVParser {
    
    public static final String COMMA_DELIMITER = ",";
    public static final String WORD_DELIMITER = "&";
    public static final String RULE_DELIMITER = "\\|"; // Car | est un opérateur regex, en fait ne sert à rien
    public static final String EPSILON = "€";
    public static final String RULE_EMPTY = "§";
    public static final char NON_TERMINAL = '£';

    // Retourne une liste de liste de String, chaque liste de String correspond à une ligne du fichier CSV.
    public static List<List<String>> parse(String filename) throws Exception {
        

        List<List<String>> records = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(filename, StandardCharsets.UTF_8))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] values = line.split(COMMA_DELIMITER);
                records.add(Arrays.asList(values));
            }
        }
        return records;
    }

    // Retourne une hashmap de la première ligne du fichier CSV vers leur index dans le fichier CSV. Le premier élément n'est pas pris en compte.
    public static HashMap<String, Integer> getFirstLigne(List<List<String>> records) {
        HashMap<String, Integer> colonnes = new HashMap<String, Integer>();
        for (int i = 1; i < records.get(0).size(); i++) {
            colonnes.put(records.get(0).get(i), i);
        }
        return colonnes;
    }

    // Retourne une hashmap de la première colonne du fichier CSV vers leur index dans le fichier CSV. Le premier élément n'est pas pris en compte.
    public static HashMap<String, Integer> getFirstColonne(List<List<String>> records) {
        HashMap<String, Integer> lignes = new HashMap<String, Integer>();
        for (int i = 1; i < records.size(); i++) {
            lignes.put(records.get(i).get(0), i);
        }
        return lignes;
    }


    // Retourne les fonctions getFirstLigne et getFirstColonne inversées
    public static HashMap<Integer, String> getFirstLigne_Inverse(List<List<String>> records) {
        HashMap<Integer, String> colonnes = new HashMap<Integer, String>();
        for (int i = 1; i < records.get(0).size(); i++) {
            colonnes.put(i, records.get(0).get(i));
        }
        return colonnes;
    }

    public static HashMap<Integer, String> getFirstColonne_Inverse(List<List<String>> records) {
        HashMap<Integer, String> lignes = new HashMap<Integer, String>();
        for (int i = 1; i < records.size(); i++) {
            lignes.put(i, records.get(i).get(0));
        }
        return lignes;
    }

    // Retourne une liste de liste de Liste d'entiers, les deux premières listes sont le tableau des règles sans la première ligne et la première colonne. La troisième liste est la liste des règles dans une même case du tableau. La quatrième liste est une règle. Une règle est une liste d'entiers des index des terminaux et non-terminaux. Négatif pour les terminaux, positif pour les non-terminaux. EPSILON pour epsilon donnant 0. null pour les cases vides symbolysé par RULE_EMPTY. WORD_DELIMITER est le délimiteur entre terminaux et non-terminaux. RULE_DELIMITER est le délimiteur entre les règles d'une même case.
    public static List<List<List<List<Integer>>>> parseRules(List<List<String>> records) throws Exception {
        HashMap<String, Integer> colonnes = getFirstColonne(records);
        HashMap<String, Integer> lignes = getFirstLigne(records);

        List<List<List<List<Integer>>>> rules = new ArrayList<List<List<List<Integer>>>>();
        for (int i = 1; i < records.size(); i++) {
            List<List<List<Integer>>> ligne = new ArrayList<List<List<Integer>>>();

            for (int j = 1; j < records.get(i).size(); j++) {
                List<List<Integer>> casee = new ArrayList<List<Integer>>();
                if (records.get(i).get(j).equals(RULE_EMPTY)) {
                    casee.add(null);
                }
                else {
                    String rule_str = records.get(i).get(j);
                    String[] rules_str = rule_str.split(RULE_DELIMITER);
                    Logger.debug("rules_str : " + Arrays.toString(rules_str));
                    addRule(rules_str, casee, colonnes, lignes);
                }
                ligne.add(casee);
            }
            rules.add(ligne);
        }

        return rules;
    }

    private static void addRule(String[] rules_str, List<List<Integer>> casee, HashMap<String, Integer> colonnes, HashMap<String, Integer> lignes) {
        for (int k = 0; k < rules_str.length; k++) {
            List<Integer> rule = new ArrayList<Integer>();
            String[] elements = rules_str[k].split(WORD_DELIMITER);
            for (int l = 0; l < elements.length; l++) {
                if (elements[l].equals(EPSILON)) {
                    rule.add(0);
                }
                else if (elements[l].charAt(0) == NON_TERMINAL) {
                    Logger.debug("elements[l] : " + elements[l]);
                    Logger.debug("colonnes.get(elements[l]) : " + colonnes.get(elements[l]));
                    rule.add(-colonnes.get(elements[l]));
                }
                else {
                    rule.add(lignes.get(elements[l]));
                }
            }
            casee.add(rule);
        }

    }

}
