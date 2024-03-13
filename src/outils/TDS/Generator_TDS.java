package outils.TDS;

import arbres.Fonction;
import arbres.Noeud;
import arbres.Type;

import java.util.ArrayList;

public class Generator_TDS {

    public static Struct_TDS Generator_TDS_Arbre(Noeud AST) {
        types.add(new Type("integer"));
        Struct_TDS root = new Struct_TDS(AST);
        return root;
    }
}
