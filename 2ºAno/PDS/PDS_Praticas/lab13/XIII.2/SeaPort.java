import java.util.Map;
import java.util.HashMap;
import java.util.Iterator;

public class SeaPort implements Port{
    private Map<String, Ship> ships = new HashMap<String, Ship>();

    public boolean add(String ref, Ship p) {
        ships.put(ref, p);
        return true;
    }

    public boolean exists(String ref) {
        return ships.containsKey(ref);
    }

    public Ship remove(String ref) {
        return ships.remove(ref);
    }

    public Iterator<String> iterator() {
        return ships.keySet().iterator();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        for (Map.Entry<String, Ship> entry : ships.entrySet()) {
            sb.append("Ref: ").append(entry.getKey()).append(" - ").append(entry.getValue()).append("\n");
        }
        return sb.toString();
    }
}
