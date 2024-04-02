package arbres;

import java.util.HashMap;
import java.util.ArrayList;

import outils.Logger;
import outils.TDS.TDS_gen;

public class Operation extends Evaluable {
    public Evaluable gauche;
    public Evaluable droite;
    private Operateur operateur;
    public TDS_gen tds_parent = null;

    public Operation(Evaluable g, Evaluable d, Operateur o) {
        this.gauche = g; this.droite = d; this.operateur = o;
        if (g.type != d.type) {
            Logger.warn("Opération "+ this.toString() +" : types différents");
            // Un peu moche : si les types ne correspondent pas on prend NULL.
            this.type = Type.NULLTYPE;
        }
        // On prend le type de sortie de l'opérateur.
        else this.type = operateur.getType();
    }
    public Operation() {
        this.gauche = null; this.droite = null; this.operateur = Operateur.NONE;
        this.type = Type.NULLTYPE;
    }
    public Operateur getOperateur() {
        return this.operateur;
    }
    public void setOperateur(Operateur o) {
        this.operateur = o;
        this.type = o.getType();
    }
    public boolean valide() {
        boolean sortie = true;
        if (this.gauche == null) {
            Logger.error("Opération "+ this.hashCode() +" invalide : membre gauche null");
            sortie = false;
        } else if (this.droite == null) {
            Logger.error("Opération "+ this.hashCode() +" invalide : membre droit null");
            sortie = false;
        } else {
            sortie = this.gauche.valide() && this.droite.valide();
            if (this.gauche.type != this.droite.type) {
                Logger.error("Opération "+ this.toString() +" invalide : types différents");
                sortie = false;
            }
        }
        return sortie;
    }
    public String toString() {
        return this.gauche.toString() +" "+ this.operateur.toString() +" "+ this.droite.toString();
    }

    public String produire() {
        System.out.println("Operation gauche : " + this.gauche);
        System.out.println("Operation droite : " + this.droite);

        String res = "";

        if (this.gauche.isConstant() && this.droite.isConstant()) {
            return "MOV x0, #"+this.operateur.getvalue((Constante) this.gauche, (Constante) this.droite)+ " // On met le résultat de l'opération dans x0 \n";
        }
        else if (this.gauche.isConstant()) {
            this.droite.produire();
            res += "MOV x1, x0 // On met la valeur de la droite dans x1 \n";
            res += "MOV x0, #"+((Constante) this.gauche).valeur+" // On met la valeur de la gauche dans x0 \n";
            res += this.operateur.toString()+" x0, x1, x0 // On effectue l'opération \n";
        }
        else if (this.droite.isConstant()) {
            this.gauche.produire();
            res += "MOV x1, x0 // On met la valeur de la gauche dans x1 \n";
            res += "MOV x0, #"+((Constante) this.droite).valeur+" // On met la valeur de la droite dans x0 \n";
            res += this.operateur.toString()+" x0, x1, x0 // On effectue l'opération \n";
        }
        else {
            this.gauche.produire();
            res += "MOV x1, x0 // On met la valeur de la gauche dans x1 \n";
            res += this.droite.produire();
            res += this.operateur.toString()+" x0, x1, x0 // On effectue l'opération \n";
        }
        return res;
        //TODO : gestion des registres
    }

    public void TDS_creation(TDS_gen Parent, int type_variable) {
        // Ne fait rien
    }

    public void TDS_link(TDS_gen Parent) {
        this.tds_parent = Parent;
        this.gauche.TDS_link(Parent);
        this.droite.TDS_link(Parent);
    }

    public TDS_gen getTDS(){
        return this.tds_parent;
    }

    public void TDS_variable(HashMap<String, ArrayList<Integer>> variables) {
        this.gauche.TDS_variable(variables);
        this.droite.TDS_variable(variables);
    }
}
