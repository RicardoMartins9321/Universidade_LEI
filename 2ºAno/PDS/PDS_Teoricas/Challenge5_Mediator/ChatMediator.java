import java.util.ArrayList;
import java.util.List;

public class ChatMediator implements Mediator {
    private List<Colleague> colleagues;

    public ChatMediator() {
        colleagues = new ArrayList<>();
    }

    @Override
    public void addColleague(Colleague colleague) {
        colleagues.add(colleague);
    }

    @Override
    public void sendMessage(String message, Colleague colleague) {
        for (Colleague c : colleagues) {
            if (c != colleague) {
                c.receiveMessage(message);
            }
        }
    }
}
