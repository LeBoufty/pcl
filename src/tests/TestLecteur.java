package tests;
import java.io.FileNotFoundException;
import java.io.IOException;

import outils.Logger;
import outils.OLD.Nettoyeur;
import outils.OLD.OLD_Lecteur;

public class TestLecteur {
    public static void main(String[] args) throws FileNotFoundException, IOException{
        OLD_Lecteur lecteur = new OLD_Lecteur("Programmes/salut.txt"); // Le chemin dépend d'où on est situé, en général on exécute depuis la racine du projet.
        System.out.println(lecteur.tete); // Affiche "s" car c'est le premier caractère de "salut"
        System.out.println(lecteur.lire()); // Afriche "a" car lire() avance la tête de 1
        for (int i = 0; i < 19; i++) {
            lecteur.lire(); // Sur la dernière itération, cette méthode affiche un avertissement, car la fin du fichier a été atteinte.
            System.out.print((int) lecteur.tete);
        }

        // Test du nettoyage de fichier
        Nettoyeur.nettoyerFichier("Programmes/undebut.adb");

        Logger.info("Un message d'information");
        Logger.warn("Un message d'avertissement");
        Logger.error("Un message d'erreur");
        //Logger.debug("Un message de débug qui ne sera pas vu par l'utilisateur");
    }
}
