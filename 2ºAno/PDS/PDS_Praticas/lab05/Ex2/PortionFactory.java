package lab05.Ex2;

public abstract class PortionFactory implements Portion {
    // Atributos
    private State estado;
    private Temperature temperatura;

    // Getters and Setters
    public State getState() {
        return estado;
    }

    public Temperature getTemperature() {
        return temperatura;
    }

    public void setState(State estado) {
        this.estado = estado;
    }

    public void setTemperature(Temperature temperatura) {
        this.temperatura = temperatura;
    }

    // Métodos
    public static Portion create(String nome, Temperature temperatura) {
        Portion pedido = null;

        if (nome.equalsIgnoreCase("Beverage")) {
            if (temperatura == Temperature.COLD) {
                pedido = new FruitJuice("Orange");
            } else if (temperatura == Temperature.WARM) {
                pedido = new Milk();
            }
        } else if (nome.equalsIgnoreCase("Meat")) {
            if (temperatura == Temperature.COLD) {
                pedido = new Tuna();
            } else if (temperatura == Temperature.WARM) {
                pedido = new Pork();
            }
        } else {
            System.out.println("Error! Unknown Portion used!");
            System.exit(1);
        }

        return pedido;
    }
}
