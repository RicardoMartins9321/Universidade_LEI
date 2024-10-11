package Ex_11_3;

public class User extends Colleague {
    private String name;

    public User(Mediator mediator, String name) {
        super(mediator);
        this.name = name;
    }

    @Override
    public void send(String message) {
        System.out.println(this.name + " enviou uma mensagem: " + message);
        mediator.sendMessage(message, this);
    }

    @Override
    public void receive(String message) {
        System.out.println(this.name + " recebeu uma mensagem: " + message);
    }
}

