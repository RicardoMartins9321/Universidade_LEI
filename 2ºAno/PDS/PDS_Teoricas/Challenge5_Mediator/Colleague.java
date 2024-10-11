public class Colleague {
    private Mediator mediator;

    public Colleague(Mediator mediator) {
        this.mediator = mediator;
    }

    public void sendMessage() {
        mediator.sendMessage("Message from " + this.toString(), this);
    }

    public void receiveMessage(String message) {
        System.out.println(this + " received: " + message);
    }

    @Override
    public String toString() {
        return "Colleague " + this.hashCode() + " " + this.getClass().getSimpleName();
    }
}
