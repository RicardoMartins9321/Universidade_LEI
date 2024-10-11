import java.util.ArrayList;

public class Parking {
    private ArrayList<Employee> subscritos;

    public Parking() {
        this.subscritos = new ArrayList<>();
    }

    public ArrayList<Employee> getSubscritos() {
        return this.subscritos;
    }

    public void allow(Employee employee) {
        this.subscritos.add(employee);
    }
}