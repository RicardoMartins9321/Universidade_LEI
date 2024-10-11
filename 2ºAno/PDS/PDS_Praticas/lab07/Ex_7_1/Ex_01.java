package Ex_7_1;

import java.util.List;
import Ex_7_1.DataConnecter;

public class Ex_01 {
    public static void main(String[] args) {
        System.out.println("\nTesting Alinea 1");

        // Sweets Database Test
        System.out.println("\nTesting - Sweets");

        Database sweetsDb = new Database();

        Employee emp1 = new Employee("Laura Monteiro", 5001, 5500);
        Employee emp2 = new Employee("Marco Silva", 5002, 6200);
        Employee emp3 = new Employee("Sara Sousa", 5003, 5700);
        Employee emp4 = new Employee("Rui Costa", 5004, 6100);

        sweetsDb.addEmployee(emp1);
        sweetsDb.addEmployee(emp2);
        sweetsDb.addEmployee(emp3);
        sweetsDb.addEmployee(emp4);

        Employee[] sweetsEmployees = sweetsDb.getAllEmployees();

        for (Employee emp : sweetsEmployees) {
            System.out.println(emp);
        }

        sweetsDb.deleteEmployee(5003);
        sweetsDb.deleteEmployee(5001);

        System.out.println("\nAfter removing employees from Sweets\n");
        sweetsEmployees = sweetsDb.getAllEmployees();
        for (Employee emp : sweetsEmployees) {
            System.out.println(emp);
        }

        // Petiscos Registry Test
        System.out.println("\nTesting - Petiscos");

        Registos petiscosRegistry = new Registos();

        Empregado empregado1 = new Empregado("Beatriz", "Mendes", 101, 4300);
        Empregado empregado2 = new Empregado("Carlos", "Oliveira", 102, 3900);
        Empregado empregado3 = new Empregado("Diana", "Ferreira", 103, 4600);
        Empregado empregado4 = new Empregado("Eduardo", "Pereira", 104, 4800);

        petiscosRegistry.insere(empregado1);
        petiscosRegistry.insere(empregado2);
        petiscosRegistry.insere(empregado3);
        petiscosRegistry.insere(empregado4);

        System.out.println("\nChecking if employee 101 is in the registry");
        System.out.println(petiscosRegistry.isEmpregado(101) ? "Employee 101 is in the registry." : "Employee 101 is not in the registry.");

        petiscosRegistry.remove(101);

        System.out.println("\nAfter removing employee 101");
        System.out.println(petiscosRegistry.isEmpregado(101) ? "Employee 101 is in the registry." : "Employee 101 is not in the registry.");

        List<Empregado> petiscosEmployees = petiscosRegistry.listaDeEmpregados();
        for (Empregado emp : petiscosEmployees) {
            System.out.println(emp);
        }


        System.out.println("\nTesting Alinea 2");

        Adapter sweetsAdapter = new Adapter_Sweets(sweetsDb);
        Adapter petiscosAdapter = new Adapter_Petiscos(petiscosRegistry);

        DataConnecter jointDatabase = new DataConnecter(sweetsAdapter, petiscosAdapter);

        System.out.println("\n- Joint Database Initial Data:");
        jointDatabase.printAll();

        // Adding new employees to the joint database
        jointDatabase.addEmpregado(new Empregado("Felipe", "Gomes", 201, 5300));
        jointDatabase.addEmpregado(new Empregado("Gisela", "Santos", 202, 4900));

        // Trying to remove an employee that doesn't exist and one that does
        jointDatabase.removeEmpregado(105);
        jointDatabase.removeEmpregado(201);

        System.out.println("\n- Checking if specific employees exist in the joint database:");
        System.out.println(jointDatabase.isEmpregado(202) ? "Employee 202 is in the joint database." : "Employee 202 is not in the joint database.");
        System.out.println(jointDatabase.isEmpregado(201) ? "Employee 201 is in the joint database." : "Employee 201 is not in the joint database.");

        System.out.println("\n- Joint Database Final Data:");
        jointDatabase.printAll();
    }
}
