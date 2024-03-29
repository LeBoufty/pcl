package outils.Pile_registre;

public class Pile_registre {
    private static int[] pile;
    private static int sommet;

    public Pile_registre(int taille) {
        pile = new int[taille];
        sommet = -1;
    }

    public void empiler(int valeur) {
        pile[++sommet] = valeur;
    }

    public int depiler() {
        return pile[sommet--];
    }

    public void afficher() {
        for (int i = 0; i <= sommet; i++) {
            System.out.print(pile[i] + " ");
        }
        System.out.println();
    }

    public static void init() {
        int[] registres = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};// TODO : Registres à initialiser
        Pile_registre pile = new Pile_registre(registres.length); 
        for (int i = 0; i < registres.length; i++) {
            pile.empiler(registres[i]);
        }
        pile.afficher();
    }
}
