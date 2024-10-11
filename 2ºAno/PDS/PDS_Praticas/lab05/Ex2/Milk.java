package lab05.Ex2;

public class Milk extends PortionFactory {
    // Construtor
    protected Milk() {
        super();
        this.setTemperature(Temperature.WARM);
        this.setState(State.Liquid);
    }

    @Override
    public String toString() {
        return "Milk: " + "State " + this.getState() + ", Temperature " + this.getTemperature();
    }
}
