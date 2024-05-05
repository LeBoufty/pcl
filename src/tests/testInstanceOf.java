package tests;

import arbres.InstructionFor;
import arbres.Noeud;

public class testInstanceOf {
    public static void main(String[] args) {
        Noeud n = new InstructionFor();
        System.out.println(n instanceof InstructionFor);
        InstructionFor no = null;
        System.out.println(no instanceof InstructionFor);
    }
}
