package arbres;

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
}
