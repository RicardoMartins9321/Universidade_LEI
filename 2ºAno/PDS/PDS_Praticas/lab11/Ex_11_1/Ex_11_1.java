package Ex_11_1;

import java.lang.Thread;

public class Ex_11_1 {
    public static void main(String[] args) {
        Produto p1 = new Produto("telemovel", 500.0);
        Produto p2 = new Produto("Carro BMW", 30000.0);
        Produto p3 = new Produto("Bola", 10.0);
        Produto p4 = new Produto("Cavalo", 3500.0);
        Produto p5 = new Produto("mota", 1500.0);

        Cliente c1 = new Cliente("Ricardo");
        Cliente c2 = new Cliente("Rodrigo");
        Cliente c3 = new Cliente("João");

        Gestor mg = new Gestor("Departamento de Vendas");
        mg.registrarProduto(p1);
        mg.registrarProduto(p2);
        mg.registrarProduto(p3);
        mg.registrarProduto(p4);
        mg.registrarProduto(p5);

        System.out.println("Caso 1: Produtos em leilão, clientes vão dando lances");
        p1.definirEstado(Estado.LEILAO, 5000); // 5 segundos de leilão
        p3.definirEstado(Estado.LEILAO, 5000);

        c1.bid(p1, 500.4);
        c1.bid(p3, 20);
        c2.bid(p1, 520.6);
        c1.bid(p1, 600);
        c3.bid(p4, 4242.42);

        try {
            // Simular espera para verificar estado do leilão
            Thread.sleep(6000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        p1.verificarLeilao();
        p3.verificarLeilao();

        System.out.println("\nCaso 2: Produtos não recebem lances e voltam ao estoque");
        p2.definirEstado(Estado.LEILAO, 5000);
        p5.definirEstado(Estado.LEILAO, 5000);

        try {
            Thread.sleep(6000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        p2.verificarLeilao();
        p5.verificarLeilao();

        System.out.println("\nCaso 3: Produto vendido após receber um lance");
        p4.definirEstado(Estado.LEILAO, 5000);
        c3.bid(p4, 5000);

        try {
            Thread.sleep(6000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        p4.verificarLeilao();
    }
}
