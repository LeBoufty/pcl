package arbres;

import java.util.ArrayList;

public class Acces extends Evaluable {
    public Variable variable;
    public String champ;
    public Acces(Variable v, String champ) {
        this.variable = v;
        this.type = v.type.getChamp(champ);
        this.champ = champ;
    }
    public String toString() {
        return variable.toString() + "." + champ;
    }
    public boolean valide() {
        boolean sortie = true;
        if (type instanceof Struct) {
            Struct s = (Struct) type;
            ArrayList<Champ> champs = s.champs;
            boolean drapo = false;
            for (Champ c : champs) {
                if (c.nom.equals(champ)) {
                    drapo = true;
                }
            }
            sortie = sortie && drapo;
        }
        return sortie && variable.valide() && type.valide();
    }
}
