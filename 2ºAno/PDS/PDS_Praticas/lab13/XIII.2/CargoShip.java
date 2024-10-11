
public class CargoShip implements Ship {
    private String code;
    private String name;
    private double cargo;

    public CargoShip(String code, String name, double cargo) {
        this.code = code;
        this.name = name;
        this.cargo = cargo;
    }

    @Override
    public String code() {
        return code;
    }

    @Override
    public String name() {
        return name;
    }

    public double getCargo() {
        return cargo;
    }

    @Override
    public String toString() {
        return "CargoShip [code=" + code + ", name=" + name + ", cargo=" + cargo + "]";
    }
}
