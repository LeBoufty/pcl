package arbres;

import java.util.ArrayList;

import outils.Logger;

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
    public AppelFonction(Fonction fonction) {
        this.fonction = fonction;
        this.params = new ArrayList<>();
        this.type = fonction.type;
    }
    public void ajouterParametre(Evaluable parametre) {
        this.params.add(parametre);
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
    public boolean valide() {
        boolean sortie = true;
        for (Evaluable p : params) {
            sortie = sortie && p.valide();
        }
        if (params.size() != fonction.params.size()) {
            Logger.error("Appel de fonction "+ this.fonction.nom +" invalide : nombre de paramètres incorrect");
            sortie = false;
        }
        for (int i = 0; i < params.size(); i++) {
            if (params.get(i).type != fonction.params.get(i).type) {
                Logger.error("Appel de fonction "+ this.fonction.nom +" invalide : paramètre "+ i +" de type incorrect");
                sortie = false;
            }
        }
        return sortie;
    }

    public String produire() {
        System.out.println("Appel de fonction "+ this.fonction.nom);
        return "";
    // TODO : côté appelé (dans le cours)
    }
}
