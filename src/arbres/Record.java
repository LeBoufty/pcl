package arbres;

public class Record implements Noeud {
    public Struct type;
    public Record(Struct type) {
        this.type = type;
    }
    public Record() {
        this.type = new Struct();
    }
    public String toString() {
        String sortie = "type " + type.nom + " is record ";
        for (int i = 0; i < type.champs.size(); i++) {
            sortie += type.champs.get(i).variable.nom + " : " + type.champs.get(i).type.toString() + "; ";
        }
        sortie += "end record";
        return sortie;
    }
    public boolean valide() {
        return type.valide();
    }

    public String produire() {
        return ""; // TODO : à faire en dernier, probablement comme Instanciation.
    }
}
