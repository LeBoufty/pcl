package arbres;


import outils.TDS.TDS_gen;

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
         System.out.println("Record");

        return "";
// TODO : à faire en dernier, probablement comme Instanciation.
    }


    public void TDS_creation(TDS_gen Parent, int type_variable) {
        // TODO : à faire si on a le temps
    }

    public void TDS_link(TDS_gen Parent) {
        // TODO : à faire si on a le temps
    }

    public TDS_gen getTDS() {
        return this.type.getTDS();
    }

    public void TDS_variable() {
        // TODO : à faire si on a le temps
    }
}
