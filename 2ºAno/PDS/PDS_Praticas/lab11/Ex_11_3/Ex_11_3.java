package Ex_11_3;

public class Ex_11_3 {
    public static void main(String[] args) {
        Mediator mediator = new ChatMediator();

        Colleague user1 = new User(mediator, "User1");
        Colleague user2 = new User(mediator, "User2");
        Colleague user3 = new User(mediator, "User3");
        Colleague user4 = new User(mediator, "User4");

        mediator.addColleague(user1);
        mediator.addColleague(user2);
        mediator.addColleague(user3);
        mediator.addColleague(user4);

        user1.send("Olá, a todos!");
        System.out.println();
        user2.send("Olá, User1!");
        System.out.println();
        user3.send("Adeus, User1!");
        System.out.println();
        user4.send("Adeus, a todos!");
    }
}
