package Ex_7_1;

public class Adapter_Sweets implements Adapter{
    private Database database;

    // Constructor
    public Adapter_Sweets(Database database) {
        this.database = database;
    }

    @Override
    // Adiciona um empregado ao database de empregados através de um empregado
    public void addEmpregado(Empregado empregado) {
        Employee emp = new Employee(empregado.nome() + " " + empregado.apelido(), (long) empregado.codigo(), empregado.salario());

        database.addEmployee(emp);
    }

    @Override
    public void removeEmpregado(int codigo) {
        database.deleteEmployee(codigo);
    }

    @Override
    public boolean isEmpregado(int codigo) {
        return database.isEmployee(codigo);
    }

    @Override
    public void listaEmpregados() {
        Employee[] employees = database.getAllEmployees();

        for (int i = 0; i < employees.length; i++) {
            System.out.println(employees[i]);
        }
    }
}
