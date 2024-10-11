package Vehicle_Customization;

// Component
interface Vehicle {
    String getDescription();
    double cost();
}

// Concrete Component
class Car implements Vehicle {
    public String getDescription() {
        return "Car";
    }

    public double cost() {
        return 20000;
    }
}

// Decorator
abstract class VehicleDecorator implements Vehicle {
    protected Vehicle vehicle;

    public VehicleDecorator(Vehicle vehicle) {
        this.vehicle = vehicle;
    }

    public abstract String getDescription();

    public abstract double cost();
}

// Concrete Decorators
class SportsFeatures extends VehicleDecorator {
    public SportsFeatures(Vehicle vehicle) {
        super(vehicle);
    }

    public String getDescription() {
        return vehicle.getDescription() + " with Sports Features";
    }

    public double cost() {
        return vehicle.cost() + 5000;
    }
}

class LuxuryFeatures extends VehicleDecorator {
    public LuxuryFeatures(Vehicle vehicle) {
        super(vehicle);
    }

    public String getDescription() {
        return vehicle.getDescription() + " with Luxury Features";
    }

    public double cost() {
        return vehicle.cost() + 8000;
    }
}

// Client
public class VehicleDemo {
    public static void main(String[] args) {
        Vehicle car = new Car();
        Vehicle sportsCar = new SportsFeatures(car);
        Vehicle luxurySportsCar = new LuxuryFeatures(sportsCar);

        System.out.println(luxurySportsCar.getDescription() + " costs $" + luxurySportsCar.cost());
    }
}
