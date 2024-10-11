package lab05.Ex1;

public abstract class Veiculo  implements KmPercorridosInterface  {
    private String matricula;
    private String marca;
    private String modelo;
    private int potencia;
    private int distanciaPercorrida;
    private int ultimoTrajetoFeito;

    public Veiculo(String matricula, String marca, String modelo, int potencia) {
        this.matricula = matricula;
        this.marca = marca;
        this.modelo = modelo;
        this.potencia = potencia;
    }

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public int getPotencia() {
        return potencia;
    }

    public void setPotencia(int potencia) {
        this.potencia = potencia;
    }
    @Override
    public void trajeto(int quilometros) {
        distanciaPercorrida += quilometros;
        ultimoTrajetoFeito=quilometros;
        
    }

    @Override
    public int ultimoTrajeto() {
        return ultimoTrajetoFeito;
    }

    @Override
    public int distanciaTotal() {
        return this.distanciaPercorrida;
    }

    // getters e setters aqui
}