package arbres;

import outils.TDS.TDS_gen;

public enum OperateurUnaire {
    // Placeholder pour quand on crée l'opération
    NONE("", Type.NULLTYPE),
    // Opérateurs sur les entiers
    MOINS("-", Type.INTEGER),
    // Opérateurs sur les booléens
    NOT("not", Type.BOOLEAN);

    private String symbole;
    private Type type;

    private OperateurUnaire(String symbole, Type type) {
        this.symbole = symbole;
        this.type = type;
    }

    public String toString() {
        return symbole;
    }

    public Type getType() {
        return type;
    }

    public int getvalue(Constante droite) {
        switch (this) {
            case MOINS:
                return -droite.valeur;
            case NOT:
                return droite.valeur == 0 ? 1 : 0;
            default:
                return 0;
        }
    }

    public String produire(TDS_gen tds_actuelle) {
        String res = "";
        switch (this) {
            case MOINS:
                res += "LDR x0, [sp] // Opération moins\n";
                res += "NEG x0, x0 // Opération moins\n";
                res += "STR x0, [sp] // Opération moins\n";
                return res;
            case NOT:
                return "EOR x0, x0, #1 // Opération not\n";
            default:
                return "";
        }
    }
}
