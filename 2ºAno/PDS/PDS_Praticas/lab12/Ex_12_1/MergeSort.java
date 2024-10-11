import java.util.List;
import java.util.ArrayList;


public class MergeSort implements SortStrategy {
    @Override
    public void sort(List<Telemovel> telemoveis) {
        mergeSort(telemoveis, 0, telemoveis.size() - 1);
    }

    private void mergeSort(List<Telemovel> telemoveis, int left, int right) {
        if (left < right) {
            int mid = (left + right) / 2;
            mergeSort(telemoveis, left, mid);
            mergeSort(telemoveis, mid + 1, right);
            merge(telemoveis, left, mid, right);
        }
    }

    private void merge(List<Telemovel> telemoveis, int left, int mid, int right) {
        int n1 = mid - left + 1;
        int n2 = right - mid;

        List<Telemovel> leftList = new ArrayList<>(n1);
        List<Telemovel> rightList = new ArrayList<>(n2);

        for (int i = 0; i < n1; i++) {
            leftList.add(telemoveis.get(left + i));
        }
        for (int j = 0; j < n2; j++) {
            rightList.add(telemoveis.get(mid + 1 + j));
        }

        int i = 0, j = 0;
        int k = left;

        while (i < n1 && j < n2) {
            if (leftList.get(i).getPreco() <= rightList.get(j).getPreco()) {
                telemoveis.set(k, leftList.get(i));
                i++;
            } else {
                telemoveis.set(k, rightList.get(j));
                j++;
            }
            k++;
        }

        while (i < n1) {
            telemoveis.set(k, leftList.get(i));
            i++;
            k++;
        }

        while (j < n2) {
            telemoveis.set(k, rightList.get(j));
            j++;
            k++;
        }
    }
}