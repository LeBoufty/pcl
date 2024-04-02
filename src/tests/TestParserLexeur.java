package tests;

// ?import java.util.List;

import arbres.Noeud;
import arbres.PlantUML.GenerateurPUML;
import outils.GestionFichier;
import outils.Logger;
import outils.Lexeur.Analyseur_L;
import outils.Syntaxe.CSVAnalyseur_S;
// ? import outils.Syntaxe.CSVParser;

public class TestParserLexeur {
    
    public static void main(String[] args) throws Exception {
        // ?List<List<String>> records = CSVParser.parse("src/tests/Tableau_LL.csv");
        // ?List<List<List<List<Integer>>>> rules = CSVParser.parseRules(records);
        //System.out.println(rules.get(0).get(0).get(0));

        String programme = "Programmes/Fonctionne/hello_world.adb";
        programme = "Programmes/Fonctionne/fibonaccii.adb";
        //programme = "/home/toyhugs/gitlab/krafft5u1/Programmes/Fonctionne/andthenorelse.adb";
        //programme = "/home/toyhugs/gitlab/krafft5u1/Programmes/Fonctionne/fibonaccii.adb";
        //programme = "Programmes/Fonctionne/quelquesinstructions.adb";
        programme = "Programmes/Fonctionne/undebut.adb";
        //programme = "Programmes/Fonctionne/quelquesinstructions.adb";
        //programme = "Programmes/Fonctionne/traduisible.adb";
        //programme = "Programmes/Fonctionne/williamfaure.adb";
        programme = "Programmes/Fonctionne/recordiii.adb";
        programme = "Programmes/Fonctionne/testctrlsem.adb";

        // Tests sémantiques
        //programme = "Programmes/testsem/divparzero.adb";
        //programme = "Programmes/testsem/fctnondef.adb";
        //programme = "Programmes/testsem/mauvaisop.adb";
        //programme = "Programmes/testsem/mauvaistype.adb";
        //programme = "Programmes/testsem/varnondef.adb";
        //programme = "Programmes/testsem/erreur2.adb";
        //programme = "Programmes/testsem/erreur5.adb";

        Analyseur_L al = new Analyseur_L(programme);
        al.analyse_l();

        CSVAnalyseur_S analyseur = new CSVAnalyseur_S(programme + ".lex", "src/tests/Tableau_LL.csv", programme + ".idf");
        analyseur.analyse();
        Noeud AST = analyseur.elaguer();
        analyseur.affiche_UML(programme + ".puml");

        Logger.debug(AST.toString());

        AST.TDS_creation(null,0);
        Logger.debug(AST.getTDS().toString());
        GenerateurPUML puml = new GenerateurPUML(AST, programme+".ast.pu");
        puml.generer();
        //Logger.debug(AST.getTDS().toString());
        boolean valide = AST.valide();
        Logger.debug("Valide : " + valide);
        AST.produire(); 
        // *GestionFichier.produirefichier(programme + ".s");
        GestionFichier.produirefichier("test.s");

    }
}
