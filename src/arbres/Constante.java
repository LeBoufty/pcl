package arbres;

import outils.Logger;

public class Constante extends Evaluable {
    public int valeur;
    public Constante(int c) {
        this.valeur = c;
        this.type = Type.INTEGER;
    }
    public Constante(char c) {
        this.valeur = (int) c;
        this.type = Type.CHARACTER;
    }
    public Constante(boolean c) {
        this.valeur = c ? 1 : 0;
        this.type = Type.BOOLEAN;
    }
    public Constante() {
        this.valeur = 0;
        this.type = Type.NULLTYPE;
    }
    public String toString() {
        switch ((Type) type) {
            case INTEGER:
                return String.valueOf(valeur);
            case CHARACTER:
                return "'"+String.valueOf((char) valeur)+"'";
            case BOOLEAN:
                return String.valueOf(valeur == 1);
            case NULLTYPE:
                return "null";
        }
        Logger.error(this.hashCode()+".toString() : type inconnu");
        return "";
    }
    public boolean valide() {
        return true;
    }

    public void produire() {
         System.out.println("constante");
// TODO : probablement juste retourner la valeur
    }
}
