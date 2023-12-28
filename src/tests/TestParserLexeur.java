package tests;

import java.util.List;

import outils.Lexeur.Analyseur_L;
import outils.Syntaxe.CSVAnalyseur_S;
import outils.Syntaxe.CSVParser;

public class TestParserLexeur {
    
    public static void main(String[] args) throws Exception {
        List<List<String>> records = CSVParser.parse("src/tests/Tableau_LL.csv");
        List<List<List<List<Integer>>>> rules = CSVParser.parseRules(records);
        System.out.println(rules.get(0).get(0).get(0));

        String programme = "Programmes/Fonctionne/ada_link_list.adb";
        //programme = "Programmes/Fonctionne/fibonaccii.adb";
        Analyseur_L al = new Analyseur_L(programme);
        al.analyse_l();

        CSVAnalyseur_S analyseur = new CSVAnalyseur_S(programme + ".lex", "src/tests/Tableau_LL.csv");
        analyseur.analyse();
    }
}
