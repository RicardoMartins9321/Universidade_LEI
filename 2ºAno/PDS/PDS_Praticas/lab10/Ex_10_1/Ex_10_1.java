package Ex_10_1;

import java.util.Iterator;
import java.util.ListIterator;


public class Ex_10_1 {
    private static void addElementsToVector(VectorGeneric<Integer> vector) {
        int[] elementsToAdd = {1, 1, 2, 3, 5, 5};
        for (int element : elementsToAdd) {
            vector.addElem(element);
        }
    }

    public static void main(String[] args) {
        int i = 0;
        // Create a new VectorGeneric object
        VectorGeneric<Integer> vector = new VectorGeneric<>();
        addElementsToVector(vector);


        System.out.println("Iterating the vector using only the Iterator:");
        Iterator<Integer> iterator = vector.Iterator();
        while (iterator.hasNext()) {
            i += 1;
            Integer element = iterator.next();
            System.out.println("Element number " + i + ": " + element);
        }
        System.out.println();
        i = 0;

        System.out.println("Iterating the vector using only ListIterator (starting at index 0):");
        ListIterator<Integer> listIterator = vector.listIterator();
        while (listIterator.hasNext()) {
            i += 1;
            Integer element = listIterator.next();
            System.out.println("Element number " + i + ": " + element);
        }
        System.out.println();
        i = 0;

        System.out.println("Iterating the vector using only ListIterator (starting at index 3):");
        listIterator = vector.listIterator(3);
        while (listIterator.hasNext()) {
            i += 1;
            Integer element = listIterator.next();
            System.out.println("Element number " + i + ": " + element);
        }
        System.out.println();
        i = 0;

        System.out.println("Iterating the vector backwords using only ListIterator (starting at index 0):");
        listIterator = vector.listIterator(vector.totalElem());
        while (listIterator.hasPrevious()) {
            i += 1;
            Integer element = listIterator.previous();
            System.out.println("Element number " + i + ": " + element);
        }
        System.out.println();
        i = 0;

        System.out.println("Iterating the vector using multiple iterators simultaneously:");
        Iterator<Integer> iterator1 = vector.Iterator();
        Iterator<Integer> iterator2 = vector.Iterator();
        ListIterator<Integer> listIterator1 = vector.listIterator();
        while (iterator1.hasNext()) {
            i += 1;
            Integer element1 = iterator1.next();
            System.out.println("Iterator 1 - Element number " + i + ": " + element1);
            if (iterator2.hasNext()) {
                Integer element2 = iterator2.next();
                System.out.println("Iterator 2 - Element number " + i + ": " + element2);
            }
            if (listIterator1.hasNext()) {
                Integer element3 = listIterator1.next();
                System.out.println("ListIter 1 - Element number " + i + ": " + element3);
            }
        }
        System.out.println();
        i = 0;
    }
}
