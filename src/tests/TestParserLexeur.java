package tests;

import java.util.List;

import outils.Syntaxe.CSVAnalyseur_S;
import outils.Syntaxe.CSVParser;

public class TestParserLexeur {
    
    public static void main(String[] args) throws Exception {
        List<List<String>> records = CSVParser.parse("src/tests/Tableau_LL.csv");
        List<List<List<List<Integer>>>> rules = CSVParser.parseRules(records);
        System.out.println(rules.get(0).get(0).get(0));

        CSVAnalyseur_S analyseur = new CSVAnalyseur_S("src/tests/fibonaccii.adb.lex", "src/tests/Tableau_LL.csv");
        analyseur.analyse();
    }
}
