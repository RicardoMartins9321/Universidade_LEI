import java.util.ArrayList;

public class SocialSecurity {
    private ArrayList<Employee> subscritos;

    public SocialSecurity() {
        this.subscritos = new ArrayList<>();
    }

    public ArrayList<Employee> getSubscritos() {
        return this.subscritos;
    }

    public void regist(Employee employee) {
        this.subscritos.add(employee);
    }
}