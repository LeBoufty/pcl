package outils.Pile_registre;

public class Pile_registre {
    public int taille;
    public int[] pile;
    public int sommet;

    public Pile_registre(int taille) {
        this.taille = taille;
        this.pile = new int[taille];
        this.sommet = 0;
    }

    public void empiler(int valeur) {
        if (this.sommet < this.taille) {
            this.pile[this.sommet] = valeur;
            this.sommet++;
        } else {
            System.out.println("Pile pleine");
        }
    }

    public int depiler() {
        if (this.sommet > 0) {
            this.sommet--;
            return this.pile[this.sommet];
        } else {
            System.out.println("Pile vide");
            return -1;
        }
    }

    public int sommet() {
        if (this.sommet > 0) {
            return this.pile[this.sommet - 1];
        } else {
            System.out.println("Pile vide");
            return -1;
        }
    }

    public void afficher() {
        System.out.print("Pile : ");
        for (int i = 0; i < this.sommet; i++) {
            System.out.print(this.pile[i] + " ");
        }
        System.out.println();
    }
    
    public static void init() {
        Pile_registre pile = new Pile_registre(10);
        int[] registres = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
        for (int i = 0; i < registres.length; i++) {
            pile.empiler(registres[i]);
        }
    }
}
