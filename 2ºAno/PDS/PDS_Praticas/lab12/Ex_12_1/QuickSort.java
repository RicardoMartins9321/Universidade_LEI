import java.util.Collections;
import java.util.List;


public class QuickSort implements SortStrategy {
    @Override
    public void sort(List<Telemovel> telemoveis) {
        quickSort(telemoveis, 0, telemoveis.size() - 1);
    }

    private void quickSort(List<Telemovel> telemoveis, int low, int high) {
        if (low < high) {
            int pi = partition(telemoveis, low, high);
            quickSort(telemoveis, low, pi - 1);
            quickSort(telemoveis, pi + 1, high);
        }
    }

    private int partition(List<Telemovel> telemoveis, int low, int high) {
        double pivot = telemoveis.get(high).getPreco();
        int i = (low - 1);
        for (int j = low; j < high; j++) {
            if (telemoveis.get(j).getPreco() < pivot) {
                i++;
                Collections.swap(telemoveis, i, j);
            }
        }
        Collections.swap(telemoveis, i + 1, high);
        return i + 1;
    }
}