package Ex_6_1;

class YogurtCakeBuilder implements CakeBuilder {
    private Cake cake;

    public YogurtCakeBuilder() {
        this.cake = new Cake();
    }

    @Override
    public void setCakeShape(Shape shape) {
        cake.setShape(shape);
    }

    @Override
    public void addCakeLayer() {
        cake.setCakeLayer("Yogurt");
    }

    @Override
    public void addCreamLayer() {
        cake.setMidLayerCream(Cream.Vanilla);
    }

    @Override
    public void addTopLayer() {
        cake.setTopLayerCream(Cream.Red_Berries);
    }

    @Override
    public void addTopping() {
        cake.setTopping(Topping.Chocolate);
    }

    @Override
    public void addMessage(String message) {
        cake.setMessage(message);
    }

    @Override
    public void createCake() {
    }

    @Override
    public Cake getCake() {
        return cake;
    }
}