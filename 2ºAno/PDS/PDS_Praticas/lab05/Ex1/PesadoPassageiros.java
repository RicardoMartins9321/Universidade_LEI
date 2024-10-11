package lab05.Ex1;

public class PesadoPassageiros  extends Veiculo   {
    private String numeroQuadro;
    private int peso;
    private int numMaxPassageiros;


public PesadoPassageiros(String matricula, String marca, String modelo, int potencia, String numeroQuadro, int peso,
            int numMaxPassageiros) {
        super(matricula, marca, modelo, potencia);
        this.numeroQuadro = numeroQuadro;
        this.peso = peso;
        this.numMaxPassageiros = numMaxPassageiros;
    }


public String getNumeroQuadro() {
    return numeroQuadro;
}

public void setNumeroQuadro(String numeroQuadro) {
    this.numeroQuadro = numeroQuadro;
}

public int getPeso() {
    return peso;
}

public void setPeso(int peso) {
    this.peso = peso;
}

public int getNumMaxPassageiros() {
    return numMaxPassageiros;
}

public void setNumMaxPassageiros(int numMaxPassageiros) {
    this.numMaxPassageiros = numMaxPassageiros;
}

@Override
    public String toString() {
        return "Pesado de Passageiros" + "\n    Matrícula: " + this.getMatricula() + "\n    Marca: " + this.getMarca()
                + "\n    Modelo: " + this.getModelo();
    }
}