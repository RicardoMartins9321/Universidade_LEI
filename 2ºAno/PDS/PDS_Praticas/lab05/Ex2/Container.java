package lab05.Ex2;

public abstract class Container {
    // Atributes
    private Portion portion;

    // Constructor
    public Container(Portion portion) {
        this.portion = portion;
    }

    // Getters
    public Portion getPortion() {
        return portion;
    }

    // Factory method
    public static Container create(Portion menu) {
        switch (menu.getState()) {
            case Liquid:
                if (menu.getTemperature()== Temperature.COLD) {
                    return new PlasticBottle(menu);
                }
                return new TermicBottle(menu);
            case Solid:
                if (menu.getTemperature() == Temperature.COLD) {
                    return new PlasticBag(menu);
                }
                return new Tupperware(menu);
            default:
                System.out.println("Error! Unknown State used!");
                System.exit(1);
        }
        return null;
    }
}
