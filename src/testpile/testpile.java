package testpile;

import java.util.Stack;

public class testpile {

    public Stack<Integer> pile = new Stack<Integer>();


    //push permet d'ajouter un élément à la pile
    public void push(Integer i) {
        pile.push(i);
    }

    //pop permet de retirer un élément de la pile
    public Integer pop() {
        return pile.pop();
    }

    //peek permet de voir le dernier élément de la pile
    public Integer peek() {
        return pile.peek();
    }

    //empty permet de savoir si la pile est vide
    public boolean empty() {
        return pile.empty();
    }
    
    //size permet de connaitre la taille de la pile
    public int size() {
        return pile.size();
    }

    //search permet de connaitre la position d'un élément dans la pile
    public int search(Integer i) {
        return pile.search(i);
    }

    //toString permet d'afficher la pile
    public String toString() {
        return pile.toString();
    }

    //indexOf permet de connaitre la position d'un élément dans la pile
    public int indexOf(Integer i) {
        return pile.indexOf(i);
    }

    //lastIndexOf permet de connaitre la position d'un élément dans la pile
    public int lastIndexOf(Integer i) {
        return pile.lastIndexOf(i);
    }

    //remove permet de supprimer un élément de la pile
    public Integer remove(int i) {
        return pile.remove(i);
    }
    
    //removeif permet de supprimer un élément de la pile
    public boolean removeif(Integer i) {
        return pile.removeIf(element -> element < i);
    }
    
    //removeAll permet de supprimer un élément de la pile
    public boolean removeAll(Integer i) {
        return pile.removeAll(pile);
    }

    //clear permet de vider la pile
    public void clear() {
        pile.clear();
    }

    public static void main(String[] args) {
        testpile pile = new testpile();
        pile.push(1);
        pile.push(2);
        pile.push(3);
        pile.push(4);
        pile.push(5);
        System.out.println(pile);
        System.out.println(pile.pop());
        System.out.println(pile);
        System.out.println(pile.peek());
        System.out.println(pile);
        System.out.println(pile.empty());
        System.out.println(pile.size());
        System.out.println(pile.search(3));
        System.out.println(pile.indexOf(3));
        System.out.println(pile.lastIndexOf(3));
        System.out.println(pile.remove(3));
        System.out.println(pile);
        System.out.println(pile.removeif(3));
        System.out.println(pile);
        System.out.println(pile.removeAll(3));
        System.out.println(pile);
        pile.clear();
        System.out.println(pile);
    }

}