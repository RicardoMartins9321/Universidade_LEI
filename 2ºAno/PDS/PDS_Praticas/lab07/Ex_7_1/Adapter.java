package Ex_7_1;

public interface Adapter {
    public void addEmpregado (Empregado empregado);
    public void removeEmpregado(int codigo);
    public boolean isEmpregado (int codigo);
    public void listaEmpregados();
}
