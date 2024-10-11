package Ex_10_2;

import java.util.ArrayList;

public class Ex_10_2 {
    public static void main(String[] args) {
        ArrayList<String> foodList = new ArrayList<>();
        foodList.add("veggie burger");
        foodList.add("Pasta Carbonara");
        foodList.add("PLAIN pizza, no toppings!");
        foodList.add("sushi nigiri and sashimi");
        foodList.add("salad with tuna");
        foodList.add("strawberry ice cream and waffles dessert");

        Handler chefs =  new SushiChef().setNext(
                            new PastaChef().setNext(
                                new BurgerChef().setNext(
                                    new PizzaChef().setNext(
                                        new DessertChef()
                                    )
                                )
                            )
                        );

        for (String request : foodList) {
            System.out.println("Can I please get a " + request + "?");
            chefs.handle(request);
            System.out.println();
        }
    }
}
