// Apple juice can exist in metal, plastic, or glass containers
public interface AppleJuice {
    void drink();
}

// Implement MetalAppleJuice class
class MetalAppleJuice implements AppleJuice {
    @Override
    public void drink() {
        System.out.println("Drinking Apple Juice from a Metal Container");
    }
}

// Implement PlasticAppleJuice class
class PlasticAppleJuice implements AppleJuice {
    @Override
    public void drink() {
        System.out.println("Drinking Apple Juice from a Plastic Container");
    }
}

// Implement GlassAppleJuice class
class GlassAppleJuice implements AppleJuice {
    @Override
    public void drink() {
        System.out.println("Drinking Apple Juice from a Glass Container");
    }
}
