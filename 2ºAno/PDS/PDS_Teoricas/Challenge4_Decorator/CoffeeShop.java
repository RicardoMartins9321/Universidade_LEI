package Challenge4_Decorator_112876;

// Component
interface Coffee {
    String getDescription();
    double getCost();
}

// Concrete Component
class BasicCoffee implements Coffee {
    public String getDescription() {
        return "Basic Coffee";
    }

    public double getCost() {
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

    public abstract double getCost();
}

// Concrete Decorators
class Milk extends CoffeeDecorator {
    public Milk(Coffee coffee) {
        super(coffee);
    }

    public String getDescription() {
        return coffee.getDescription() + ", Milk";
    }

    public double getCost() {
        return coffee.getCost() + 0.5;
    }
}

class Caramel extends CoffeeDecorator {
    public Caramel(Coffee coffee) {
        super(coffee);
    }

    public String getDescription() {
        return coffee.getDescription() + ", Caramel";
    }

    public double getCost() {
        return coffee.getCost() + 0.8;
    }
}

// Client
public class CoffeeShop {
    public static void main(String[] args) {
        Coffee coffee = new BasicCoffee();
        System.out.println(coffee.getDescription() + " $" + coffee.getCost());

        Coffee milkCoffee = new Milk(coffee);
        System.out.println(milkCoffee.getDescription() + " $" + milkCoffee.getCost());

        Coffee carameledMilkCoffee = new Caramel(milkCoffee);
        System.out.println(carameledMilkCoffee.getDescription() + " $" + carameledMilkCoffee.getCost());
    }
}

