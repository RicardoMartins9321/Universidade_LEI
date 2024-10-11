package Ex_6_1;


class SpongeCakeBuilder implements CakeBuilder {
    private Cake cake;

    public SpongeCakeBuilder() {
        this.cake = new Cake();
    }

    @Override
    public void setCakeShape(Shape shape) {
        cake.setShape(shape);
    }

    @Override
    public void addCakeLayer() {
        cake.setCakeLayer("Sponge");
    }

    @Override
    public void addCreamLayer() {
        cake.setMidLayerCream(Cream.Red_Berries);
    }

    @Override
    public void addTopLayer() {
        cake.setTopLayerCream(Cream.Whipped_Cream);
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
