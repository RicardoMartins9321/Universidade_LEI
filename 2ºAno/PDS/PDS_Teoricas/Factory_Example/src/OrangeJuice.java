// Oranje juice can exist in metal, plastic, or glass containers
public interface OrangeJuice {
    void drink();
}

// Implement MetalOrangeJuice class
class MetalOrangeJuice implements OrangeJuice {
    @Override
    public void drink() {
        System.out.println("Drinking Orange Juice from a Metal Container");
    }
}

// Implement PlasticOrangeJuice class
class PlasticOrangeJuice implements OrangeJuice {
    @Override
    public void drink() {
        System.out.println("Drinking Orange Juice from a Plastic Container");
    }
}

// Implement GlassOrangeJuice class
class GlassOrangeJuice implements OrangeJuice {
    @Override
    public void drink() {
        System.out.println("Drinking Orange Juice from a Glass Container");
    }
}
