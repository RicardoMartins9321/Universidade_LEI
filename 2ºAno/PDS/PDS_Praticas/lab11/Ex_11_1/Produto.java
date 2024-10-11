package Ex_11_1;


import java.util.ArrayList;
import java.util.List;

public class Produto {
    private List<Observer> observadores = new ArrayList<>();
    private static int contadorId = 0;
    private int id;
    private String descricao;
    private double precoBase;
    private double precoAtual;
    private Estado estadoAtual;
    private long inicioLeilao;
    private long duracaoLeilao;

    public Produto(String descricao, double precoBase) {
        this.id = ++contadorId;
        this.descricao = descricao;
        this.precoBase = precoBase;
        this.precoAtual = precoBase;
        this.estadoAtual = Estado.STOCK;
    }

    public void adicionarObservador(Observer observer) {
        observadores.add(observer);
    }

    public void definirEstado(Estado estado) {
        this.estadoAtual = estado;
        if (this.estadoAtual == Estado.LEILAO) {
            this.inicioLeilao = System.currentTimeMillis();
        } else {
            if (this.estadoAtual == Estado.STOCK) {
                this.precoAtual = this.precoBase;
            }
        }
        notificarObservadores(false);
    }

    public void definirEstado(Estado estado, long duracaoLeilao) {
        this.duracaoLeilao = duracaoLeilao;
        definirEstado(estado);
    }

    public Estado obterEstado() {
        return this.estadoAtual;
    }

    public void definirPreco(double preco) {
        this.precoAtual = preco;
        notificarObservadores(true);
    }

    public double obterPreco() {
        return this.precoAtual;
    }

    private void notificarObservadores(boolean novaOferta) {
        for (Observer observer : observadores) {
            observer.update(this, novaOferta);
        }
    }

    public void verificarLeilao() {
        if (this.estadoAtual == Estado.LEILAO && (System.currentTimeMillis() - inicioLeilao) > duracaoLeilao) {
            if (this.precoAtual == this.precoBase) {
                definirEstado(Estado.STOCK);
                System.out.printf("Leilão finalizado. Produto %d não teve ofertas e voltou ao estoque.\n", this.id);
            } else {
                definirEstado(Estado.VENDAS);
                System.out.printf("Leilão finalizado. Produto %d foi vendido por %.2f.\n", this.id, this.precoAtual);
            }
        }
    }

    @Override
    public String toString() {
        return String.format("Produto %d: %s, %.2f", this.id, this.descricao, this.precoAtual);
    }
}
