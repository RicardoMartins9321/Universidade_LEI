package lab05.Ex1;

public class VehicleFactory {

    public static Veiculo createMotociclo(String matricula, String marca, String modelo, int potencia, String tipo) {
        
        return new Motociclo(matricula, marca, modelo, potencia, tipo);
    }

    public static Veiculo createAutomovelLigeiro(String matricula, String marca, String modelo, int potencia, String numeroQuadro,
    int capacidadeBagageira) {
        
        return new AutomovelLigeiro(matricula, marca, modelo, potencia, numeroQuadro, capacidadeBagageira);
    }

    public static Veiculo createTaxi(String matricula, String marca, String modelo, int potencia, String numeroQuadro,int capacidadeBagageira, String numeroLicenca) {
        
        return new Taxi(matricula, marca, modelo, potencia, numeroQuadro, capacidadeBagageira, numeroLicenca);
    }

    public static Veiculo createPPEletrico(String matricula, String marca, String modelo, int potencia, int peso, String numeroQuadro,
    int numMaxPassageiros,int energia,int energiaMaxima) {
        
        return new PesadoPassageirosElétrico(matricula, marca, modelo, potencia, numeroQuadro, peso, numMaxPassageiros,energia,energiaMaxima);
    }

    public static Veiculo createALEletrico(String matricula, String marca, String modelo, int potencia, String numeroQuadro,
    int capacidadeBagageira,int energia,int energiaMaxima) {
        
        return new AutomóvelLigeiroElétrico(matricula, marca, modelo, potencia, numeroQuadro, capacidadeBagageira,energia,energiaMaxima);
    }

    public static Veiculo createPesadoMercadorias(String matricula, String marca, String modelo, int potencia, String numeroQuadro, int peso,
    int cargaMaxima) {
        
        return new PesadoMercadorias(matricula, marca, modelo, potencia, numeroQuadro, peso, cargaMaxima);
    }

    public static Veiculo createPesadoPassageiros(String matricula, String marca, String modelo, int potencia, int peso, String numeroQuadro,
    int numMaxPassageiros) {
        
        return new PesadoPassageiros(matricula, marca, modelo, potencia, numeroQuadro, peso, numMaxPassageiros);
    }

}
