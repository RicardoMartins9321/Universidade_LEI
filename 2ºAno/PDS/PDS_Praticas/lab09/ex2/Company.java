import java.util.List;
import java.util.ArrayList;
import java.util.Collections;

class Company {

	public static User user;
	private List<Employee> emps = new ArrayList<>();
	private SocialSecurity socialSecurity = new SocialSecurity();
	private Insurance insurance = new Insurance();
	private Parking parking = new Parking();

	public void admitEmployee(Person person, double salary) {
		Employee e = new Employee(person, salary);
		emps.add(e);
		socialSecurity.regist(e);
		insurance.regist(e);
		EmployeeCard c = new EmployeeCard(e);
		e.setCard(c);
		if (salary > this.averageSalary()) {
			parking.allow(e);
		}
	}

	//getters
	public SocialSecurity getSocialSecurity() {
		return socialSecurity;
	}

	public Insurance getInsurance() {
		return insurance;
	}

	public Parking getParking() {
		return parking;
	}

	public void paySalaries(int month) {
		for (Employee e : emps) {
			e.paySalary(e.getSalary());
		}
	}

	public List<Employee> employees() {
		return Collections.unmodifiableList(emps);
	}

	public double averageSalary() {
		double sum = 0;
		for (Employee e : emps) {
			sum += e.getSalary();
		}
		return sum / emps.size();
	}
}