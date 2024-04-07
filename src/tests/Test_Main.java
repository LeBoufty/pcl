package tests;

import arbres.Noeud;
import outils.Lexeur.Analyseur_L;
import outils.Syntaxe.CSVAnalyseur_S;
import outils.Error_list;
import outils.Logger;


public class Test_Main {
    
    public static void main(String[] args) throws Exception {
        try {

        String programme = "Programmes/Fonctionne/undebut.adb";
        programme = "Programmes/testsem/erreur6.adb";

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


        // Création de la table des symboles et liaisons des variables
        AST.TDS_creation(null,0);

        // Affichage de la TDS
        Logger.info(AST.getTDS().toString());

        // Test de la validité de l'AST
        boolean valide = AST.valide();

        if (valide) {
            Logger.info("Valide : " + valide);
        } else {
            Logger.error("Valide : " + valide);
        }

        Logger.info(AST.toString());



        } catch (Exception e) {
            Logger.error("Erreur, arrêt du programme");
        }
    }
}
