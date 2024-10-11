public class Car {
    private final String make;
    private final String model;
    private final int year;

    private Car(Builder builder) {
        this.make = builder.make;
        this.model = builder.model;
        this.year = builder.year;
    }

    public String getMake() {
        return make;
    }

    public String getModel() {
        return model;
    }

    public int getYear() {
        return year;
    }

    public static class Builder {
        private String make;
        private String model;
        private int year;

        public Builder setMake(String make) {
            this.make = make;
            return this;
        }

        public Builder setModel(String model) {
            this.model = model;
            return this;
        }

        public Builder setYear(int year) {
            this.year = year;
            return this;
        }

        public Car build() {
            return new Car(this);
        }
    }
}

// Usage:
public class Main {
    public static void main(String[] args) {
        Car car = new Car.Builder()
                .setMake("Toyota")
                .setModel("Camry")
                .setYear(2022)
                .build();

        System.out.println("Make: " + car.getMake());
        System.out.println("Model: " + car.getModel());
        System.out.println("Year: " + car.getYear());
    }
}
