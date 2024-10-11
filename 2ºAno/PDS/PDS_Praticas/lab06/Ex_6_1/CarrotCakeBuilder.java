
public class CarrotCakeBuilder implements CakeBuilder {
    private Cake chocolateCake;

    public void setCakeShape(Shape shape) {
        chocolateCake.setShape(shape);
    }

    public void addCakeLayer() {
        chocolateCake.addLayer();
    }

    public void addCreamLayer() {
        chocolateCake.setMidLayerCream(Cream.NULL);
    }

    public void addTopLayer() {
        chocolateCake.setTopLayerCream(Cream.Chocolate);
    }

    public void addTopping() {
        chocolateCake.setTopping(Topping.NULL);
    }

    public void addMessage(String m) {
        chocolateCake.setMessage(m);
    }

    public void createCake() {
    }

    public Cake getCake() {
        return chocolateCake;
    }
}

