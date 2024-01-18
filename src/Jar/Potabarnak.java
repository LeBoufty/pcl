package Jar;

import java.util.List;

import outils.Logger;
import outils.Lexeur.Analyseur_L;

public class Potabarnak {
    
    public static void main(String[] args) throws Exception {
        // Programme destinné à être compilé en jar
        // Le but est de pouvoir lancer le projet en ligne de commande en donnant en argument le chemin du fichier à analyser et le chemin du fichier .csv contenant la grammaire

        // Debug
        // args = new String[2];
        // args[0] = "Programmes/Fonctionne/hello_world.adb";
        // args[1] = "src/tests/Tableau_LL.csv";

        // On vérifie que l'utilisateur a bien donné deux arguments
        if (args.length != 2) {
            System.out.println("Veuillez donner le chemin du fichier à analyser et la grammaire en argument");
            return;
        }

        // On vérifie que le fichier donné en argument est bien un fichier .adb
        if (!args[0].endsWith(".adb")) {
            System.out.println("Veuillez donner un fichier .adb en premier argument");
            return;
        }

        // On vérifie que le fichier donné en argument est bien un fichier .csv
        if (!args[1].endsWith(".csv")) {
            System.out.println("Veuillez donner un fichier .csv en second argument");
            return;
        }

        // On vérifie que les fichiers donnés en argument existent
        java.io.File file1 = new java.io.File(args[0]);
        if (!file1.exists()) {
            System.out.println("Le fichier donné en argument n'existe pas");
            return;
        }
        java.io.File file2 = new java.io.File(args[1]);
        if (!file2.exists()) {
            System.out.println("Le fichier donné en argument n'existe pas");
            return;
        }

        // On vérifie que le fichier donné en argument est bien un fichier
        if (!file1.isFile()) {
            System.out.println("Le fichier donné en argument n'est pas un fichier");
            return;
        }
        if (!file2.isFile()) {
            System.out.println("Le fichier donné en argument n'est pas un fichier");
            return;
        }

        // On commence l'analyse lexicale
        Logger.milestone("Début de l'analyse lexicale");
        Analyseur_L al = new Analyseur_L(args[0]);
        al.analyse_l();

        // Test si on est en erreur lexicale
        if (al.get_en_erreur()) {
            Logger.milestone("Erreur lexicale, arrêt de la compilation");
            return;
        }

        // On écrit le fichier .lex
        Logger.info("Écriture du fichier " + args[0] + ".lex");

        // On écrit le fichier .idf
        Logger.info("Écriture du fichier " + args[0] + ".idf");

        // On commence l'analyse syntaxique
        Logger.milestone("Début de l'analyse syntaxique");

        // On ouvre la grammaire
        Logger.info("Lecture de la grammaire " + args[1]);
        List<List<String>> records = outils.Syntaxe.CSVParser.parse(args[1]);
        List<List<List<List<Integer>>>> rules = outils.Syntaxe.CSVParser.parseRules(records);

        // On analyse le fichier .lex
        Logger.info("Analyse du fichier " + args[0] + ".lex");
        outils.Syntaxe.CSVAnalyseur_S analyseur = new outils.Syntaxe.CSVAnalyseur_S(args[0] + ".lex", args[1], args[0] + ".idf");
        analyseur.analyse();

        // On test si on est en erreur syntaxique
        if (analyseur.getEn_erreur()) {
            Logger.error("Erreur syntaxique, arrêt de la compilation");
            return;
        }
        Logger.milestone("Analyse syntaxique terminée, écriture de l'arbre de dérivation " + args[0] + ".der.puml");
        analyseur.affiche_UML(args[0] + ".der.puml");

        // On commence l'élagage
        Logger.milestone("Début de l'élagage");
        analyseur.elaguer();
        Logger.milestone("Élagage terminé, écriture de l'arbre de dérivation " + args[0] + ".elag.puml");

        // On écrit l'arbre élagué
        analyseur.affiche_UML(args[0] + ".elag.puml");

        
    }
}
