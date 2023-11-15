package tests;

import arbres.Affectation;
import arbres.Bloc;
import arbres.Constante;
import arbres.Instanciation;
import arbres.InstructionIf;
import arbres.Multiplication;
import arbres.Noeud;
import arbres.Procedure;
import arbres.Soustraction;
import arbres.TestEgal;
import arbres.Type;
import arbres.Variable;
import outils.Logger;

public class TestArbre {
    public static void main(String[] args) {
        Instanciation instX = new Instanciation(Type.INTEGER);
        Instanciation instY = new Instanciation(Type.INTEGER);
        Instanciation instZ = new Instanciation(Type.INTEGER);
        Variable x = instX.variable;
        Variable y = instY.variable;
        Constante _11 = new Constante(11);
        Affectation affectX = new Affectation(x, _11);
        Constante _7 = new Constante(7);
        Multiplication calcul = new Multiplication(x, _7);
        Affectation affectY = new Affectation(y, calcul);
        Constante _77 = new Constante(77);
        Variable z = instZ.variable;
        Constante _1 = new Constante(1);
        Soustraction sousY = new Soustraction(y, _1);
        Affectation finducapitalisme = new Affectation(z, sousY);
        Affectation triste = new Affectation(z, y);
        TestEgal condition = new TestEgal(y, _77);
        Bloc leThen = new Bloc(new Noeud[] {finducapitalisme});
        Bloc leElse = new Bloc(new Noeud[] {triste});
        InstructionIf leIf = new InstructionIf(condition, leThen, leElse);
        Noeud[] instructions = new Noeud[] {affectX, affectY, leIf};
        Noeud[] definitions = new Noeud[] {instX, instY, instZ};
        Bloc procedureInstructions = new Bloc(instructions);
        Bloc procedureDefinitions = new Bloc(definitions);
        Procedure arbre = new Procedure("testArbre", procedureDefinitions, procedureInstructions);
        Logger.debug(arbre.toString());

        Constante _true = new Constante(true);
        Constante _false = new Constante(false);
        Constante _null = new Constante();
        Constante _char = new Constante('c');
        Logger.debug(_true.toString());
        Logger.debug(_false.toString());
        Logger.debug(_null.toString());
        Logger.debug(_char.toString());
    }
}
