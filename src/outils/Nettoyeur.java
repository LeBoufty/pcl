package outils;
import java.io.FileWriter;
import java.nio.charset.Charset;
import java.io.FileNotFoundException;
import java.io.IOException;

public class Nettoyeur {
    public static Charset fileCharset = OLD_Lecteur.fileCharset;
    private static char[] nonAcceptes = {'\n', '\t', '\r'};
    private static char[] espaces = {' ', '\n', '\t', '\r'};

    public static boolean estAccepte(char c) {
        boolean drapo = true;
        for (char k : nonAcceptes) {
            if (c == k) drapo = false;
        }
        return drapo;
    }

    public static boolean estUnEspace(char c) {
        boolean drapo = false;
        for (char k : espaces) {
            if (c == k) drapo = true;
        }
        return drapo;
    }

    // Renvoie le chemin vers le fichier nettoyé
    public static String nettoyerFichier(String nomFichier) throws FileNotFoundException, IOException {
        // Étape 1 : on crée le nom du fichier de sortie
        String[] nomSortie = nomFichier.split("\\.");
        nomSortie[0] += "_clean";
        String nomSortieStr = String.join(".", nomSortie);
        // Étape 2 : on réinitialise le fichier de sortie
        FileWriter reset = new FileWriter(nomSortieStr, fileCharset, false);
        reset.write("");
        reset.close();
        // Étape 3 : on initialise le lecteur et l'écrivain
        OLD_Lecteur lecteur = new OLD_Lecteur(nomFichier);
        FileWriter ecrivain = new FileWriter(nomSortieStr, fileCharset, true);
        // On utilise des drapeaux en guise de mémoire.
        boolean lastWasSpace = false;
        boolean lastWasMinus = false;
        boolean commentaire = false;
        // Étape 4 : On écrit tout le fichier d'origine sans les \n et les \t
        while (lecteur.tete != '\0') {
            if (estAccepte(lecteur.tete)) {
                // On vérifie qu'on ne soit pas dans un commentaire
                if (lecteur.tete == '-') {
                    if (lastWasMinus) commentaire = true;
                    lastWasMinus = true;
                } else { // On n'écrit les - que per ce biais là, pour éviter que le premier - d'un commentaire soit pris dans le bourbier.
                    if (lastWasMinus && !commentaire) ecrivain.write('-');
                    lastWasMinus = false;
                }
                // Si tout est bon, on écrit le caractère
                if (!(lastWasSpace && lecteur.tete == ' ') && !commentaire && lecteur.tete != '-') {
                    ecrivain.write(lecteur.tete);
                }
                if (estUnEspace(lecteur.tete)) lastWasSpace = true; else lastWasSpace = false;
            }
            // On finit les commentaires à un retour de ligne
            if (lecteur.tete == '\r' || lecteur.tete == '\n') commentaire = false;
            // Caractère suivant !!
            lecteur.lire();
        }
        ecrivain.close();
        Logger.info("Fichier "+nomFichier+" nettoyé et enregistré en tant que "+nomSortieStr);
        return nomSortieStr;
    }
}
