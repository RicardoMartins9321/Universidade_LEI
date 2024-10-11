package Ex_10_2;

public interface Handler {
    public void handle(String request);
    public Handler setNext(Handler handler);
}
