package outils.OLD.Syntax_OLD;

import java.util.HashMap;

public class Regle {
    
    private int nb_regle;
    private HashMap<Integer, Integer[]> regle;
    private Integer[] first_stack;

    public Regle() {
        regle = new HashMap<Integer, Integer[]>();
        nb_regle = 0;
        first_stack = new Integer[4];
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
    
    public Integer[] getFirst_stack() {
        return first_stack;
    }

    public void setFirst_stack(Integer[] first_stack) {
        this.first_stack = first_stack;
    }
}
