package tests;

import outils.Lexeur.Analyseur_L;;

public class TestLecteur2 {
    public static void main(String[] args) throws Exception {
        Analyseur_L al = new Analyseur_L("Programmes/fibonaccii.adb");
        
        al.analyse_l();
        
    }
}
