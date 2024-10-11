package Challenge3_Composite_112876;

import java.util.ArrayList;
import java.util.List;

// Component
interface Employee {
    void Details();
}

// Leaf
public class Individual implements Employee {
    private String name;
    private String position;

    public Individual(String name, long position) {
        this.name = name;
        this.position = position;
    }

    @Override
    public void showDetails() {
        System.out.println("Employee position: " + position + ", Name: " + name);
    }
}

// Composite
public class Department implements Employee {
    private List<Employee> children = new ArrayList<>();
    private String name;

    public Department(String name) {
        this.name = name;
    }

    public void addEmployee(Employee employee) {
        children.add(employee);
    }

    public void removeEmployee(Employee employee) {
        children.remove(employee);
    }

    public List<Employee> getChildren() {
        return new ArrayList<>(children); // Return a copy to preserve encapsulation
    }

    @Override
    public void showDetails() {
        System.out.println("Department: " + name);
        for (Employee emp : children) {
            emp.showDetails();
        }
    }
}


// Client
public class Organization {
    public static void main(String[] args) {
        Employee emp1 = new Individual("John Doe", "Manager");
        Employee emp2 = new Individual("Jane Smith", "Sales Associate");

        Department sales = new Department("Sales");
        sales.addEmployee(emp1);
        sales.addEmployee(emp2);

        Department it = new Department("IT");
        Employee emp3 = new Individual("Mike Johnson", "Software Engineer");
        it.addEmployee(emp3);

        Department company = new Department("Company");
        company.addEmployee(sales);
        company.addEmployee(it);

        company.showDetails(); // This will print details of all departments and employees
    }
}
