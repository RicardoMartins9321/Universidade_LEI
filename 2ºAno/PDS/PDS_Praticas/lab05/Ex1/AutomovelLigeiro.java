package lab05.Ex1;

public class AutomovelLigeiro extends Veiculo  {
    
    private String numeroQuadro;
    private int capacidadeBagageira;



    public AutomovelLigeiro(String matricula, String marca, String modelo, int potencia, String numeroQuadro,
            int capacidadeBagageira) {
        super(matricula, marca, modelo, potencia);
        this.numeroQuadro = numeroQuadro;
        this.capacidadeBagageira = capacidadeBagageira;
    }

    public String getNumeroQuadro() {
        return numeroQuadro;
    }

    public void setNumeroQuadro(String numeroQuadro) {
        this.numeroQuadro = numeroQuadro;
    }

    public int getCapacidadeBagageira() {
        return capacidadeBagageira;
    }

    public void setCapacidadeBagageira(int capacidadeBagageira) {
        this.capacidadeBagageira = capacidadeBagageira;
    }

    @Override
    public String toString() {
        return "Automóvel Ligeiro" + "\n    Matrícula: " + this.getMatricula() + "\n    Marca: " + this.getMarca()
                + "\n    Modelo: " + this.getModelo();
    }
}

