import java.util.List;

public class SharkCompany {
	public static void main(String[] args) {
		Person[] persons = { new Person("Maria Silva"),
					new Person("Manuel Pereira"),
					new Person("Aurora Machado"),
					new Person("Augusto Lima") };

		Company shark = new Company();
		Company.user = User.COMPANY;


		shark.admitEmployee(persons[0], 1000);
		shark.admitEmployee(persons[1], 900);
		shark.admitEmployee(persons[2], 1200);
		shark.admitEmployee(persons[3], 1100);

		List<Employee> sharkEmps = shark.employees();

		for (Employee e : sharkEmps)
			System.out.println(e.getSalary());

		shark.paySalaries(1);

		// Verifica se as pessoas admitidas estão subscritas nos seguros e parques de estacionamento
		for (Person p : persons) {
			assert shark.getSocialSecurity().getSubscritos().contains(p);
			assert shark.getInsurance().getSubscritos().contains(p);
		}

		// atribuir valores
        shark.getParking().allow(sharkEmps.get(0));
        shark.getInsurance().regist(sharkEmps.get(1));
        shark.getSocialSecurity().regist(sharkEmps.get(2));

        // Verificar se os empregados estão subscritos
        for (int i = 0; i < persons.length; i++) {
            assert persons[i].equals(sharkEmps.get(i).getCard().getEmployee());
        }

        System.out.println("\nSalário médio: " + shark.averageSalary());
        for (int i = 0; i < persons.length; i++) {
            boolean parkingAllowed = shark.getParking().getSubscritos().contains(sharkEmps.get(i));
            System.out.println("Permitido: " + parkingAllowed + "\tSalário: " + sharkEmps.get(i).getSalary());
        }
	}
}