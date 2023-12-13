package outils;
//Madpad4lyfe
public class MatricePassage {
    //fonction qui prend en entrée l'entier indentificateur du dico lexi vers l'autre. Il sort un Array[]
    //pour le 53 l'array est de taille 3 du coup caractere, ' et val

    public int[] MatricePassageLextoSyn(int motdebase) {
        int[] mot = new int[1];// Initialize the mot array with size 1
        if(motdebase == 0)
        {
            mot[0]=3;
        }

        if(motdebase == 1)
        {
            mot[0]=49;
        }

        if(motdebase == 2)
        {
            mot[0]=50;
        }
        if(motdebase == 3)
        {
            mot[0]=51;
        }
        if(motdebase == 4)
        {
            mot[0]=52;
        }
        if(motdebase == 5)
        {
            mot[0]=48;
        }
        if(motdebase == 6)
        {
            mot[0]=49;
        }
        if(motdebase == 7)
        {
            mot[0]=46;
        }
        if(motdebase == 8)
        {
            mot[0]=47;
        }
        if(motdebase == 9)
        {
            mot[0]=44;
        }
        if(motdebase == 10)
        {
            mot[0]=45;
        }
        if(motdebase == 11)
        {
            mot[0]=42;
        }
        if(motdebase == 12)
        {
            mot[0]=43;
        }
        if(motdebase == 13)
        {
            mot[0]=41;
        }
        if(motdebase == 14)
        {
            mot[0]=22;
        }
        if(motdebase == 15)
        {
            mot[0]=40;
        }
        if(motdebase == 16)
        {
            mot[0]=38;
        }
        if(motdebase == 17)
        {
            mot[0]=39;
        }
        if(motdebase == 18)
        {
            mot[0]=9;
        }
        if(motdebase == 19)
        {
            mot[0]=16;
        }
        if(motdebase == 20)
        {
            mot[0]=11;
        }
        if(motdebase == 21)
        {
            mot[0]=12;
        }
        if(motdebase == 22)
        {
            mot[0]=13;
        }
        if(motdebase == 23)
        {
            mot[0]=17;
        }
        if(motdebase == 24)
        {
            mot[0]=32;
        }
        if(motdebase == 25)
        {
            mot[0]=33;
        }
        if(motdebase == 26)
        {
            mot[0]=36;
        }
        if(motdebase == 27)
        {
            mot[0]=37;
        }
        if(motdebase == 28)
        {
            mot[0]=34;
        }
        if(motdebase == 29)
        {
            mot[0]=29;
        }
        if(motdebase == 30)
        {
            mot[0]=27;
        }
        if(motdebase == 31)
        {
            mot[0]=31;
        }
        if(motdebase == 32)
        {
            mot[0]=61;
        }
        if(motdebase == 33)
        {
            mot[0]=58;
        }
        if(motdebase == 34)
        {
            mot[0]=60;
        }
        if(motdebase == 35)
        {
            mot[0]=15;
        }
        if(motdebase == 36)
        {
            mot[0]=59;
        }
        if(motdebase == 37)
        {
            mot[0]=1;
        }
        if(motdebase == 38)
        {
            mot[0]=8;
        }
        if(motdebase == 39)
        {
            mot[0]=20;
        }
        if(motdebase == 40)
        {
            mot[0]=28;
        }
        if(motdebase == 41)
        {
            mot[0]=21;
        }
        if(motdebase == 42)
        {
            mot[0]=35;
        }
        if(motdebase == 43)
        {
            mot[0]=10;
        }
        if(motdebase == 44)
        {
            mot[0]=57;
        }
        if(motdebase == 45)
        {
            mot[0]=53;
        }
        if(motdebase == 46)
        {
            mot[0]=25;
        }
        if(motdebase == 47)
        {
            mot[0]=26;
        }
        if(motdebase == 48)
        {
            mot[0]=19;
        }
        if(motdebase == 49)
        {
            mot[0]=7;
        }
        if(motdebase == 50)
        {
            mot[0]=23;
        }
        if(motdebase == 51)
        {
            mot[0]=18;
        }
        if(motdebase == 52)
        {
            mot[0]=30;
        }
        if(motdebase == 53)
        {
            mot[0]=54;
            mot[1]=55;
            mot[2]=56;
        }
        if(motdebase == 54)
        {
            mot[0]=14;
        }
        if(motdebase == 55)
        {
            mot[0]=2;
        }
        if(motdebase == 56)
        {
            mot[0]=4;
        }
        return mot;
    }


