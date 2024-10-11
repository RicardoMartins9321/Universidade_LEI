package Ex_11_3;

import java.util.ArrayList;
import java.util.List;

public class ChatMediator implements Mediator {
    private List<Colleague> colleagues;

    public ChatMediator() {
        colleagues = new ArrayList<>();
    }

    @Override
    public void sendMessage(String message, Colleague colleague) {
        for (Colleague c : colleagues) {
            // Mensagem não deve ser recebida pelo colega que a enviou
            if (c != colleague) {
                c.receive(message);
            }
        }
    }

    @Override
    public void addColleague(Colleague colleague) {
        colleagues.add(colleague);
    }
}

