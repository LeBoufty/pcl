package arbres;

import outils.Logger;

public class Parametre extends Instanciation {
    public Mode mode = Mode.NONE;
    public Parametre(IType t, String nom) {super(t, nom);}
    public Parametre(IType t, String nom, Mode mode) {super(t, nom); this.mode = mode;}

    public String produire() {
        Logger.debug(nom + " Parametre type : " + type);
        Logger.debug(nom + " Parametre variable : " + variable);
        Logger.debug(nom + " Parametre mode : " + mode);

        return "";
    }
}
