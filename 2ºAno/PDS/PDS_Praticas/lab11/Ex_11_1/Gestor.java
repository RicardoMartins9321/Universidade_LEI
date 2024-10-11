package Ex_11_1;

import java.util.ArrayList;

public class Gestor extends Observer {
    protected ArrayList<Produto> produtosEstoque;
    protected ArrayList<Produto> produtosVendidos;

    public Gestor(String nome) {
        this.nome = nome;
        this.produtosLeilao = new ArrayList<>();
        this.produtosEstoque = new ArrayList<>();
        this.produtosVendidos = new ArrayList<>();
    }

    public void registrarProduto(Produto produto) {
        if (produto.obterEstado() == Estado.LEILAO) {
            this.produtosLeilao.add(produto);
        } else if (produto.obterEstado() == Estado.STOCK) {
            this.produtosEstoque.add(produto);
        } else if (produto.obterEstado() == Estado.VENDAS) {
            this.produtosVendidos.add(produto);
        }

        produto.adicionarObservador(this);
    }

    @Override
    public void update(Produto produto, boolean novaOferta) {
        if (novaOferta) {
            System.out.printf("Notificação para o gestor %s --> Produto %s tem uma nova oferta --> %.2f\n", this.nome, produto.toString(), produto.obterPreco());
        } else {
            if (produto.obterEstado() == Estado.LEILAO) {
                this.produtosLeilao.add(produto);
                this.produtosEstoque.remove(produto);
            } else if (produto.obterEstado() == Estado.STOCK) {
                this.produtosEstoque.add(produto);
                this.produtosLeilao.remove(produto);
            } else if (produto.obterEstado() == Estado.VENDAS) {
                this.produtosVendidos.add(produto);
                this.produtosLeilao.remove(produto);
                System.out.printf("Notificação para o gestor %s --> Produto %s foi vendido --> %.2f\n", this.nome, produto.toString(), produto.obterPreco());
            }
        }
    }
}
