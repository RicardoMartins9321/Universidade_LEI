package Ex_7_1;

// Sweets
public class Employee {
    private String name;
    private long emp_num;
    private double salary;

    public Employee(String name, long emp_num, double salary) {
        this.name = name;
        this.emp_num = emp_num;
        this.salary = salary;
    }
    public String getName() {
        return name;
    }
    public long getEmpNum() {
        return emp_num;
    }
    public double getSalary() {
        return salary;
    }

    // Transforma o objeto em string
    public String toString() {
        return "Employee " + name + "(" + emp_num + ") " + salary + "€";
    }
}
