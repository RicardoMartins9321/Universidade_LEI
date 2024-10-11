package Company_Hierarchy;

// Component
interface CompanyComponent {
    void displayDetails();
}

// Leaf
class Employee implements CompanyComponent {
    private String name;
    private String position;

    public Employee(String name, String position) {
        this.name = name;
        this.position = position;
    }

    public void displayDetails() {
        System.out.println(name + " works as " + position);
    }
}

// Composite
class Department implements CompanyComponent {
    private List<CompanyComponent> members = new ArrayList<>();
    private String name;

    public Department(String name) {
        this.name = name;
    }

    public void add(CompanyComponent component) {
        members.add(component);
    }

    public void displayDetails() {
        System.out.println("Department: " + name);
        for (CompanyComponent component : members) {
            component.displayDetails();
        }
    }
}

// Client
public class CompanyDemo {
    public static void main(String[] args) {
        Department sales = new Department("Sales");
        Department it = new Department("IT");

        Employee salesManager = new Employee("Alice", "Sales Manager");
        Employee itManager = new Employee("Bob", "IT Manager");

        sales.add(salesManager);
        it.add(itManager);

        Department company = new Department("Company");
        company.add(sales);
        company.add(it);

        company.displayDetails();
    }
}

