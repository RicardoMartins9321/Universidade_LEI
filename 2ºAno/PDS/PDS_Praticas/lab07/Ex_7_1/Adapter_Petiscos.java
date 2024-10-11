package Ex_7_1;

import java.util.List;

public class Adapter_Petiscos implements Adapter{
    // Registos
    private Registos registos;

    // Constructor
    public Adapter_Petiscos(Registos registos) {
        this.registos = registos;
    }

    @Override
    public void addEmpregado(Empregado empregado) {
        registos.insere(empregado);
    }

    @Override
    public void removeEmpregado(int codigo) {
        registos.remove(codigo);
    }

    @Override
    public boolean isEmpregado(int codigo) {
        return registos.isEmpregado(codigo);
    }

    @Override
    public void listaEmpregados() {
        List<Empregado> empregados = registos.listaDeEmpregados();

        for (int i = 0; i < empregados.size(); i++) {
            System.out.println(empregados.get(i));
        }
    }
}
