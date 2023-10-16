import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

public class Lecteur {
    private FileReader fileReader;
    public char tete;
    public String cheminFichier;
    private static int nbLecteurs = 0;
    private int numLecteur;

    public Lecteur(String nomFichier) throws FileNotFoundException, IOException {
    // Constructeur prenant comme argument le chemin vers un fichier sous la forme d'un string
        try {
            File fichier = new File(nomFichier);
            this.fileReader = new FileReader(fichier, StandardCharsets.UTF_8);
            this.tete = (char) fileReader.read();
            this.cheminFichier = nomFichier;
            this.numLecteur = nbLecteurs;
            nbLecteurs++;
        } catch (FileNotFoundException e) {
            throw new FileNotFoundException(nomFichier + " introuvable");
        }
    }

    public Lecteur(File fichier) throws FileNotFoundException, IOException {
    // Constructeur prenant comme argument un fichier
        try {
            this.fileReader = new FileReader(fichier);
            this.tete = (char) fileReader.read();
            this.cheminFichier = fichier.getPath().toString();
            this.numLecteur = nbLecteurs;
            nbLecteurs++;
        } catch (FileNotFoundException e) {
            throw new FileNotFoundException(fichier.toString() + " introuvable");
        }
    }

    public char lire() throws IOException {
    // Avance d'un caractère et retourne sa valeur
        int nextChar = fileReader.read();
        if (nextChar == -1) {
            System.out.println("AVERTISSEMENT : le lecteur "+this.toString()+" a atteint la fin de "+this.cheminFichier+" et ne peut plus le lire");
            this.tete = '\0';
        } else {
            this.tete = (char) nextChar;
        }
        return this.tete;
    }

    public String toString() {
        return "Lecteur " + String.valueOf(this.numLecteur);
    }
}