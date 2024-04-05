package outils.TDS;

import java.util.ArrayList;
import java.util.HashMap;


public class TDS_IDF {
    
    public static HashMap<String, ArrayList<Integer>> table_idf(TDS_gen tds_root) {
        HashMap<String, ArrayList<Integer>> table_idf = new HashMap<String, ArrayList<Integer>>();

        ArrayList<TDS_gen> tds_list = new ArrayList<TDS_gen>();
        tds_list.add(tds_root);

        while (!tds_list.isEmpty()) {
            TDS_gen tds = tds_list.remove(0);
            for (Integer key : tds.TDS_vari.keySet()) {
                Ligne_TDS ligne = tds.TDS_vari.get(key);
                if (ligne.est_une_variable) {
                    if (table_idf.containsKey(ligne.nom_var)) {
                        table_idf.get(ligne.nom_var).add(ligne.contenu);
                    } else {
                        ArrayList<Integer> list = new ArrayList<Integer>();
                        list.add(ligne.contenu);
                        table_idf.put(ligne.nom_var, list);
                    }

                }
            }
            for (TDS_gen child : tds.tds_childrens) {
                tds_list.add(child);
            }
        }


        return table_idf;
    }

    public static void affiche_table_idf(HashMap<String, ArrayList<Integer>> table_idf) {
        for (String key : table_idf.keySet()) {
            System.out.println(key + " : " + table_idf.get(key));
        }
    }
}
