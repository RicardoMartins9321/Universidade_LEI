package ex_7_2;

import java.util.ArrayList;
import java.util.List;

public class ContactManager implements ContactsInterface {
    private ContactsStorageInterface store;
    private List<Contact> contacts = new ArrayList<>();

    @Override
    public void openAndLoad(ContactsStorageInterface store) {
        for (Contact contact : store.loadContacts()) {
            add(contact);
        }
        this.store = store;
    }

    @Override
    public void saveAndClose() {
        store.saveContacts(contacts);
        contacts.clear();
    }

    @Override
    public void saveAndClose(ContactsStorageInterface store) {
        store.saveContacts(contacts);
        contacts.clear();
    }

    @Override
    public boolean exist(Contact contact) {
        for (Contact contact1 : contacts) {
            if (contact1.equals(contact)) {
                return true;
            }
        }
        return false;
    }

    @Override
    public Contact getByName(String name) {
        for (Contact contact : contacts) {
            if (contact.getName().equals(name)) {
                return contact;
            }
        }
        return null;
    }

    @Override
    public boolean add(Contact contact) {
        if (!exist(contact)) {
            contacts.add(contact);
            return true;
        }
        return false;
    }

    @Override
    public boolean remove(Contact contact) {
        if (!exist(contact)) {
            contacts.remove(contact);
            return true;
        }
        return false;
    }

    public void PrintContacts() {
        for (Contact contact : contacts) {
            System.out.println(contact);
        }
    }
}
