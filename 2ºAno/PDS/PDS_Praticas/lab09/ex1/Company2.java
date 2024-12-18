import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

class Company2 {

	public static User user;
	private List<Employee2> emps = new ArrayList<>();

	public void admitEmployee(Person person, double salary) {
		Employee2 e = new Employee2(person, salary);
		emps.add(e);
	}

	public void paySalaries(int month) {
		for (Employee2 e : emps) {
			e.paySalary(e.getSalary());
		}
	}

	public List<Employee2> employees() {
		return Collections.unmodifiableList(emps);
	}
}
