package Ex_7_1;

public class DataConnecter {
    //Dados
    private Adapter registos;
    private Adapter database;

    public DataConnecter(Adapter registos, Adapter database) {
        this.registos = registos;
        this.database = database;
    }

    public void addEmpregado(Empregado empregado) {
        // Verifica se o empregado já existe
        if (registos.isEmpregado(empregado.codigo()) || database.isEmpregado(empregado.codigo())) {
            System.out.println("codigo:" + empregado.codigo() + " já existe");
        } else {
            // Adiciona o empregado aleatoriamente ao registos ou à database
            if (Math.random() < 0.5) {
                registos.addEmpregado(empregado);
            } else {
                database.addEmpregado(empregado);
            }
        }
    }

    public void removeEmpregado(int codigo) {
        // Verifica se o empregado existe
        if (isEmpregado(codigo)) {
            // Verifica se o empregado está no registos ou na database
            if (registos.isEmpregado(codigo)) {
                registos.removeEmpregado(codigo);
            } else {
                database.removeEmpregado(codigo);
            }
        } else {
            System.out.println("codigo:" + codigo + " não existe");
        }
    }

    public void printAll() {
        registos.listaEmpregados();
        database.listaEmpregados();
    }

    public boolean isEmpregado(int codigo) {
        return registos.isEmpregado(codigo) || database.isEmpregado(codigo);
    }
}
