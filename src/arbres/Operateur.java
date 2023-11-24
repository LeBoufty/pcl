package arbres;

public enum Operateur {
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
    NOT("not", Type.BOOLEAN),
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
}
