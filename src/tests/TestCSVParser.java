package tests;

import java.util.List;
import java.util.HashMap;

import outils.CSVParser;

public class TestCSVParser {
    
    public static void main(String[] args) throws Exception {
        List<List<String>> records = CSVParser.parse("src/tests/test.csv");
        System.out.println(records.get(0).get(1));
        System.out.println(records.get(1).get(0));

        HashMap<String, Integer> colonnes = CSVParser.getFirstColonne(records);
        System.out.println(colonnes.get("\"FICHIER\""));
        System.out.println(colonnes.get("nomNT"));
        System.out.println(colonnes.get("numéro"));

        HashMap<String, Integer> lignes = CSVParser.getFirstLigne(records);
        System.out.println(lignes.get("\"FICHIER\""));
        System.out.println(lignes.get("nomNT"));
        System.out.println(lignes.get("numéro"));

        System.out.println("Test CSVParser.parseRules");
        List<List<List<List<Integer>>>> rules = CSVParser.parseRules(records);
        System.out.println(rules.get(0).get(1).get(0));
        
        // Test .split
        // String test = "c&b|c";
        // String[] test_split = test.split("\\|");
        // System.out.println(test_split[0]);
    }
}
