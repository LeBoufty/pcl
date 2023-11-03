package tests;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import outils.Analyseur_Lexical;

public class TestLecteur2 {
    public static void main(String[] args) throws Exception {
        Analyseur_Lexical al = new Analyseur_Lexical("Programmes/Hello_World.adb");
        
        al.analyse();
    }
}
