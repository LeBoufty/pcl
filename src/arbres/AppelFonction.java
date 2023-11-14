package arbres;

import java.util.ArrayList;

public class AppelFonction extends Evaluable {
    public Fonction fonction;
    public ArrayList<Evaluable> params;
    public AppelFonction(Fonction fonction, Evaluable[] parametres) {
        this.fonction = fonction;
        this.params = new ArrayList<>();
        for (Evaluable p : parametres) {
            this.params.add(p);
        }
        this.type = fonction.type;
    }
    public String toString() {
        String sortie = this.fonction.nom + "(";
        ArrayList<String> parStrings = new ArrayList<>();
        for (Evaluable p : params) {
            parStrings.add(p.toString());
        }
        sortie += String.join(", ", parStrings) + ")";
        return sortie;
    }
}
