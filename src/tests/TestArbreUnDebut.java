package tests;

import arbres.Affectation;
import arbres.AppelFonction;
import arbres.Bloc;
import arbres.Constante;
import arbres.Fonction;
import arbres.Declaration;
import arbres.InstructionIf;
import arbres.Noeud;
import arbres.Operateur;
import arbres.Operation;
import arbres.Parametre;
import arbres.Procedure;
import arbres.Return;
import arbres.Type;
import arbres.PlantUML.GenerateurPUML;
import outils.Logger;
import outils.TDS.TDS_gen;

public class TestArbreUnDebut {
    public static void main(String[] args) {
        // aireRectangle :
        // Paramètres de aireRectangle
        Parametre aireLarg = new Parametre(Type.INTEGER, "larg");
        Parametre aireLong = new Parametre(Type.INTEGER, "long");
        // Déclarations de aireRectangle
        Declaration aire = new Declaration(Type.INTEGER, "aire");
        // Instructions de aireRectangle : préparatifs
        Operation aireMultiplication = new Operation(aireLarg.variable, aireLong.variable, Operateur.FOIS);
        // Instructions de aireRectangle
        Affectation aireAffectation = new Affectation(aire.variable, aireMultiplication);
        Return retourAire = new Return(aire.variable);
        // Construction de aireRectangle
        Noeud[] instrAire = new Noeud[] {aireAffectation, retourAire};
        Bloc blocInstrA = new Bloc(instrAire);
        Parametre[] paramAire = new Parametre[] {aireLarg, aireLong};
        Fonction aireRectangle = new Fonction("aireRectangle", paramAire, Type.INTEGER, aire, blocInstrA);

        // perimetreRectangle :
        // Paramètres
        Parametre periLarg = new Parametre(Type.INTEGER, "larg");
        Parametre periLong = new Parametre(Type.INTEGER, "long");
        // Déclarations
        Declaration p = new Declaration(Type.INTEGER, "perimetre");
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
        Parametre[] paramPeri = new Parametre[] {periLarg, periLong};
        Fonction perimetreRectangle = new Fonction("perimetreRectangle", paramPeri, Type.INTEGER, p, blocInstrP);

        // Variables
        Declaration choix = new Declaration(Type.INTEGER, "choix");

        // Définitions de constantes
        Constante _1 = new Constante(1);
        Constante _3 = new Constante(3);

        // Valeur n'est jamais instancié ?
        Declaration valeur = new Declaration(Type.INTEGER, "valeur");

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
        //if (unDebut.valide()) Logger.debug(unDebut.toString());

        // PlantUML
        try {
            GenerateurPUML gen = new GenerateurPUML(unDebut, "Programmes/unDebut.pu");
            gen.generer();
        } catch (Exception e) {
            Logger.error(e.getMessage());
        }

        // TDS
        //TDS_gen tds = new TDS_gen(unDebut, "unDebut");
        unDebut.TDS_creation(null);
        Logger.debug(unDebut.tds.toString());
    }
}
