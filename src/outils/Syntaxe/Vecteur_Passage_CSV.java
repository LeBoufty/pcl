package outils.Syntaxe;

import java.util.HashMap;


import outils.Lexeur.Dico_L;

public class Vecteur_Passage_CSV {
    
    private HashMap<String, Integer> dico_terminaux_CSV;
    private HashMap<Integer, String> dico_terminaux_Lexeur;

    public Vecteur_Passage_CSV(HashMap<String, Integer> dico_terminaux_CSV) {
        this.dico_terminaux_CSV = dico_terminaux_CSV;
        Dico_L dico = new Dico_L();
        dico.set_dico_default_CSV();

        HashMap<String, Integer> dico_terminaux_Lexeur_inverse = dico.get_dico_terminaux();
        this.dico_terminaux_Lexeur = new HashMap<Integer, String>();
        for (String mot : dico_terminaux_Lexeur_inverse.keySet()) {
            this.dico_terminaux_Lexeur.put(dico_terminaux_Lexeur_inverse.get(mot), mot);
        }
    }
    
    // Retourne le vecteur de passage du lexeur vers le CSV
    public int get_vecteur_passage_Lexeur_CSV(int code) {
        String mot = this.dico_terminaux_Lexeur.get(code);
        if (mot == null) {
            return -1;
        }
        if (mot == ",") {
            mot = "virgule";
        }
        if (mot == "or else") {
            mot = "orelse";
        }
        if (mot == "and then") {
            mot = "andthen";
        }

        return this.dico_terminaux_CSV.get(mot);
    }

}
