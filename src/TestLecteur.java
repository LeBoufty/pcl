import java.io.FileNotFoundException;
import java.io.IOException;

public class TestLecteur {
    public static void main(String[] args) throws FileNotFoundException, IOException{
        Lecteur lecteur = new Lecteur("Programmes/salut.txt"); // Le chemin dépend d'où on est situé, en général on exécute depuis la racine du projet.
        System.out.print(lecteur.tete); // Affiche "s" car c'est le premier caractère de "salut"
        System.out.print(lecteur.lire()); // Afriche "a" car lire() avance la tête de 1
        for (int i = 0; i < 19; i++) {
            lecteur.lire(); // Sur la dernière itération, cette méthode affiche un avertissement, car la fin du fichier a été atteinte.
            System.out.print(lecteur.tete);
        }
    }
}
