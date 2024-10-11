package Ex_11_3;

public interface Mediator {
    void sendMessage(String message, Colleague colleague);
    void addColleague(Colleague colleague);
}
