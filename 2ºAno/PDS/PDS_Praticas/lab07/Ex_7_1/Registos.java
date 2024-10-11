package Ex_7_1;

import java.util.List;
import java.util.ArrayList;

// Petiscos
public class Registos {
    private ArrayList<Empregado> empregados;

    public Registos() {
        empregados = new ArrayList<>();
    }

    public void insere(Empregado emp) {
        if (!isEmpregado(emp.codigo())) {
            empregados.add(emp);
        }
    }

    public void remove(int codigo) {
        for (int i=0; i<empregados.size(); i++) {
            if (empregados.get(i).codigo() == codigo) {
                empregados.remove(i);
                break;
            }
        }
    }

    public boolean isEmpregado(int codigo) {
        for (Empregado emp : empregados) {
            if (emp.codigo() == codigo) {
                return true;
            }
        }
        return false;
    }

    public List<Empregado> listaDeEmpregados() {
        return new ArrayList<>(empregados);
    }

    @Override
    public String toString() {
        return "Registos " + empregados;
    }
}
