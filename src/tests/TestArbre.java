package tests;

import arbres.Affectation;
import arbres.Bloc;
import arbres.Constante;
import arbres.InstructionIf;
import arbres.Multiplication;
import arbres.Noeud;
import arbres.Soustraction;
import arbres.TestEgal;
import arbres.Variable;

public class TestArbre {
    public static void main(String[] args) {
        Variable x = new Variable(11);
        Variable y = new Variable();
        Constante _7 = new Constante(7);
        Multiplication calcul = new Multiplication(x, _7);
        Affectation affectY = new Affectation(y, calcul);
        Constante _77 = new Constante(77);
        Variable z = new Variable();
        Constante _1 = new Constante(1);
        Soustraction sousY = new Soustraction(y, _1);
        Affectation finducapitalisme = new Affectation(z, sousY);
        Affectation triste = new Affectation(z, y);
        TestEgal condition = new TestEgal(y, _77);
        Bloc leThen = new Bloc(new Noeud[] {finducapitalisme});
        Bloc leElse = new Bloc(new Noeud[] {triste});
        InstructionIf leIf = new InstructionIf(condition, leThen, leElse);
        Noeud[] instructions = new Noeud[] {affectY, leIf};
        Bloc arbre = new Bloc(instructions);
        System.out.println(arbre);
    }
}
