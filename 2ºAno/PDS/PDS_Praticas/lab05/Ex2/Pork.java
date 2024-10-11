package lab05.Ex2;

public class Pork extends PortionFactory {
    // Construtor
    protected Pork() {
        super();
        this.setTemperature(Temperature.WARM);
        this.setState(State.Solid);
    }

    @Override
    public String toString() {
        return "Pork: " + "State " + this.getState() + ", Temperature " + this.getTemperature() ;
    }
}
