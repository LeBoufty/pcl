package tests;

import arbres.Affectation;
import arbres.AppelFonction;
import arbres.Constante;
import arbres.Fonction;
import arbres.Declaration;
import arbres.InstructionIf;
import arbres.Operateur;
import arbres.Operation;
import arbres.Parametre;
import arbres.Procedure;
import arbres.Return;
import arbres.Type;
import arbres.PlantUML.GenerateurPUML;
import outils.Logger;
import outils.GestionFichier;

public class TestArbreUnDebutTopDown {

    public static void main(String[] args) {
        ////////////////////////////////
        // Sera réalisé à l'initalisation de l'analyseur syntaxique
        Parametre nToPut = new Parametre(Type.INTEGER, "n");
        Parametre cToPut = new Parametre(Type.CHARACTER, "c");
        Fonction putInt = new Fonction("put");
        putInt.params.add(nToPut);
        putInt.type = Type.NULLTYPE;
        Fonction putChar = new Fonction("put");
        putChar.params.add(cToPut);
        putChar.type = Type.NULLTYPE;
        ////////////////////////////////
        // Début
        Procedure unDebut = new Procedure("unDebut");
        // aireRectangle :
        Fonction aireRectangle = new Fonction("aireRectangle");
        Parametre aireLarg = new Parametre(Type.INTEGER, "larg");
        Parametre aireLong = new Parametre(Type.INTEGER, "long");
        aireRectangle.params.add(aireLarg);
        aireRectangle.params.add(aireLong);
        aireRectangle.type = Type.INTEGER;
        Declaration aire = new Declaration(Type.INTEGER, "aire");
        aireRectangle.ajouterDefinition(aire);
        Affectation aireAffectation = new Affectation();
        aireAffectation.gauche = aire.variable;
        aireAffectation.droite = new Operation();
        ((Operation)aireAffectation.droite).gauche = aireLarg.variable;
        ((Operation)aireAffectation.droite).droite = aireLong.variable;
        ((Operation)aireAffectation.droite).setOperateur(Operateur.FOIS);
        aireRectangle.ajouterInstruction(aireAffectation);
        Return retourAire = new Return();
        retourAire.valeur = aire.variable;
        aireRectangle.ajouterInstruction(retourAire);
        unDebut.ajouterDefinition(aireRectangle);
        // perimetreRectangle :
        Fonction perimetreRectangle = new Fonction("perimetreRectangle");
        Parametre periLarg = new Parametre(Type.INTEGER, "larg");
        Parametre periLong = new Parametre(Type.INTEGER, "long");
        perimetreRectangle.params.add(periLarg);
        perimetreRectangle.params.add(periLong);
        perimetreRectangle.type = Type.INTEGER;
        Declaration p = new Declaration(Type.INTEGER, "perimetre");
        perimetreRectangle.ajouterDefinition(p);
        Affectation perimAffectation = new Affectation();
        perimAffectation.gauche = p.variable;
        perimAffectation.droite = new Operation();
        ((Operation)perimAffectation.droite).gauche = new Operation();
        ((Operation)((Operation)perimAffectation.droite).gauche).gauche = periLarg.variable;
        ((Operation)((Operation)perimAffectation.droite).gauche).droite = new Constante(2);
        ((Operation)((Operation)perimAffectation.droite).gauche).setOperateur(Operateur.FOIS);
        ((Operation)perimAffectation.droite).droite = new Operation();
        ((Operation)((Operation)perimAffectation.droite).droite).gauche = periLong.variable;
        ((Operation)((Operation)perimAffectation.droite).droite).droite = new Constante(2);
        ((Operation)((Operation)perimAffectation.droite).droite).setOperateur(Operateur.FOIS);
        ((Operation)perimAffectation.droite).setOperateur(Operateur.PLUS);
        perimetreRectangle.ajouterInstruction(perimAffectation);
        Return retourPerim = new Return();
        retourPerim.valeur = p.variable;
        perimetreRectangle.ajouterInstruction(retourPerim);
        unDebut.ajouterDefinition(perimetreRectangle);
        // Variables
        Declaration choix = new Declaration(Type.INTEGER, "choix");
        unDebut.ajouterDefinition(choix);
        // (Pas dans le programme mais nécessaire, je pense que c'est une erreur du sujet)
        Declaration valeur = new Declaration(Type.INTEGER, "valeur");
        unDebut.ajouterDefinition(valeur);
        // Procédure principale
        unDebut.ajouterInstruction(new Affectation(choix.variable, new Constante(1)));
        InstructionIf choixegal1 = new InstructionIf();
        choixegal1.condition = new Operation();
        ((Operation)choixegal1.condition).gauche = choix.variable;
        ((Operation)choixegal1.condition).droite = new Constante(1);
        ((Operation)choixegal1.condition).setOperateur(Operateur.EGAL);
        Affectation thenAffectation = new Affectation();
        thenAffectation.gauche = valeur.variable;
        thenAffectation.droite = new AppelFonction(perimetreRectangle);
        ((AppelFonction)thenAffectation.droite).ajouterParametre(new Constante(2));
        ((AppelFonction)thenAffectation.droite).ajouterParametre(new Constante(3));
        choixegal1.ajouterInstructionAlors(thenAffectation);
        AppelFonction putValeurPerim = new AppelFonction(putInt);
        putValeurPerim.ajouterParametre(valeur.variable);
        choixegal1.ajouterInstructionAlors(putValeurPerim);
        Affectation elseAffectation = new Affectation();
        elseAffectation.gauche = valeur.variable;
        elseAffectation.droite = new AppelFonction(aireRectangle);
        ((AppelFonction)elseAffectation.droite).ajouterParametre(new Constante(2));
        ((AppelFonction)elseAffectation.droite).ajouterParametre(new Constante(3));
        choixegal1.ajouterInstructionSinon(elseAffectation);
        AppelFonction putValeurAire = new AppelFonction(putInt);
        putValeurAire.ajouterParametre(valeur.variable);
        choixegal1.ajouterInstructionSinon(putValeurAire);
        unDebut.ajouterInstruction(choixegal1);

        // Impression
        //if (unDebut.valide()) Logger.debug(unDebut.toString());

        // PlantUML
        try {
            GenerateurPUML gen = new GenerateurPUML(unDebut, "Programmes/unDebutTopDown.pu");
            gen.generer();
            // unDebut.produire(unDebut.nom);
            GestionFichier.produirefichier("test.s");
        } catch (Exception e) {
            Logger.error(e.getMessage());
        }
    }
}
