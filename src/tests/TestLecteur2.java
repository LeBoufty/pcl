package tests;

import java.io.FileNotFoundException;
import java.io.IOException;

import outils.Lecteur;

public class TestLecteur2 {
    public static void main(String[] args) throws FileNotFoundException, IOException {
        // Test lecture mot
        Lecteur lecteur = new Lecteur("Programmes/salut.txt");
        String mot = lecteur.lire_mot();
        while (mot != null) {
            System.out.println(mot);
            mot = lecteur.lire_mot();
        }

    }
}
