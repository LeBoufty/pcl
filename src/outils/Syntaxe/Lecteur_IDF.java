package outils.Syntaxe;

import java.io.FileReader;
import java.util.List;

public class Lecteur_IDF {

    private final char IDF_EGAL = '=';
    private final char IDF_FIN = ';';

    private FileReader filereader;
    private List<String> liste_idf;

    public Lecteur_IDF(String chemin_fichier) throws Exception {
        this.liste_idf = new java.util.ArrayList<String>();
        this.filereader = new FileReader(chemin_fichier);
    }

    public void lire() throws Exception {
        int nextChar = this.filereader.read();

        while (nextChar != -1) {
            while (nextChar != IDF_EGAL && nextChar != -1) {
                nextChar = this.filereader.read();
            }
            nextChar = this.filereader.read();

            String valeur = "";
            while (nextChar != IDF_FIN && nextChar != -1) {
                valeur += (char) nextChar;
                nextChar = this.filereader.read();
            }

            this.liste_idf.add(valeur);
            nextChar = this.filereader.read();
        }
    }

    public List<String> getListe_idf() {
        return this.liste_idf;
    }

    
}
