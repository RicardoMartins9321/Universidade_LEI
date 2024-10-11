// Lemon juice can exist in metal, plastic, or glass containers
public interface LemonJuice {
    void drink();
}

// Implement MetalLemonJuice class
class MetalLemonJuice implements LemonJuice {
    @Override
    public void drink() {
        System.out.println("Drinking Lemon Juice from a Metal Container");
    }
}   

// Implement PlasticLemonJuice class
class PlasticLemonJuice implements LemonJuice {
    @Override
    public void drink() {
        System.out.println("Drinking Lemon Juice from a Plastic Container");
    }
}

// Implement GlassLemonJuice class
class GlassLemonJuice implements LemonJuice {
    @Override
    public void drink() {
        System.out.println("Drinking Lemon Juice from a Glass Container");
    }
}