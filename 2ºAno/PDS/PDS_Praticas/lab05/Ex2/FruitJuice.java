package lab05.Ex2;

public class FruitJuice extends PortionFactory {
    // Atributos
    private String sabor;

    // Construtor
    protected FruitJuice(String sabor) {
        super();
        this.setTemperature(Temperature.COLD);
        this.setState(State.Liquid);
        this.sabor = sabor;
    }

    @Override
    public String toString() {
        return "FruitJuice: " + this.sabor + ", State " + this.getState() + ", Temperature " + this.getTemperature();
    }
}
