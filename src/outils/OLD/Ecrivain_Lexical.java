package outils.OLD;

import java.io.FileWriter;
import java.nio.charset.StandardCharsets;

public class Ecrivain_Lexical {
    
    private FileWriter filewriter;
    private String chemin_fichier;
    private int num_ligne_en_ecriture;
    public static final int offset = 200;

    public Ecrivain_Lexical(String nom_fichier) throws Exception {
        this.chemin_fichier = nom_fichier;
        this.num_ligne_en_ecriture = 1;
        this.filewriter = new FileWriter(nom_fichier, StandardCharsets.UTF_8);
    }

    public void ecrire_mot_clef(Integer code) throws Exception {
        this.filewriter.write((char) (code + offset));
    }

    public void ecrire_idf(Integer code, Integer code_idf) throws Exception {
        this.filewriter.write((char) (code + offset));
        this.filewriter.write((char) (code_idf + offset));
    }

    public void ecrire_constante(Integer code, String constante) throws Exception {
        this.filewriter.write((char) (code + offset));
        this.filewriter.write(constante.charAt(1) + offset);
    }

    public void ecrire_chiffre(Integer code, String chiffre) throws Exception {
        this.filewriter.write((char) (code + offset));
        this.filewriter.write((char) (Integer.parseInt(chiffre) + offset));
    }

    public void sauter_ligne() throws Exception {
        this.filewriter.write((char) 38);
        this.num_ligne_en_ecriture++;
    }

    public void ecrire_tab_idf(Integer code_idf, String nom_idf) throws Exception {
        this.filewriter.write(code_idf.toString() + "=" + nom_idf + ";\n");
    }

    public void fermer() throws Exception {
        this.filewriter.close();
    }

    public int get_num_ligne_en_ecriture() {
        return this.num_ligne_en_ecriture;
    }

    public String get_chemin_fichier() {
        return this.chemin_fichier;
    }
}
