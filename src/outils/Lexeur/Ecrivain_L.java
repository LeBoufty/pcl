package outils.Lexeur;

import java.io.FileWriter;
import java.nio.charset.StandardCharsets;

public class Ecrivain_L {
    
    private FileWriter filewriter;
    private static final int OFFSET = 200;
    private static final char SAUT_DE_LIGNE = '&';

    public Ecrivain_L(String nom_fichier) throws Exception {
        this.filewriter = new FileWriter(nom_fichier, StandardCharsets.UTF_8);
    }

    public void ecrire_code(Integer code) throws Exception {
        this.filewriter.write((char) (code + OFFSET));
    }

    public void sauter_ligne() throws Exception {
        this.filewriter.write(SAUT_DE_LIGNE);
    }

    public void ecrire_tab_idf(Integer code_idf, String nom_idf) throws Exception {
        this.filewriter.write(code_idf.toString() + "=" + nom_idf + ";\n");
    }

    public void fermer() throws Exception {
        this.filewriter.close();
    }

}
