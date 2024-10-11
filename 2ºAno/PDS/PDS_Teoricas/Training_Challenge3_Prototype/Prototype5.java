// Concrete prototype implementing Cloneable interface
class ConcretePrototype implements Cloneable {
    private String property;

    public ConcretePrototype(String property) {
        this.property = property;
    }

    @Override
    public ConcretePrototype clone() {
        try {
            return (ConcretePrototype) super.clone();
        } catch (CloneNotSupportedException e) {
            e.printStackTrace();
            return null;
        }
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

        ConcretePrototype clonedPrototype = prototype.clone();
        System.out.println("Cloned property: " + clonedPrototype.getProperty());
    }
}
