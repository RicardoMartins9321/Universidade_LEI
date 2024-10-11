package ex_7_2;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.DataOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class ListsContactBinario implements  ContactsStorageInterface {
    private String fileName;
    public ListsContactBinario(String fileName) {
        this.fileName = fileName;
    }

    @Override
    public List<Contact> loadContacts() {
        List<Contact> contacts=new ArrayList<>();
        try {
            Scanner scanner = new Scanner(new BufferedInputStream(new FileInputStream(fileName)));
            while (scanner.hasNextLine()) {
                String[] line=scanner.nextLine().split(":");
                contacts.add(new Contact(line[0], Long.parseLong(line[1].strip().split("\n")[0])));
            }
            scanner.close();
        } catch (Exception e) {
            System.out.println("Error");
            System.exit(1);
        }
        return contacts;
    }

    @Override
    public boolean saveContacts(List<Contact> list) {
        try (DataOutputStream writer =new DataOutputStream(new BufferedOutputStream(new FileOutputStream(fileName)))) {
            // Escrever no arquivo
            for (Contact contact : list) {
                writer.writeUTF(contact.getName()+":"+contact.getNumberPhone()+"\n");
            }

        } catch (IOException e) {
            e.printStackTrace();
            return false;
        } 
        return true;
    }

   
}
