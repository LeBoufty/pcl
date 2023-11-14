package tests;

import outils.Analyseur_Lexical;

public class TestLecteur2 {
    public static void main(String[] args) throws Exception {
        Analyseur_Lexical al = new Analyseur_Lexical("Programmes/fibonacci.adb");
        
        al.analyse();
    }
}
