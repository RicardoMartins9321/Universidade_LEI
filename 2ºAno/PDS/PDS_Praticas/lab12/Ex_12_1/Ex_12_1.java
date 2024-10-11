import java.util.ArrayList;
import java.util.List;

public class Ex_12_1 {
    public static void main(String[] args) {
        List<Telemovel> telemoveis = new ArrayList<>();
        telemoveis.add(new Telemovel("Processor1", 299.99, 6, 12));
        telemoveis.add(new Telemovel("Processor2", 399.99, 4, 16));
        telemoveis.add(new Telemovel("Processor3", 199.99, 3, 14));
        telemoveis.add(new Telemovel("Processor4", 499.99, 8, 20));

        TelemovelSorter sorter = new TelemovelSorter();

        sorter.setSortStrategy(new BubbleSort());
        System.out.println("Sorting using BubbleSort:");
        sorter.sortTelemoveis(telemoveis);
        printTelemoveis(telemoveis);

        sorter.setSortStrategy(new QuickSort());
        System.out.println("Sorting using QuickSort:");
        sorter.sortTelemoveis(telemoveis);
        printTelemoveis(telemoveis);

        sorter.setSortStrategy(new MergeSort());
        System.out.println("Sorting using MergeSort:");
        sorter.sortTelemoveis(telemoveis);
        printTelemoveis(telemoveis);

        telemoveis.sort((t1, t2) -> Double.compare(t1.getCamera(), t2.getCamera()));
        System.out.println("Sorting by camera using QuickSort:");
        printTelemoveis(telemoveis);

        sorter.setSortStrategy(new BubbleSort());
        telemoveis.sort((t1, t2) -> Integer.compare(t1.getMemoria(), t2.getMemoria()));
        System.out.println("Sorting by memory using BubbleSort:");
        printTelemoveis(telemoveis);
        }

        // Helper method to print the list of Telemovel objects
        private static void printTelemoveis(List<Telemovel> telemoveis) {
        for (Telemovel t : telemoveis) {
            System.out.println(t);
        }
    }
}

