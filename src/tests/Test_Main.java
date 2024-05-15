package tests;

import arbres.Noeud;
import outils.Error_list;
import outils.Logger;
import outils.Lexeur.Analyseur_L;
import outils.Syntaxe.CSVAnalyseur_S;
import outils.GestionFichier;


public class Test_Main {
    
    public static void main(String[] args) throws Exception {
        try {

        Logger.debug = false;

        String programme = "Programmes/Test_Python/diff_tribo_fibo.ada";
        //programme = "Programmes/Fonctionne/TurboMegaTest.ada";
        

        // Création de l'analyseur lexical
        Analyseur_L al = new Analyseur_L(programme);

        // Lancement de l'analyse lexicale
        al.analyse_l();

        // Création de l'analyseur syntaxique avec le fichier .lex, le tableau LL et le fichier .idf
        CSVAnalyseur_S analyseur = new CSVAnalyseur_S(programme + ".lex", "src/tests/Tableau_LL.csv", programme + ".idf");

        // Lancement de l'analyse syntaxique
        analyseur.analyse();

        // Si une erreur est survenue lors de l'analyse syntaxique, on arrête le programme
        if (analyseur.getEn_erreur()) {
            Logger.error("Erreur lors de l'analyse syntaxique, arrêt du programme");
            return;
        }


        // Transformation de l'anayseur syntaxique en AST puis élaguage
        Noeud AST = analyseur.elaguer();

        if (Error_list.elaguage) {
            Logger.error("Erreur lors de l'élaguage, arrêt du programme");
            return;
        }

        if (Error_list.traduction) {
            Logger.error("Erreur lors de la traduction, arrêt du programme");
            return;
        }


        // Création de la table des symboles et liaisons des variables
        AST.TDS_creation(null,0);

        // Affichage de la TDS
        // Logger.info(AST.getTDS().toString());

        // Test de la validité de l'AST
        boolean valide = AST.valide() && !Error_list.tdsgen && !Error_list.semantique && !Error_list.elaguage && !Error_list.traduction;

        if (valide) {
            Logger.info("Programme valide");
            AST.produire(null);
            GestionFichier.produirefichier(programme.substring(0, programme.length()-4) + ".s");

        } else {
            Logger.info("Erreur AST : " + !valide);
            Logger.info("Erreur TDS : " + Error_list.tdsgen);
            Logger.info("Erreur Semantique : " + Error_list.semantique);
            Logger.info("Erreur Langage : " + Error_list.elaguage);
            Logger.info("Erreur Traduction : " + Error_list.traduction);
            Logger.error("Arrêt du programme");
            return;
        }

        } catch (Exception e) {
            Logger.error(e.getMessage());
            Logger.error("Erreur, arrêt du programme");
        }
    }
}
