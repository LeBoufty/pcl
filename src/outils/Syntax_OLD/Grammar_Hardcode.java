package outils.Syntax_OLD;

public class Grammar_Hardcode {
    

    public Table_Analyse table(){
        Table_Analyse table = new Table_Analyse(0, 0);

        return table;
    }


    public Regle regle(){
        Regle regle = new Regle();


        return regle;
    }

    public static Table_Analyse table_test(){
        Table_Analyse table = new Table_Analyse(6, 5);
        table.set(0, 0, 1);
        table.set(0, 3, 1);
        table.set(1, 1, 2);
        table.set(1, 4, 0);
        table.set(1, 5, 0);
        table.set(2, 0, 3);
        table.set(2, 3, 3);
        table.set(3, 1, 0);
        table.set(3, 2, 4);
        table.set(3, 4, 0);
        table.set(3, 5, 0);
        table.set(4, 0, 5);
        table.set(4, 3, 5);

        return table;
    }


    public static Regle regle_test(){
        Regle regle = new Regle();
        regle.add(new Integer[]{});   // Vide
        regle.add(new Integer[]{0, 2, 0, 1}); // TE'
        regle.add(new Integer[]{1, 1, 0, 2, 0, 1}); // +TE'
        regle.add(new Integer[]{0, 4, 0, 3}); // FT'
        regle.add(new Integer[]{1, 2, 0, 4, 0, 3}); // *FT'
        regle.add(new Integer[]{1, 0}); // id
        regle.add(new Integer[]{1, 3, 0, 0, 1, 4}); // (E)
        
        regle.setFirst_stack(new Integer[]{0, 1, 1, 5}); // E$
        return regle;
    }
}
