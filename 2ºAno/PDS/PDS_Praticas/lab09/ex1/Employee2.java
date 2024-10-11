public class Employee2 {
    private double salary;
	private Person person;

	public Employee2(Person person, double salary) {
		this.person = person;
		this.salary = salary;
	}

	public double getSalary() {
		return salary;
	}

	public void paySalary(double ammount) {
		BankAccount bank = person.getBankAccount();
		bank.deposit(ammount);
	}
}
