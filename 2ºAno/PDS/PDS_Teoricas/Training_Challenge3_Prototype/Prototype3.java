// Prototype interface
interface Prototype {
    Prototype clone();
}

// Concrete prototype
class ConcretePrototype implements Prototype {
    private String[] properties;

    public ConcretePrototype(String[] properties) {
        this.properties = properties;
    }

    @Override
    public Prototype clone() {
        return new ConcretePrototype(this.properties.clone());
    }

    public void setProperties(String[] properties) {
        this.properties = properties;
    }

    public String[] getProperties() {
        return properties;
    }
}

// Main class
public class Main {
    public static void main(String[] args) {
        String[] initialProperties = {"Property 1", "Property 2"};
        ConcretePrototype prototype = new ConcretePrototype(initialProperties);

        ConcretePrototype clonedPrototype = (ConcretePrototype) prototype.clone();

        // Modify the properties of the cloned object
        clonedPrototype.getProperties()[0] = "Modified Property";

        // Print properties of original object
        System.out.println("Original properties:");
        for (String property : prototype.getProperties()) {
            System.out.println(property);
        }

        // Print properties of cloned object
        System.out.println("\nCloned properties:");
        for (String property : clonedPrototype.getProperties()) {
            System.out.println(property);
        }
    }
}
