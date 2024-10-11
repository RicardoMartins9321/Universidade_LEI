import java.util.ArrayList;
import java.util.List;

public class Pizza {
    private final String crust;
    private final String sauce;
    private final List<String> toppings;

    private Pizza(Builder builder) {
        this.crust = builder.crust;
        this.sauce = builder.sauce;
        this.toppings = builder.toppings;
    }

    public String getCrust() {
        return crust;
    }

    public String getSauce() {
        return sauce;
    }

    public List<String> getToppings() {
        return toppings;
    }

    public static class Builder {
        private String crust;
        private String sauce;
        private List<String> toppings = new ArrayList<>();

        public Builder setCrust(String crust) {
            this.crust = crust;
            return this;
        }

        public Builder setSauce(String sauce) {
            this.sauce = sauce;
            return this;
        }

        public Builder addTopping(String topping) {
            this.toppings.add(topping);
            return this;
        }

        public Pizza build() {
            return new Pizza(this);
        }
    }
}

// Usage:
public class Main {
    public static void main(String[] args) {
        Pizza pizza = new Pizza.Builder()
                .setCrust("thin")
                .setSauce("tomato")
                .addTopping("cheese")
                .addTopping("pepperoni")
                .build();

        System.out.println("Crust: " + pizza.getCrust());
        System.out.println("Sauce: " + pizza.getSauce());
        System.out.println("Toppings: " + pizza.getToppings());
    }
}

