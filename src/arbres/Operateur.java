package arbres;

public enum Operateur {
    // Placeholder pour quand on crée l'opération
    NONE("", Type.NULLTYPE),
    // Opérations sur entiers
    PLUS("+", Type.INTEGER), MOINS("-", Type.INTEGER),
    FOIS("*", Type.INTEGER), DIV("/", Type.INTEGER),
    REM("rem", Type.INTEGER),
    // Tests sur entiers
    SUPERIEUR(">", Type.BOOLEAN), INFERIEUR("<", Type.BOOLEAN),
    SUPERIEUR_EGAL(">=", Type.BOOLEAN), INFERIEUR_EGAL("<=", Type.BOOLEAN),
    DIFFERENT("/=", Type.BOOLEAN), EGAL("=", Type.BOOLEAN),
    // Portes logiques
    AND("and", Type.BOOLEAN), OR("or", Type.BOOLEAN),
    AND_THEN("and then", Type.BOOLEAN), OR_ELSE("or else", Type.BOOLEAN);

    // "symbole" sert pour l'affichage.
    private String symbole;
    // "type" est le type de sortie de l'opérateur (et non ce qu'il prend)
    private Type type;
    // Il se peut que certains opérateurs fonctionnent sur les caractères.
    // On pourra les gérer différemment, en ajoutant des opérateurs, genre PLUSCHAR...

    private Operateur(String symbole, Type type) {
        this.symbole = symbole;
        this.type = type;
    }

    public String toString() {
        return symbole;
    }

    public Type getType() {
        return type;
    }

    public int getvalue(Constante gauche, Constante droite) {
        switch (this) {
            case PLUS:
                return gauche.valeur + droite.valeur;
            case MOINS:
                return gauche.valeur - droite.valeur;
            case FOIS:
                return gauche.valeur * droite.valeur;
            case DIV:
                return gauche.valeur / droite.valeur;
            case REM:
                return gauche.valeur % droite.valeur;
            case SUPERIEUR:
                return gauche.valeur > droite.valeur ? 1 : 0;
            case INFERIEUR:
                return gauche.valeur < droite.valeur ? 1 : 0;
            case SUPERIEUR_EGAL:
                return gauche.valeur >= droite.valeur ? 1 : 0;
            case INFERIEUR_EGAL:
                return gauche.valeur <= droite.valeur ? 1 : 0;
            case DIFFERENT:
                return gauche.valeur != droite.valeur ? 1 : 0;
            case EGAL:
                return gauche.valeur == droite.valeur ? 1 : 0;
            case AND:
                return gauche.valeur != 0 && droite.valeur != 0 ? 1 : 0;
            case OR:
                return gauche.valeur != 0 || droite.valeur != 0 ? 1 : 0;
            case AND_THEN:
                return gauche.valeur != 0 && droite.valeur != 0 ? 1 : 0;
            case OR_ELSE:
                return gauche.valeur != 0 || droite.valeur != 0 ? 1 : 0;
            default:
                return 0;
        }
    }

    public String produire() {
        String res = "";
        switch (this) {
            case PLUS:
                return "ADD x0, x0, x1 // Opération " + this + "\n";
            case MOINS:
                return "SUB x0, x0, x1 // Opération " + this + "\n";
            case FOIS:
                return "MUL x0, x0, x1 // Opération " + this + "\n";
            case DIV:
                res += "CMP x1, #0 // Opération " + this + "\n";
                res += "BEQ erreur_division // Opération " + this + "\n";
                res += "SDIV x0, x0, x1 // Opération " + this + "\n";
                return res;
            case REM:
                res += "SDIV x2, x0, x1 // Opération " + this + "\n";
                res += "MUL x2, x2, x1 // Opération " + this + "\n";
                res += "SUB x0, x0, x2 // Opération " + this + "\n";
                return res;
            case SUPERIEUR:
                res += "CMP x0, x1 // Opération " + this + "\n";
                res += "MOVGT x0, #1 // Opération " + this + "\n";
                res += "MOVLE x0, #0 // Opération " + this + "\n";
                return res;
            case INFERIEUR:
                res += "CMP x0, x1 // Opération " + this + "\n";
                res += "MOVLT x0, #1 // Opération " + this + "\n";
                res += "MOVGE x0, #0 // Opération " + this + "\n";
                return res;
            case SUPERIEUR_EGAL:
                res += "CMP x0, x1 // Opération " + this + "\n";
                res += "MOVGE x0, #1 // Opération " + this + "\n";
                res += "MOVLT x0, #0 // Opération " + this + "\n";
                return res;
            case INFERIEUR_EGAL:
                res += "CMP x0, x1 // Opération " + this + "\n";
                res += "MOVLE x0, #1 // Opération " + this + "\n";
                res += "MOVGT x0, #0 // Opération " + this + "\n";
                return res;
            case DIFFERENT:
                res += "CMP x0, x1 // Opération " + this + "\n";
                res += "MOVNE x0, #1 // Opération " + this + "\n";
                res += "MOVEQ x0, #0 // Opération " + this + "\n";
                return res;
            case EGAL:
                res += "CMP x0, x1 // Opération " + this + "\n";
                res += "MOVEQ x0, #1 // Opération " + this + "\n";
                res += "MOVNE x0, #0 // Opération " + this + "\n";
                return res;
            case AND:
                return "AND x0, x0, x1 // Opération " + this + "\n";
            case OR:
                return "ORR x0, x0, x1 // Opération " + this + "\n";
            case AND_THEN:
            case OR_ELSE:
            default:
                return "";
        }
    }
}
