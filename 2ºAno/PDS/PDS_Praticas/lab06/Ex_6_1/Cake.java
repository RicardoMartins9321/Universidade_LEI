package Ex_6_1;

class Cake {
    private Shape shape = Shape.Circular; // default shape
    private String cakeLayer;
    private int numCakeLayers = 0;
    private Cream midLayerCream;
    private Cream topLayerCream;
    private Topping topping;
    private String message;

   // Constructor
   public Cake() {
    }

    // Setters and getters
    public void setShape(Shape shape) {
        this.shape = shape;
    }

    public void setCakeLayer(String cakeLayer) {
        this.cakeLayer = cakeLayer;
        this.addLayer();
    }

    public void setNumCakeLayers(int numCakeLayers) {
        this.numCakeLayers = numCakeLayers;
    }

    public void setMidLayerCream(Cream midLayerCream) {
        this.midLayerCream = midLayerCream;
    }

    public void setTopLayerCream(Cream topLayerCream) {
        this.topLayerCream = topLayerCream;
    }

    public void setTopping(Topping topping) {
        this.topping = topping;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public void addLayer() {
        this.numCakeLayers++;
    }

    @Override
    public String toString() {
        return cakeLayer + " cake with " + numCakeLayers +
                " layers, topped with " + topLayerCream + " cream and " + topping +
                ". Message says: \"" + message + "\"";
    }
}
