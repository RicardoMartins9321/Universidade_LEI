package Ex_6_1;

class ChocolateCakeBuilder implements CakeBuilder {
    private Cake cake;

    public ChocolateCakeBuilder() {
        this.cake = new Cake();
    }

    @Override
    public void setCakeShape(Shape shape) {
        cake.setShape(shape);
    }

    @Override
    public void addCakeLayer() {
        cake.setCakeLayer("Soft chocolate");
    }

    @Override
    public void addCreamLayer() {
        cake.setMidLayerCream(Cream.Whipped_Cream);
    }

    @Override
    public void addTopLayer() {
        cake.setTopLayerCream(Cream.Chocolate);
    }

    @Override
    public void addTopping() {
        cake.setTopping(Topping.Fruit);
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
