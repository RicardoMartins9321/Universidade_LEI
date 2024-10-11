import java.util.ArrayList;

public class Insurance {
    private ArrayList<Employee> subscritos;

    public Insurance() {
        this.subscritos = new ArrayList<>();
    }

    public ArrayList<Employee> getSubscritos() {
        return this.subscritos;
    }

    public void regist(Employee employee) {
        this.subscritos.add(employee);
    }
}