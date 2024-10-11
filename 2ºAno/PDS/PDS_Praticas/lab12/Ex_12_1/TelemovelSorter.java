import java.util.List;

public class TelemovelSorter {
    private SortStrategy strategy;

    public void setSortStrategy(SortStrategy strategy) {
        this.strategy = strategy;
    }

    public void sortTelemoveis(List<Telemovel> telemoveis) {
        if (strategy != null) {
            strategy.sort(telemoveis);
        } else {
            throw new IllegalStateException("SortStrategy not set");
        }
    }
}

