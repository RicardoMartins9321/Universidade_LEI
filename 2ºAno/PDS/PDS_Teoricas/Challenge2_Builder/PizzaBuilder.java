package Challenge2_Builder_112876;

public class PizzaBuilder {
    public static void main(String[] args) {
        Pizza hawaiianPizza = new Pizza.Builder()
                .setCrust("thick")
                .setSauce("tomato")
                .addTopping("ham")
                .addTopping("pineapple")
                .build();

        Pizza spicyPizza = new Pizza.Builder()
                .setCrust("thin")
                .setSauce("spicy tomato")
                .addTopping("pepperoni")
                .addTopping("jalapenos")
                .build();

        Pizza veggiePizza = new Pizza.Builder()
                .setCrust("thin")
                .setSauce("tomato")
                .addTopping("bell peppers")
                .addTopping("mushrooms")
                .build();

        Pizza meatLoversPizza = new Pizza.Builder()
                .setCrust("thick")
                .setSauce("barbecue")
                .addTopping("bacon")
                .addTopping("sausage")
                .build();

        Pizza margheritaPizza = new Pizza.Builder()
                .setCrust("thin")
                .setSauce("tomato")
                .addTopping("mozzarella")
                .addTopping("basil")
                .build();

        System.out.println("Hawaiian Pizza:");
        System.out.println("Crust: " + hawaiianPizza.getCrust());
        System.out.println("Sauce: " + hawaiianPizza.getSauce());
        System.out.println("Toppings: " + hawaiianPizza.getToppings());

        System.out.println("\nSpicy Pizza:");
        System.out.println("Crust: " + spicyPizza.getCrust());
        System.out.println("Sauce: " + spicyPizza.getSauce());
        System.out.println("Toppings: " + spicyPizza.getToppings());

        System.out.println("\nVeggie Pizza:");
        System.out.println("Crust: " + veggiePizza.getCrust());
        System.out.println("Sauce: " + veggiePizza.getSauce());
        System.out.println("Toppings: " + veggiePizza.getToppings());

        System.out.println("\nMeat Lovers Pizza:");
        System.out.println("Crust: " + meatLoversPizza.getCrust());
        System.out.println("Sauce: " + meatLoversPizza.getSauce());
        System.out.println("Toppings: " + meatLoversPizza.getToppings());

        System.out.println("\nMargherita Pizza:");
        System.out.println("Crust: " + margheritaPizza.getCrust());
        System.out.println("Sauce: " + margheritaPizza.getSauce());
        System.out.println("Toppings: " + margheritaPizza.getToppings());
    }
}
