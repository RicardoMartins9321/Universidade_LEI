package Ex_10_2;

public class BurgerChef extends Chef {

    @Override
    public Handler setNext(Handler nextChef) {
        this.next = nextChef;
        return this;
    }

    @Override
    public void handle(String request) {
        if (request.toLowerCase().contains("burger")) {
            this.cook(request);
        }
        else {
            System.out.println(getClass().getSimpleName() + ": I can't cook that.");
            super.handle(request);
        }
    }
}
