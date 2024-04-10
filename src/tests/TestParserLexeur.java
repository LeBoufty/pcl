package tests;

// ?import java.util.List;

import arbres.Noeud;
import arbres.PlantUML.GenerateurPUML;
import outils.Error_list;
import outils.GestionFichier;
import outils.Logger;
import outils.Lexeur.Analyseur_L;
import outils.Syntaxe.CSVAnalyseur_S;
// ?import outils.Syntaxe.CSVParser;
// ?import outils.TDS.TDS_IDF;

public class TestParserLexeur {
    
    public static void main(String[] args) throws Exception {
        // ?List<List<String>> records = CSVParser.parse("src/tests/Tableau_LL.csv");
        // ?List<List<List<List<Integer>>>> rules = CSVParser.parseRules(records);
        //System.out.println(rules.get(0).get(0).get(0));

        String programme = "Programmes/Fonctionne/hello_world.adb";
        programme = "Programmes/Fonctionne/fibonaccii.adb";
        //programme = "Programmes/Fonctionne/quelquesinstructions.adb";
        // programme = "Programmes/Fonctionne/undebut.adb";
        //programme = "Programmes/Fonctionne/traduisible.adb";
        //programme = "Programmes/Fonctionne/williamfaure.adb";
        //programme = "Programmes/Fonctionne/recordiii.adb";
        //programme = "Programmes/Fonctionne/testctrlsem.adb";
        programme = "Programmes/testAdasimples/Addition1.ada";
        //programme = "Programmes/Fonctionne/TurboMegaTest.ada";
        programme = "Programmes/testAdasimples/Parentheses.ada";

        // Tests sémantiques
        // programme = "Programmes/testsem/divparzero.adb";
        // programme = "Programmes/testsem/fctnondef.adb";
        //programme = "Programmes/testsem/mauvaisop.adb";
        //programme = "Programmes/testsem/mauvaistype.adb";
        programme = "Programmes/testsem/varnondef.adb";
        //programme = "Programmes/testsem/erreur2.adb";
        // programme = "Programmes/testsem/erreur6.adb";
        //programme = "Programmes/Fonctionne/undebut.adb";

        Analyseur_L al = new Analyseur_L(programme);
        al.analyse_l();

        CSVAnalyseur_S analyseur = new CSVAnalyseur_S(programme + ".lex", "src/tests/Tableau_LL.csv", programme + ".idf");
        analyseur.analyse();

        if (analyseur.getEn_erreur()) {
            Logger.error("Erreur lors de l'analyse syntaxique, arrêt du programme");
            return;
        }

        Noeud AST = analyseur.elaguer();
        analyseur.affiche_UML(programme + ".puml");

        if (Error_list.traduction) {
            Logger.error("Erreur lors de la traduction, arrêt du programme");
            return;
        }

        Logger.debug(AST.toString());

        AST.TDS_creation(null,0);;
        Logger.debug(AST.toString());
        Logger.debug(AST.getTDS().toString());
        // TDS_IDF.affiche_table_idf(TDS_IDF.table_idf(AST.getTDS()));

        GenerateurPUML puml = new GenerateurPUML(AST, programme+".ast.pu");
        puml.generer();
        //Logger.debug(AST.getTDS().toString());
        boolean valide = AST.valide();
        Logger.debug("Valide : " + valide);
        AST.produire(null); 
        GestionFichier.produirefichier(programme.substring(0, programme.length()-4) + ".s");
        // GestionFichier.produirefichier("test.s");

    }
}
