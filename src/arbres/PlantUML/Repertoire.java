package arbres.PlantUML;

import java.util.HashMap;
import arbres.Noeud;

public class Repertoire {
    private static HashMap<String, Integer> attributions = new HashMap<String, Integer>();
    private static String get(String nom) {
        if (attributions.containsKey(nom)) {
            attributions.put(nom, attributions.get(nom)+1);
            return nom + attributions.get(nom);
        } else {
            attributions.put(nom, 0);
            return nom;
        }
    }
    public static String getNewID(Noeud n) {
        return get(n.getClass().getSimpleName());
    }
}
