package Ex_12_3;

public class Disponivel implements EstadoLivro {
    @Override
    public void regista(Livro livro) {
        System.out.println("Operação não disponível.");
    }

    @Override
    public void requisita(Livro livro) {
        System.out.println("Livro requisitado.");
        livro.setEstado(new Emprestado());
    }

    @Override
    public void devolve(Livro livro) {
        System.out.println("Operação não disponível.");
    }

    @Override
    public void reserva(Livro livro) {
        System.out.println("Livro reservado.");
        livro.setEstado(new Reservado());
    }

    @Override
    public void cancelaReserva(Livro livro) {
        System.out.println("Operação não disponível.");
    }
}
