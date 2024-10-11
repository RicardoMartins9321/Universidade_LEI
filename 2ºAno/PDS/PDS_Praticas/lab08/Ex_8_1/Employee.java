package Ex_8_1;

import java.util.Date;

public class Employee implements EmployeeInterface {
    private String name;
    private Date startDate;
    private Date endDate;

    public Employee(String name) {
        this.name = name;
    }

    public String getName() {
        return this.name;
    }

    @Override
    public void start(Date date) {
        this.startDate = date;
        System.out.println(this.name + " starts on " + this.startDate.toString());
    }

    @Override
    public void terminate(Date date) {
        this.endDate = date;
        System.out.println(this.name + " terminates on " + this.endDate.toString());
    }

    @Override
    public void work() {
        System.out.println(this.name + " is working");
    }

}
