package tests;

import arbres.*;
import arbres.PlantUML.GenerateurPUML;
import outils.Logger;

public class TestArbreUnDebut {
    public static void main(String[] args) {
        // aireRectangle :
        // Paramètres de aireRectangle
        Instanciation aireLarg = new Instanciation(Type.INTEGER);
        Instanciation aireLong = new Instanciation(Type.INTEGER);
        // Déclarations de aireRectangle
        Instanciation aire = new Instanciation(Type.INTEGER);
        // Instructions de aireRectangle : préparatifs
        Operation aireMultiplication = new Operation(aireLarg.variable, aireLong.variable, Operateur.FOIS);
        // Instructions de aireRectangle
        Affectation aireAffectation = new Affectation(aire.variable, aireMultiplication);
        Return retourAire = new Return(aire.variable);
        // Construction de aireRectangle
        Noeud[] instrAire = new Noeud[] {aireAffectation, retourAire};
        Bloc blocInstrA = new Bloc(instrAire);
        Instanciation[] paramAire = new Instanciation[] {aireLarg, aireLong};
        Fonction aireRectangle = new Fonction("aireRectangle", paramAire, Type.INTEGER, aire, blocInstrA);

        // perimetreRectangle :
        // Paramètres
        Instanciation periLarg = new Instanciation(Type.INTEGER);
        Instanciation periLong = new Instanciation(Type.INTEGER);
        // Déclarations
        Instanciation p = new Instanciation(Type.INTEGER);
        // Instructions 1
        Constante _2 = new Constante(2);
        Operation mulLarg = new Operation(periLarg.variable, _2, Operateur.FOIS);
        Operation mulLong = new Operation(periLong.variable, _2, Operateur.FOIS);
        Operation perimAddition = new Operation(mulLarg, mulLong, Operateur.PLUS);
        // Instructions 2
        Affectation perimAffectation = new Affectation(p.variable, perimAddition);
        Return retourPerim = new Return(p.variable);
        // Construction
        Noeud[] instrPerim = new Noeud[] {perimAffectation, retourPerim};
        Bloc blocInstrP = new Bloc(instrPerim);
        Instanciation[] paramPeri = new Instanciation[] {periLarg, periLong};
        Fonction perimetreRectangle = new Fonction("perimetreRectangle", paramPeri, Type.INTEGER, p, blocInstrP);

        // Variables
        Instanciation choix = new Instanciation(Type.INTEGER);

        // Définitions de constantes
        Constante _1 = new Constante(1);
        Constante _3 = new Constante(3);

        // Valeur n'est jamais instancié ?
        Instanciation valeur = new Instanciation(Type.INTEGER);

        // Noeuds chiants
        Operation choixegal1 = new Operation(choix.variable, _1, Operateur.EGAL);
        AppelFonction perimetreAppel = new AppelFonction(perimetreRectangle, new Constante[] {_2, _3});
        AppelFonction aireAppel = new AppelFonction(aireRectangle, new Constante[] {_2, _3});

        // Procédure principale
        Affectation choixAffectation = new Affectation(choix.variable, _2);
        Affectation thenAffectation = new Affectation(valeur.variable, perimetreAppel);
        Affectation elseAffectation = new Affectation(valeur.variable, aireAppel);
        InstructionIf instructionIf = new InstructionIf(choixegal1, thenAffectation, elseAffectation);

        // Construction procédure
        Noeud[] definitions = new Noeud[] {aireRectangle, perimetreRectangle, choix};
        Noeud[] instructions = new Noeud[] {choixAffectation, instructionIf};
        Bloc defBloc = new Bloc(definitions);
        Bloc instrBloc = new Bloc(instructions);
        Procedure unDebut = new Procedure("unDebut", defBloc, instrBloc);

        // Impression
        if (unDebut.valide()) Logger.debug(unDebut.toString());

        // PlantUML
        try {
            GenerateurPUML gen = new GenerateurPUML(unDebut, "Programmes/unDebut.pu");
            gen.generer();
        } catch (Exception e) {
            Logger.error(e.getMessage());
        }
    }
}
