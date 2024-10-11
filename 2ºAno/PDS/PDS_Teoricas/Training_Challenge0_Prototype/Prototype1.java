// Prototype interface
interface Prototype1 {
    Prototype1 clone();
}

// Concrete prototype
class ConcretePrototype implements Prototype1 {
    private String property;

    public ConcretePrototype(String property) {
        this.property = property;
    }

    @Override
    public Prototype1 clone() {
        return new ConcretePrototype(this.property);
    }

    public void setProperty(String property) {
        this.property = property;
    }

    public String getProperty() {
        return property;
    }
}

// Main class
public class Main {
    public static void main(String[] args) {
        ConcretePrototype prototype = new ConcretePrototype("Initial property");

        ConcretePrototype clonedPrototype = (ConcretePrototype) prototype.clone();
        System.out.println("Cloned property: " + clonedPrototype.getProperty());
    }
}
