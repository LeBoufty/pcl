package outils;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;

public class Lecteur {
    private FileReader fileReader;
    public char tete;
    public String cheminFichier;
    private static int nbLecteurs = 0;
    private int numLecteur;
    public static Charset fileCharset = StandardCharsets.UTF_8;

    public Lecteur(String nomFichier) throws FileNotFoundException, IOException {
    // Constructeur prenant comme argument le chemin vers un fichier sous la forme d'un string
        try {
            File fichier = new File(nomFichier);
            this.fileReader = new FileReader(fichier, fileCharset);
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
            Logger.info("Fin de "+cheminFichier+" atteinte par "+this.toString());
            this.tete = '\0';
        } else if (nextChar >= 128) {
            Logger.error(cheminFichier+" contient des caractères non-ASCII"); // Renvoie une erreur via throw
            throw new IOException(cheminFichier+" contient des caractères non-ASCII");
        }
        else {
            this.tete = (char) nextChar;
        }
        return this.tete;
    }

    public String lire_mot() throws IOException {
    // Lit tout un mot - S'occupe aussi de retirer les commentaires - Le transforme en minuscules
    
        while (tete_est_un_blanc()) { // On ignore les caractères de contrôle et les espaces (y compris les retours à la ligne et les tabulations)
            this.lire();
        }

        if (this.tete == '\0') {
            return null;
        }

        boolean est_un_symbole;
        if (tete_est_un_alpanum()) { // Si le premier caractère est un chiffre
            est_un_symbole = false;
        }
        else {
            est_un_symbole = true;
        }

        String mot = "";
        while (tete_est_un_symbole() == est_un_symbole && (tete_est_un_alpanum() || tete_est_un_symbole()) ) { // On lit le mot jusqu'à ce qu'on rencontre un caractère qui n'est pas du même type que le premier
            mot += Character.toLowerCase(this.tete);
            this.lire();
        }
        
        if (mot.contentEquals("--")) { // Si on a lu un commentaire
            while (this.tete != '\n' && this.tete != '\0') { // On ignore le commentaire
                this.lire();
            }
            return lire_mot(); // On relit un mot
        }

        return mot;
    }

    public boolean tete_est_un_alpanum() {
        return (this.tete_est_un_chiffre() || this.tete_est_une_lettre());
    }

    public boolean tete_est_un_chiffre() {
        return (this.tete >= 48 && this.tete <= 57);
    }

    public boolean tete_est_une_lettre() {
        return ((this.tete >= 65 && this.tete <= 90) || (this.tete >= 97 && this.tete <= 122));
    }

    public boolean tete_est_un_symbole() {
        return ((this.tete >= 33 && this.tete <= 47) || (this.tete >= 58 && this.tete <= 64) || (this.tete >= 91 && this.tete <= 96) || (this.tete >= 123 && this.tete <= 126));
    }

    public boolean tete_est_un_blanc() {
        return ((this.tete >= 9 && this.tete <= 32));
    }

    public String toString() {
        return "Lecteur " + String.valueOf(this.numLecteur);
    }
}