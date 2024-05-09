package tests;

import arbres.Noeud;
import outils.Error_list;
import outils.Logger;
import outils.Lexeur.Analyseur_L;
import outils.Syntaxe.CSVAnalyseur_S;

public class Test_Semantique {
    
    public static void main(String[] args) throws Exception {

        String programme = "Programmes/testsem/z_test_sem_total.adb";

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
        // Logger.debug(AST.getTDS().toString());

        boolean valide = AST.valide();
        Logger.debug("Erreur AST : " + !valide);
        Logger.debug("Erreur TDS : " + Error_list.tdsgen);
        Logger.debug("Erreur Semantique : " + Error_list.semantique);
        Logger.debug("Erreur Langage : " + Error_list.elaguage);
        Logger.debug("Erreur Traduction : " + Error_list.traduction);


    }
}

// find . -type f \( -name "*.pu" -o -name "*.puml" -o -name "*.idf" -o -name "*.lex" \) -exec rm -f {} +
