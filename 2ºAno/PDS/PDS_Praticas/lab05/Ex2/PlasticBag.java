package lab05.Ex2;

public class PlasticBag extends Container {
    // Construtor
    protected PlasticBag(Portion portion) {
        super(portion);
    }

    @Override
    public String toString() {
        return "PlasticBag with portion = " + getPortion().toString();
    }

}
