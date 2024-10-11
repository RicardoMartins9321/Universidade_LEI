package Pizza_Toppings;

// Component
interface Pizza {
    String getDescription();
    double getCost();
}

// Concrete Component
class PlainPizza implements Pizza {
    public String getDescription() {
        return "Plain Pizza";
    }

    public double getCost() {
        return 4.00;
    }
}

// Decorator
abstract class PizzaDecorator implements Pizza {
    protected Pizza pizza;

    public PizzaDecorator(Pizza pizza) {
        this.pizza = pizza;
    }

    public String getDescription() {
        return pizza.getDescription();
    }

    public double getCost() {
        return pizza.getCost();
    }
}

// Concrete Decorators
class Cheese extends PizzaDecorator {
    public Cheese(Pizza pizza) {
        super(pizza);
    }

    public String getDescription() {
        return pizza.getDescription() + ", Cheese";
    }

    public double getCost() {
        return pizza.getCost() + 1.25;
    }
}

class Pepperoni extends PizzaDecorator {
    public Pepperoni(Pizza pizza) {
        super(pizza);
    }

    public String getDescription() {
        return pizza.getDescription() + ", Pepperoni";
    }

    public double getCost() {
        return pizza.getCost() + 1.50;
    }
}

// Client
public class PizzaShop {
    public static void main(String[] args) {
        Pizza pizza = new PlainPizza();
        pizza = new Cheese(pizza);
        pizza = new Pepperoni(pizza);

        System.out.println(pizza.getDescription() + " Cost: $" + pizza.getCost());
    }
}

