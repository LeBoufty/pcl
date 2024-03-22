package arbres;

public class Parametre extends Instanciation {
    public Mode mode = Mode.NONE;
    public Parametre(IType t, String nom) {super(t, nom);}
    public Parametre(IType t, String nom, Mode mode) {super(t, nom); this.mode = mode;}

    public String produire() {
        System.out.println(nom + " Parametre type : " + type);
        System.out.println(nom + " Parametre variable : " + variable);
        System.out.println(nom + " Parametre mode : " + mode);

        return "";
    }
}
