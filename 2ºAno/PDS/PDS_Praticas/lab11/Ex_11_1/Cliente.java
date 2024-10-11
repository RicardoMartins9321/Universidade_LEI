package Ex_11_1;

import java.util.ArrayList;

public class Cliente extends Observer {

    public Cliente(String nome) {
        this.nome = nome;
        this.produtosLeilao = new ArrayList<>();
    }

    public void bid(Produto produto, double valorOferta) {
        if (!this.produtosLeilao.contains(produto)) {
            if (produto.obterEstado() == Estado.LEILAO) {
                produto.adicionarObservador(this);
                this.produtosLeilao.add(produto);
            } else {
                System.out.println("Este produto não está em leilão no momento!");
                return;
            }
        }

        if (produto.obterPreco() > valorOferta) {
            System.out.println("Oferta insuficiente! Deve ser pelo menos " + produto.obterPreco());
            return;
        }
        produto.definirPreco(valorOferta);
    }

    @Override
    public void update(Produto produto, boolean novaOferta) {
        if (novaOferta) {
            System.out.printf("Notificação para o cliente %s --> Produto %s tem uma nova oferta --> %.2f\n", this.nome, produto.toString(), produto.obterPreco());
        } else {
            if (produto.obterEstado() == Estado.VENDAS) {
                System.out.printf("Notificação para o cliente %s --> Produto %s foi vendido --> %.2f\n", this.nome, produto.toString(), produto.obterPreco());
            } else if (produto.obterEstado() == Estado.STOCK) {
                System.out.printf("Notificação para o cliente %s --> Produto %s não está mais em leilão\n", this.nome, produto.toString());
            }
        }
    }
}

