package outils.OLD;

public class Table_Danalyse {

    private final int[][] Table;

    public static final int OFFSET = 1000;

    private Table_Danalyse() {
        Table = new int[39][61];

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

        //NOTPrime
        Table[26][6] = 57;
        Table[26][18] = 57;
        Table[26][21] = 57;
        Table[26][22] = 57;
        Table[26][25] = 57;
        Table[26][29] = 57;
        Table[26][30] = 57;
        Table[26][32] = 57;
        Table[26][37] = 57;
        Table[26][38] = 57;
        Table[26][39] = 57;
        Table[26][40] = 56;

        //EQUALS
        Table[27][9] = 58;
        Table[27][24] = 58;
        Table[27][48] = 58;
        Table[27][52] = 58;
        Table[27][53] = 58;
        Table[27][56] = 58;
        Table[27][57] = 58;
        Table[27][58] = 58;
        Table[27][59] = 58;
        Table[27][60] = 58;

        //EQUALSPrime
        Table[28][6] = 61;
        Table[28][18] = 61;
        Table[28][21] = 61;
        Table[28][22] = 61;
        Table[28][25] = 61;
        Table[28][29] = 61;
        Table[28][30] = 61;
        Table[28][32] = 61;
        Table[28][37] = 61;
        Table[28][38] = 61;
        Table[28][39] = 61;
        Table[28][40] = 61;
        Table[28][41] = 59;
        Table[28][42] = 60;

        //COMPARATORS
        Table[29][9] = 62;
        Table[29][24] = 62;
        Table[29][48] = 62;
        Table[29][52] = 62;
        Table[29][53] = 62;
        Table[29][56] = 62;
        Table[29][57] = 62;
        Table[29][58] = 62;
        Table[29][59] = 62;
        Table[29][60] = 62;

        //COMPARATORSPrime
        Table[30][6] = 67;
        Table[30][18] = 67;
        Table[30][21] = 67;
        Table[30][22] = 67;
        Table[30][25] = 67;
        Table[30][29] = 67;
        Table[30][30] = 67;
        Table[30][32] = 67;
        Table[30][37] = 67;
        Table[30][38] = 67;
        Table[30][39] = 67;
        Table[30][40] = 67;
        Table[30][41] = 67;
        Table[30][42] = 67;
        Table[30][43] = 63;
        Table[30][44] = 64;
        Table[30][45] = 65;
        Table[30][46] = 66;

        //ADD
        Table[31][9] = 68;
        Table[31][24] = 68;
        Table[31][48] = 68;
        Table[31][52] = 68;
        Table[31][53] = 68;
        Table[31][56] = 68;
        Table[31][57] = 68;
        Table[31][58] = 68;
        Table[31][59] = 68;
        Table[31][60] = 68;

        //ADDPrime
        Table[32][6] = 71;
        Table[32][18] = 71;
        Table[32][21] = 71;
        Table[32][22] = 71;
        Table[32][25] = 71;
        Table[32][29] = 71;
        Table[32][30] = 71;
        Table[32][32] = 71;
        Table[32][37] = 71;
        Table[32][38] = 71;
        Table[32][39] = 71;
        Table[32][40] = 71;
        Table[32][41] = 71;
        Table[32][42] = 71;
        Table[32][43] = 71;
        Table[32][44] = 71;
        Table[32][45] = 71;
        Table[32][46] = 71;
        Table[32][47] = 69;
        Table[32][48] = 70;

        //MULT
        Table[33][9] = 72;
        Table[33][24] = 72;
        Table[33][48] = 72;
        Table[33][52] = 72;
        Table[33][53] = 72;
        Table[33][56] = 72;
        Table[33][57] = 72;
        Table[33][58] = 72;
        Table[33][59] = 72;
        Table[33][60] = 72;

        //MULTPrime
        Table[34][6] = 76;
        Table[34][18] = 76;
        Table[34][21] = 76;
        Table[34][22] = 76;
        Table[34][25] = 76;
        Table[34][29] = 76;
        Table[34][30] = 76;
        Table[34][32] = 76;
        Table[34][37] = 76;
        Table[34][38] = 76;
        Table[34][39] = 76;
        Table[34][40] = 76;
        Table[34][41] = 76;
        Table[34][42] = 76;
        Table[34][43] = 76;
        Table[34][44] = 76;
        Table[34][45] = 76;
        Table[34][46] = 76;
        Table[34][47] = 76;
        Table[34][48] = 76;
        Table[34][49] = 73;
        Table[34][50] = 74;
        Table[34][51] = 75;

        //MOINSUnaire
        Table[35][9] = 78;
        Table[35][24] = 78;
        Table[35][48] = 77;
        Table[35][52] = 78;
        Table[35][53] = 78;
        Table[35][56] = 78;
        Table[35][57] = 78;
        Table[35][58] = 78;
        Table[35][59] = 78;
        Table[35][60] = 78;

        //EXPRESSION
        Table[36][9] = 87;
        Table[36][24] = 79;
        Table[36][52] = 80;
        Table[36][53] = 81;
        Table[36][56] = 82;
        Table[36][57] = 83;
        Table[36][58] = 84;
        Table[36][59] = 85;
        Table[36][60] = 86;

        //LVALUE
        Table[37][9] = 88;

        //LVALUEList
        Table[38][2] = 89;
        Table[38][6] = 91;
        Table[38][18] = 91;
        Table[38][21] = 91;
        Table[38][22] = 91;
        Table[38][24] = 90;
        Table[38][25] = 91;
        Table[38][29] = 91;
        Table[38][30] = 91;
        Table[38][32] = 91;
        Table[38][37] = 91;
        Table[38][38] = 91;
        Table[38][39] = 91;
        Table[38][40] = 91;
        Table[38][41] = 91;
        Table[38][42] = 91;
        Table[38][43] = 91;
        Table[38][44] = 91;
        Table[38][45] = 91;
        Table[38][46] = 91;
        Table[38][47] = 91;
        Table[38][48] = 91;
        Table[38][49] = 91;
        Table[38][50] = 91;
        Table[38][51] = 91;
    }

    public int obtenirValeur(int ligne, int colonne) {
        return Table[ligne][colonne-OFFSET];
    }

    public static Table_Danalyse creerTable() {
        return new Table_Danalyse();
    }
}
