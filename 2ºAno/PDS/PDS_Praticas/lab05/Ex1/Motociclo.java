package lab05.Ex1;

public class Motociclo extends Veiculo  {

    private String tipo;
    public String getTipo() {
        return tipo;
    }
    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public Motociclo(String matricula, String marca, String modelo, int potencia, String tipo) {
        super(matricula, marca, modelo, potencia);
        this.tipo = tipo;
    }

    @Override
    public String toString() {
        return "Motociclo" + "\n    Matrícula: " + this.getMatricula() + "\n    Marca: " + this.getMarca()
                + "\n    Modelo: " + this.getModelo();
    }
}
