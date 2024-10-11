import java.io.*;

// Prototype interface
interface Prototype extends Serializable {
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
        try {
            ByteArrayOutputStream bos = new ByteArrayOutputStream();
            ObjectOutputStream out = new ObjectOutputStream(bos);
            out.writeObject(this);

            ByteArrayInputStream bis = new ByteArrayInputStream(bos.toByteArray());
            ObjectInputStream in = new ObjectInputStream(bis);
            return (Prototype) in.readObject();
        } catch (IOException | ClassNotFoundException e) {
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

        ConcretePrototype clonedPrototype = (ConcretePrototype) prototype.clone();
        System.out.println("Cloned property: " + clonedPrototype.getProperty());
    }
}
}
