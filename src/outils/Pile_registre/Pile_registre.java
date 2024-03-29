package outils.Pile_registre;

public class Pile_registre {
    private static int[] pile = new int[30];
    private static int sommet;

    public static void empiler(int valeur) {
        pile[++sommet] = valeur;
    }

    public static int depiler() {
        return pile[sommet--];
    }

    public static void afficher() {
        for (int i = 0; i <= sommet; i++) {
            System.out.print(pile[i] + " ");
        }
        System.out.println();
    }

    public static void init() {
        int[] registres = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};// TODO : Registres à initialiser
        for (int i = 0; i < registres.length; i++) {
            empiler(registres[i]);
        }
        afficher();
    }
}
