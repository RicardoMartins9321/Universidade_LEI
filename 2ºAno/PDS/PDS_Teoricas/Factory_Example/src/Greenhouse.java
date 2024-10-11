// Factory class to create trees of type Tree
// Trees can be of type "Lemon", "Orange", "Apple", "Pear"
public class Greenhouse {
    public static Tree createTree(String type) {
        if (type.equals("Lemon")) {
            return new Lemon();
        } else if (type.equals("Orange")) {
            return new Orange();
        } else if (type.equals("Apple")) {
            return new Apple();
        } else if (type.equals("Pear")) {
            return new Pear();
        } else {
            return null;
        }
    }
}

// Implementing a Tree interface
interface Tree {
    void getFruit();
}

// Implementing a Lemon class
class Lemon implements Tree {
    @Override
    public void getFruit() {
        System.out.println("Getting a Lemon");
    }
}

// Implementing an Orange class
class Orange implements Tree {
    @Override
    public void getFruit() {
        System.out.println("Getting an Orange");
    }
}       

// Implementing an Apple class
class Apple implements Tree {
    @Override
    public void getFruit() {
        System.out.println("Getting an Apple");
    }
}

// Implementing a Pear class
class Pear implements Tree {
    @Override
    public void getFruit() {
        System.out.println("Getting a Pear");
    }
}