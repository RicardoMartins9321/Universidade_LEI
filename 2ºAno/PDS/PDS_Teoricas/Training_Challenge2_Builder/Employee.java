public class Employee {
    private final String firstName;
    private final String lastName;
    private final String department;

    private Employee(Builder builder) {
        this.firstName = builder.firstName;
        this.lastName = builder.lastName;
        this.department = builder.department;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getDepartment() {
        return department;
    }

    public static class Builder {
        private String firstName;
        private String lastName;
        private String department;

        public Builder setFirstName(String firstName) {
            this.firstName = firstName;
            return this;
        }

        public Builder setLastName(String lastName) {
            this.lastName = lastName;
            return this;
        }

        public Builder setDepartment(String department) {
            this.department = department;
            return this;
        }

        public Employee build() {
            return new Employee(this);
        }
    }
}

// Usage:
public class Main {
    public static void main(String[] args) {
        Employee employee = new Employee.Builder()
                .setFirstName("John")
                .setLastName("Doe")
                .setDepartment("Engineering")
                .build();

        System.out.println("First Name: " + employee.getFirstName());
        System.out.println("Last Name: " + employee.getLastName());
        System.out.println("Department: " + employee.getDepartment());
    }
}