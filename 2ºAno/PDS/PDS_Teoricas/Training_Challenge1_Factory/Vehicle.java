// Product interface
interface MotorVehicle {
    void build();
}

// Concrete Products
class Car implements MotorVehicle {
    @Override
    public void build() {
        System.out.println("Build Car");
    }
}

class Motorcycle implements MotorVehicle {
    @Override
    public void build() {
        System.out.println("Build Motorcycle");
    }
}

// Creator class
abstract class MotorVehicleFactory {
    public MotorVehicle create() {
        MotorVehicle vehicle = createMotorVehicle();
        vehicle.build();
        return vehicle;
    }
    protected abstract MotorVehicle createMotorVehicle();
}

// Concrete Creators
class CarFactory extends MotorVehicleFactory {
    @Override
    protected MotorVehicle createMotorVehicle() {
        return new Car();
    }
}

class MotorcycleFactory extends MotorVehicleFactory {
    @Override
    protected MotorVehicle createMotorVehicle() {
        return new Motorcycle();
    }
}

// Client code
public class Main {
    public static void main(String[] args) {
        MotorVehicleFactory carFactory = new CarFactory();
        MotorVehicle car = carFactory.create();
        car.build(); // Output: Build Car

        MotorVehicleFactory motorcycleFactory = new MotorcycleFactory();
        MotorVehicle motorcycle = motorcycleFactory.create();
        motorcycle.build(); // Output: Build Motorcycle
    }
}
