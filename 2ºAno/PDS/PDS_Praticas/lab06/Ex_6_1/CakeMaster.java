package Ex_6_1;

class CakeMaster {
    private CakeBuilder cakeBuilder;

    public void setCakeBuilder(CakeBuilder cakeBuilder) {
        this.cakeBuilder = cakeBuilder;
    }

    public void createCake(String message) {
        cakeBuilder.addCakeLayer();
        cakeBuilder.addCreamLayer();
        cakeBuilder.addTopLayer();
        cakeBuilder.addTopping();
        cakeBuilder.addMessage(message);
    }

    public void createCake(Shape shape, int numLayers, String message) {
        cakeBuilder.setCakeShape(shape);
        cakeBuilder.addCakeLayer();
        for (int i = 1; i < numLayers; i++) {
            cakeBuilder.addCakeLayer();
            cakeBuilder.addCreamLayer();
        }
        cakeBuilder.addTopLayer();
        cakeBuilder.addTopping();
        cakeBuilder.addMessage(message);
        cakeBuilder.createCake();
    }

    public void createCake(int numLayers, String message) {
        cakeBuilder.addCakeLayer();
        for (int i = 1; i < numLayers; i++) {
            cakeBuilder.addCakeLayer();
            cakeBuilder.addCreamLayer();
        }
        cakeBuilder.addTopLayer();
        cakeBuilder.addTopping();
        cakeBuilder.addMessage(message);
        cakeBuilder.createCake();
    }

    public Cake getCake() {
        return cakeBuilder.getCake();
    }
}
