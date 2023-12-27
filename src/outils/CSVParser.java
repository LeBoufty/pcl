package outils;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.HashMap;

public class CSVParser {
    
    private static final String COMMA_DELIMITER = ",";
    private static final String WORD_DELIMITER = "&";
    private static final String RULE_DELIMITER = "\\|"; // Car | est un opérateur regex
    private static final String EPSILON = "€";
    private static final String RULE_EMPTY = "§";
    private static final char NON_TERMINAL = '£';

    // Retourne une liste de liste de String, chaque liste de String correspond à une ligne du fichier CSV.
    public static List<List<String>> parse(String filename) throws Exception {
        

        List<List<String>> records = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(filename))) {
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
                    for (int k = 0; k < rules_str.length; k++) {
                        List<Integer> rule = new ArrayList<Integer>();
                        String[] elements = rules_str[k].split(WORD_DELIMITER);
                        for (int l = 0; l < elements.length; l++) {
                            System.out.println();
                            if (elements[l].equals(EPSILON)) {
                                rule.add(0);
                            }
                            else if (elements[l].charAt(0) == NON_TERMINAL) {
                                rule.add(-colonnes.get(elements[l]));
                            }
                            else {
                                rule.add(lignes.get(elements[l]));
                            }
                        }
                        casee.add(rule);
                    }
                }
                ligne.add(casee);
            }
            rules.add(ligne);
        }

        return rules;

        
    }



    
}
