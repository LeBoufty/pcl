package outils;

public class Table_Danalyse {

    private final int[][] Table;

    private Table_Danalyse() {
        Table = new int[39][56];

        for (int i = 0; i < 39; i++) {
            for (int j = 0; j < 56; j++) {
                Table[i][j] = -1;
            }
        }
        //FICHIER
        Table[0][0] = 1;
        
        //IDFInterro
        Table[1][6] = 3;
        Table[1][9] = 2;
        
        //DECLEtoile
        Table[2][8] = 5;
        Table[2][9] = 5;
        Table[2][11] = 6;
        Table[2][14] = 5;
        Table[2][15] = 5;
        
        //DECL
        Table[3][8] = 9;
        Table[3][9] = 8;
        Table[3][14] = 6;
        Table[3][15] = 7;

        //DEFORInterro
        Table[4][6] = 11;
        Table[4][18] = 10;

        //ISInterro
        Table[5][8] = 13;
        Table[5][9] = 13;
        Table[5][10] = 12;
        Table[5][11] = 13;
        Table[5][14] = 13;
        Table[5][15] = 13;

        //ACCInterro
        Table[6][19] = 14;
        Table[6][20] = 15;

        //IDFEtoile
        Table[7][17] = 17;
        Table[7][22] = 16;

        //TYPEInterro
        Table[8][9] = 18;
        Table[8][21] = 19;

        //PARENTHESE
        Table[9][24] = 20;

        //PARAMS
        Table[10][6] = 21;
        Table[10][25] = 22;

        //MODEInterro
        Table[11][9] = 24;
        Table[11][19] = 24;
        Table[11][26] = 23;

        //OUTInterro
        Table[12][9] = 26;
        Table[12][19] = 26;
        Table[12][27] = 25;

        //OREtoile
        Table[13][22] = 27;
        Table[13][25] = 28;

        //ORInterro
        Table[14][6] = 30;
        Table[14][9] = 29;
        Table[14][24] = 29;
        Table[14][48] = 29;
        Table[14][52] = 29;
        Table[14][53] = 29;
        Table[14][56] = 29;
        Table[14][57] = 29;
        Table[14][58] = 29;
        Table[14][59] = 29;
        Table[14][60] = 29;

        //INSTREtoile
        Table[15][9] = 31;
        Table[15][11] = 31;
        Table[15][12] = 32;
        Table[15][16] = 31;
        Table[15][24] = 31;
        Table[15][28] = 31;
        Table[15][31] = 31;
        Table[15][33] = 31;
        Table[15][35] = 32;
        Table[15][36] = 32;
        Table[15][48] = 31;
        Table[15][52] = 31;
        Table[15][53] = 31;
        Table[15][56] = 31;
        Table[15][57] = 31;
        Table[15][58] = 31;
        Table[15][59] = 31;
        Table[15][60] = 31;

    }

    public int obtenirValeur(int ligne, int colonne) {
        return Table[ligne][colonne];
    }

    public static Table_Danalyse creerTable() {
        return new Table_Danalyse();
    }
}
