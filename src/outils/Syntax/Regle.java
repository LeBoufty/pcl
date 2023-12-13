package outils.Syntax;

import java.util.HashMap;

public class Regle {
    
    private int nb_regle = 0;
    private HashMap<Integer, Integer[]> regle;

    public Regle() {
        regle = new HashMap<Integer, Integer[]>();
        nb_regle = 0;
    }

    public int add(Integer[] regle) {
        this.regle.put(nb_regle, regle);
        nb_regle++;
        return nb_regle - 1;
    }

    public Integer[] get(int i) {
        return regle.get(i);
    }

    public int getNb_regle() {
        return nb_regle;
    }
    
}
