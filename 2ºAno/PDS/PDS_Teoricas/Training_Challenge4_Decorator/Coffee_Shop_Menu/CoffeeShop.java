package Coffee_Shop_Menu;


// Component
interface Coffee {
    String getDescription();
    double cost();
}

// Concrete Component
class BasicCoffee implements Coffee {
    public String getDescription() {
        return "Basic Coffee";
    }

    public double cost() {
        return 1.0;
    }
}

// Decorator
abstract class CoffeeDecorator implements Coffee {
    protected Coffee coffee;

    public CoffeeDecorator(Coffee coffee) {
        this.coffee = coffee;
    }

    public abstract String getDescription();

    public abstract double cost();
}

// Concrete Decorators
class Milk extends CoffeeDecorator {
    public Milk(Coffee coffee) {
        super(coffee);
    }

    public String getDescription() {
        return coffee.getDescription() + ", Milk";
    }

    public double cost() {
        return coffee.cost() + 0.5;
    }
}

class Sugar extends CoffeeDecorator {
    public Sugar(Coffee coffee) {
        super(coffee);
    }

    public String getDescription() {
        return coffee.getDescription() + ", Sugar";
    }

    public double cost() {
        return coffee.cost() + 0.2;
    }
}

// Client
public class CoffeeShop {
    public static void main(String[] args) {
        Coffee coffee = new BasicCoffee();
        System.out.println(coffee.getDescription() + " $" + coffee.cost());

        Coffee milkCoffee = new Milk(coffee);
        System.out.println(milkCoffee.getDescription() + " $" + milkCoffee.cost());

        Coffee sweetMilkCoffee = new Sugar(milkCoffee);
        System.out.println(sweetMilkCoffee.getDescription() + " $" + sweetMilkCoffee.cost());
    }
}

