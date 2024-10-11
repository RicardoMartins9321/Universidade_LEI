package Ex_10_2;

public abstract class Chef implements Handler {
    protected Handler next = null;

    @Override
    public Handler setNext(Handler nextChef) {
        this.next = nextChef;
        return this;
    }

    @Override
    public void handle(String request) {
        if (next != null) {
            next.handle(request);
        } else {
            System.out.println("We're sorry but that request can't be satisfied by our service!");
        }
    }

    protected void cook(String request) {
        System.out.println(getClass().getSimpleName() + ": Starting to cook " + request + ". Out in " + this.randomTime() + " minutes!");
    }

    protected int randomTime() {
        return (int) (Math.random() * 5 + 10);
    }
}
