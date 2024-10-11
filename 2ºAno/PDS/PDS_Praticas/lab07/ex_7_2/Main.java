package ex_7_2;

public class Main {
    public static void main(String[] args) {
        ContactsStorageInterface storage1= new ListsContactTXT(
                "C:/Users/joaov/Desktop/tudo3/tudo2/programing/java/PDS/practical-gp311/lab07/ex_7_2/Contacts.txt");
                ContactsStorageInterface storage2 = new ListsContactTXT(
                "C:/Users/joaov/Desktop/tudo3/tudo2/programing/java/PDS/practical-gp311/lab07/ex_7_2/Contacts.dat");
        ContactManager manager = new ContactManager();
        manager.openAndLoad(storage1);
        System.out.println(manager.add(new Contact("O mundo",987123456)));
        manager.PrintContacts();
        manager.openAndLoad(storage2);
        System.out.println(manager.add(new Contact("Carlos",917133455)));
        manager.PrintContacts();
        manager.saveAndClose(storage2);

    }
}
