package Ex_12_3;

public class Emprestado implements EstadoLivro {
    @Override
    public void regista(Livro livro) {
        System.out.println("Operação não disponível.");
    }

    @Override
    public void requisita(Livro livro) {
        System.out.println("Operação não disponível.");
    }

    @Override
    public void devolve(Livro livro) {
        System.out.println("Livro devolvido.");
        livro.setEstado(new Disponivel());
    }

    @Override
    public void reserva(Livro livro) {
        System.out.println("Operação não disponível.");
    }

    @Override
    public void cancelaReserva(Livro livro) {
        System.out.println("Operação não disponível.");
    }
}


