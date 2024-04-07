package arbres;

public enum Operateur {
    // Placeholder pour quand on crée l'opération
    NONE("", Type.NULLTYPE),
    // Opérations sur entiers
    PLUS("ADD", Type.INTEGER), MOINS("SUB", Type.INTEGER),
    FOIS("MUL", Type.INTEGER), DIV("SDIV", Type.INTEGER),
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
}
