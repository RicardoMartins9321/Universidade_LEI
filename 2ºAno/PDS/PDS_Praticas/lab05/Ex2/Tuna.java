package lab05.Ex2;

public class Tuna extends PortionFactory {
    // Construtor
    protected Tuna() {
        super();
        this.setTemperature(Temperature.COLD);
        this.setState(State.Solid);
    }

    @Override
    public String toString() {
        return "Tuna: " + "Temperature " + this.getTemperature() + ", State " + this.getState() ;
    }
}
