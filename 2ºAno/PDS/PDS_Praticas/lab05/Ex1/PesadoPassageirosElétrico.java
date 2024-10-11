package lab05.Ex1;

public class PesadoPassageirosElétrico extends PesadoPassageiros implements VeiculoEletrico {
    private int energia=0;
    private int energiaMaxima=0;


    public PesadoPassageirosElétrico(String matricula, String marca, String modelo, int potencia, String numeroQuadro,
            int peso, int numMaxPassageiros,int energia,int energiaMaxima) {
        super(matricula, marca, modelo, potencia, numeroQuadro, peso, numMaxPassageiros);
        this.energia = energia;
        this.energiaMaxima = energiaMaxima; 
    }

    @Override
    public int autonomia() {
        return energia;
    }

    @Override
    public void carregar(int percentagem) {
        energia+=percentagem*energiaMaxima/100;
        if (energia>energiaMaxima) {
            energia=energiaMaxima;
            
        }   
    }
    @Override
    public String toString() {
        return "Pesado de Passageiros Elétrico" + "\n    Matrícula: " + this.getMatricula() + "\n    Marca: " + this.getMarca()
                + "\n    Modelo: " + this.getModelo();
    }
}
