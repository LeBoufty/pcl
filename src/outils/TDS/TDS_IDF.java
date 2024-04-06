package outils.TDS;

import java.util.ArrayList;
import java.util.HashMap;

import arbres.Variable;


public class TDS_IDF {
    
    public static HashMap<String, ArrayList<Variable>> table_idf(TDS_gen tds_root) {
        HashMap<String, ArrayList<Variable>> table_idf = new HashMap<String, ArrayList<Variable>>();

        ArrayList<TDS_gen> tds_list = new ArrayList<TDS_gen>();
        tds_list.add(tds_root);

        while (!tds_list.isEmpty()) {
            TDS_gen tds = tds_list.remove(0);

            for (Integer key : tds.TDS_vari.keySet()) {
                if (tds.TDS_vari.get(key).est_une_variable) {
                    Variable var = tds.TDS_vari.get(key).variable;
                    if (!table_idf.containsKey(var.nom)) {
                        table_idf.put(var.nom, new ArrayList<Variable>());
                    }
                    table_idf.get(var.nom).add(var);
                }
            }

            for (TDS_gen child : tds.tds_childrens) {
                tds_list.add(child);
            }
        }


        return table_idf;
    }

    public static void affiche_table_idf(HashMap<String, ArrayList<Variable>> table_idf) {
        for (String key : table_idf.keySet()) {
            System.out.println(key + " : ");
            for (Variable var : table_idf.get(key)) {
                System.out.println("\t" + var.toString());
            }
        }
    }

}
