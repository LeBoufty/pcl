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

        //INSTR
        Table[16][9] = 33;
        Table[16][11] = 34;
        Table[16][16] = 37;
        Table[16][24] = 33;
        Table[16][28] = 35;
        Table[16][31] = 36;
        Table[16][33] = 38;
        Table[16][48] = 33;
        Table[16][52] = 33;
        Table[16][53] = 33;
        Table[16][56] = 33;
        Table[16][57] = 33;
        Table[16][58] = 33;
        Table[16][59] = 33;
        Table[16][60] = 33;

        //REVERSEInterro
        Table[17][9] = 40;
        Table[17][24] = 40;
        Table[17][34] = 39;
        Table[17][48] = 40;
        Table[17][52] = 40;
        Table[17][53] = 40;
        Table[17][56] = 40;
        Table[17][57] = 40;
        Table[17][58] = 40;
        Table[17][59] = 40;
        Table[17][60] = 40;

        //ELSEINSTRInterro
        Table[18][12] = 42;
        Table[18][35] = 41;

        //ELSIFEtoile
        Table[19][12] = 44;
        Table[19][35] = 44;
        Table[19][36] = 43;

        //ACCESSInterro
        Table[20][9] = 46;
        Table[20][19] = 45;

        //OR
        Table[21][9] = 47;
        Table[21][24] = 47;
        Table[21][48] = 47;
        Table[21][52] = 47;
        Table[21][53] = 47;
        Table[21][56] = 47;
        Table[21][57] = 47;
        Table[21][58] = 47;
        Table[21][59] = 47;
        Table[21][60] = 47;

        //ORPrime
        Table[22][6] = 50;
        Table[22][18] = 50;
        Table[22][22] = 50;
        Table[22][25] = 50;
        Table[22][29] = 50;
        Table[22][30] = 50;
        Table[22][32] = 50;
        Table[22][37] = 48;
        Table[22][38] = 49;

        //AND
        Table[23][9] = 51;
        Table[23][24] = 51;
        Table[23][48] = 51;
        Table[23][52] = 51;
        Table[23][53] = 51;
        Table[23][56] = 51;
        Table[23][57] = 51;
        Table[23][58] = 51;
        Table[23][59] = 51;
        Table[23][60] = 51;

        //ANDPrime
        Table[24][6] = 54;
        Table[24][18] = 54;
        Table[24][21] = 52;
        Table[24][22] = 54;
        Table[24][25] = 54;
        Table[24][29] = 54;
        Table[24][30] = 54;
        Table[24][32] = 54;
        Table[24][37] = 54;
        Table[24][38] = 54;
        Table[24][39] = 53;

        //NOT
        Table[25][9] = 55;
        Table[25][24] = 55;
        Table[25][48] = 55;
        Table[25][52] = 55;
        Table[25][53] = 55;
        Table[25][56] = 55;
        Table[25][57] = 55;
        Table[25][58] = 55;
        Table[25][59] = 55;
        Table[25][60] = 55;
    }

    public int obtenirValeur(int ligne, int colonne) {
        return Table[ligne][colonne];
    }

    public static Table_Danalyse creerTable() {
        return new Table_Danalyse();
    }
}
