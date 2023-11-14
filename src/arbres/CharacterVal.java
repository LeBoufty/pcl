package arbres;

public class CharacterVal extends Evaluable {
    public Evaluable valeur;
    public CharacterVal(Evaluable valeur) {
        this.valeur = valeur;
    }
    public String toString() {
        return "character'val(" + this.valeur.toString() + ")";
    }
    public boolean valide() {
        return this.valeur.valide();
    }
}
