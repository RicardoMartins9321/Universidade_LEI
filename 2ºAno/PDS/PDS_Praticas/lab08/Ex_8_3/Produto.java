package Ex_8_3;

public abstract class Produto {
    private String nome;
    protected double peso;
    protected static StringBuffer indent = new StringBuffer();

    public Produto(String nome, double peso) {
        this.nome = nome;
        this.peso = peso;
    }

    public String getName() {
        return this.nome;
    }

    public double getWeight() {
        return this.peso;
    }

    public abstract void draw();
}
