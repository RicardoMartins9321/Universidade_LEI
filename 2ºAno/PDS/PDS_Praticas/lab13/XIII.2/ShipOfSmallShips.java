import java.util.ArrayList;
import java.util.List;

public class ShipOfSmallShips implements Ship {
    private String code;
    private String name;
    private int maxShips;
    private List<PassengerShip> ships = new ArrayList<>();

    public ShipOfSmallShips(String code, String name, int maxShips) {
        this.code = code;
        this.name = name;
        this.maxShips = maxShips;
    }

    @Override
    public String code() {
        return code;
    }

    @Override
    public String name() {
        return name;
    }

    public boolean addShip(PassengerShip ship) {
        if (ships.size() < maxShips) {
            return ships.add(ship);
        }
        return false;
    }

    public boolean removeShip(PassengerShip ship) {
        return ships.remove(ship);
    }

    public List<PassengerShip> getShips() {
        return ships;
    }

    public int totalPassengerCapacity() {
        return ships.stream().mapToInt(PassengerShip::getMaxPassengers).sum();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Container Ship with ").append(ships.size()).append(" ships. Total passengers capacity: ").append(totalPassengerCapacity()).append("\n");
        for (PassengerShip ship : ships) {
            sb.append(ship).append("\n");
        }
        return sb.toString();
    }
}