    //fonction qui fai l'inverse
    public int[] MatricePassageSyntoLex(int motdebase) {
        int[] mot = new int[1];// Initialize the mot array with size 1

        if(motdebase == 1)
        {
            mot[0]=37;
        }
        if(motdebase == 2)
        {
            mot[0]=55;
        }
        if(motdebase == 3)
        {
            mot[0]=0;
        }
        if(motdebase == 4)
        {
            mot[0]=56;
        }
        if(motdebase == 7)
        {
            mot[0]=49;
        }
        if(motdebase == 8)
        {
            mot[0]=38;
        }
        if(motdebase == 9)
        {
            mot[0]=18;
        }
        if(motdebase == 10)
        {
            mot[0]=43;
        }
        if(motdebase == 11)
        {
            mot[0]=20;
        }
        if(motdebase == 12)
        {
            mot[0]=21;
        }
        if(motdebase == 13)
        {
            mot[0]=22;
        }
        if(motdebase == 14)
        {
            mot[0]=54;
        }
        if(motdebase == 15)
        {
            mot[0]=35;
        }
        if(motdebase == 16)
        {
            mot[0]=19;
        }
        if(motdebase == 17)
        {
            mot[0]=23;
        }
        if(motdebase == 18)
        {
            mot[0]=51;
        }
        if(motdebase == 19)
        {
            mot[0]=48;
        }
        if(motdebase == 20)
        {
            mot[0]=39;
        }
        if(motdebase == 21)
        {
            mot[0]=41;
        }
        if(motdebase == 22)
        {
            mot[0]=14;
        }
        if(motdebase == 23)
        {
            mot[0]=50;
        }
        if(motdebase == 25)
        {
            mot[0]=46;
        }
        if(motdebase == 26)
        {
            mot[0]=47;
        }
        if(motdebase == 27)
        {
            mot[0]=30;
        }
        if(motdebase == 28)
        {
            mot[0]=40;
        }
        if(motdebase == 29)
        {
            mot[0]=29;
        }
        if(motdebase == 30)
        {
            mot[0]=52;
        }
        if(motdebase == 31)
        {
            mot[0]=31;
        }
        if(motdebase == 32)
        {
            mot[0]=24;
        }
        if(motdebase == 33)
        {
            mot[0]=25;
        }
        if(motdebase == 34)
        {
            mot[0]=28;
        }
        if(motdebase == 35)
        {
            mot[0]=42;
        }
        if(motdebase == 36)
        {
            mot[0]=26;
        }
        if(motdebase == 37)
        {
            mot[0]=27;
        }
        if(motdebase == 38)
        {
            mot[0]=16;
        }
        if(motdebase == 39)
        {
            mot[0]=17;
        }
        if(motdebase == 40)
        {
            mot[0]=15;
        }
        if(motdebase == 41)
        {
            mot[0]=13;
        }
        if(motdebase == 42)
        {
            mot[0]=11;
        }
        if(motdebase == 43)
        {
            mot[0]=12;
        }
        if(motdebase == 44)
        {
            mot[0]=9;
        }
        if(motdebase == 45)
        {
            mot[0]=10;
        }
        if(motdebase == 46)
        {
            mot[0]=7;
        }
        if(motdebase == 47)
        {
            mot[0]=8;
        }
        if(motdebase == 48)
        {
            mot[0]=5;
        }
        if(motdebase == 49)
        {
            mot[0]=6;
        }
        if(motdebase == 50)
        {
            mot[0]=2;
        }
        if(motdebase == 51)
        {
            mot[0]=3;
        }
        if(motdebase == 52)
        {
            mot[0]=4;
        }
        if(motdebase == 53)
        {
            mot[0]=45;
        }
        if(motdebase == 54)
        {
            mot[0]=53;
        }
        //j'ai arrete ici parce que ça sert à que dalle.


        return mot;
    }
}
