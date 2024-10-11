import java.util.Collections;
import java.util.List;


public class BubbleSort implements SortStrategy {
    @Override
    public void sort(List<Telemovel> telemoveis) {
        int n = telemoveis.size();
        boolean swapped;
        do {
            swapped = false;
            for (int i = 0; i < n - 1; i++) {
                if (telemoveis.get(i).getPreco() > telemoveis.get(i + 1).getPreco()) {
                    Collections.swap(telemoveis, i, i + 1);
                    swapped = true;
                }
            }
        } while (swapped);
    }
}
