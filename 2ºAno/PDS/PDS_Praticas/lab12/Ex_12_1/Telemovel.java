public class Telemovel {
    private String processador;
    private double preco;
    private int memoria;
    private int camera;

    public Telemovel(String processador, double preco, int memoria, int camera) {
        this.processador = processador;
        this.preco = preco;
        this.memoria = memoria;
        this.camera = camera;
    }

    public String getProcessador() {
        return processador;
    }

    public double getPreco() {
        return preco;
    }

    public int getMemoria() {
        return memoria;
    }

    public int getCamera() {
        return camera;
    }

    private void setProcessador(String processador) {
        this.processador = processador;
    }

    private void setPreco(double preco) {
        this.preco = preco;
    }

    private void setMemoria(int memoria) {
        this.memoria = memoria;
    }

    private void setCamera(int camera) {
        this.camera = camera;
    }

    @Override
    public String toString() {
        return String.format("Telemovel [Processador=%s, Preço=%.2f, Memória=%d, Câmara=%d]",
                processador, preco, memoria, camera);
    }
}
