package arbres.PlantUML;

import java.util.HashMap;
import arbres.Noeud;

// Le répertoire est une classe qui permet de générer des noms uniques pour chaque noeud.
public class Repertoire {
    private static HashMap<String, Integer> attributions = new HashMap<String, Integer>();
    private static String get(String nom) {
        if (attributions.containsKey(nom)) {
            // Si la classe est déjà dans le répertoire, on incrémente son compteur.
            attributions.put(nom, attributions.get(nom)+1);
            return nom + attributions.get(nom);
        } else {
            // Si la classe n'est pas dans le répertoire, on l'ajoute.
            attributions.put(nom, 0);
            return nom;
        }
    }
    public static String getNewID(Noeud n) {
        return get(n.getClass().getSimpleName());
    }
}
