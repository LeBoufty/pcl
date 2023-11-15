package arbres;

public class Constante extends Evaluable {
    public int valeur;
    public Constante(int c) {
        this.valeur = c;
        this.type = Type.INTEGER;
    }
    public String toString() {
        return String.valueOf(valeur);
    }
    public boolean valide() {
        return true;
    }
}
