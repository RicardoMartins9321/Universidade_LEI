import java.util.Iterator;

public class RiverPort implements Port {
    private SeaPort seaPort = new SeaPort();

    public static RiverPort create() {
        return new RiverPort();
    }

    @Override
    public boolean add(String ref, Ship p) {
        if ((p instanceof CargoShip && ((CargoShip) p).getCargo() > 10) ||
            (p instanceof PassengerShip && ((PassengerShip) p).getMaxPassengers() > 10)) {
            return false;
        }
        return seaPort.add(ref, p);
    }

    @Override
    public boolean exists(String ref) {
        return seaPort.exists(ref);
    }

    @Override
    public Ship remove(String ref) {
        return seaPort.remove(ref);
    }

    @Override
    public Iterator<String> iterator() {
        return seaPort.iterator();
    }

    @Override
    public String toString() {
        return seaPort.toString();
    }

    public Object getRiverLogger() {
        return new RiverLogger();
    }
}

