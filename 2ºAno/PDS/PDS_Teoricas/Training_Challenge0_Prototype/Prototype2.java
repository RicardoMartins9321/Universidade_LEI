import java.util.HashMap;
import java.util.Map;

// Prototype interface
interface Prototype {
    Prototype clone();
}

// Concrete prototype
class ConcretePrototype implements Prototype {
    private String property;

    public ConcretePrototype(String property) {
        this.property = property;
    }

    @Override
    public Prototype clone() {
        return new ConcretePrototype(this.property);
    }

    public void setProperty(String property) {
        this.property = property;
    }

    public String getProperty() {
        return property;
    }
}

// Prototype registry
class PrototypeRegistry {
    private static final Map<String, Prototype> prototypes = new HashMap<>();

    public static void addPrototype(String key, Prototype prototype) {
        prototypes.put(key, prototype);
    }

    public static Prototype getPrototype(String key) {
        return prototypes.get(key).clone();
    }
}

// Main class
public class Main {
    public static void main(String[] args) {
        ConcretePrototype prototype = new ConcretePrototype("Initial property");
        PrototypeRegistry.addPrototype("prototype", prototype);

        ConcretePrototype clonedPrototype = (ConcretePrototype) PrototypeRegistry.getPrototype("prototype");
        System.out.println("Cloned property: " + clonedPrototype.getProperty());
    }
}

