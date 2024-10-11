package Ex_12_3;

public class Livro {
    private String titulo;
    private String ISBN;
    private int ano;
    private String autor;
    private EstadoLivro estado;

    public Livro(String titulo, String ISBN, int ano, String autor) {
        this.titulo = titulo;
        this.ISBN = ISBN;
        this.ano = ano;
        this.autor = autor;
        this.estado = new Inventario();
    }

    public void setEstado(EstadoLivro estado) {
        this.estado = estado;
    }

    public void regista() {
        estado.regista(this);
    }

    public void requisita() {
        estado.requisita(this);
    }

    public void devolve() {
        estado.devolve(this);
    }

    public void reserva() {
        estado.reserva(this);
    }

    public void cancelaReserva() {
        estado.cancelaReserva(this);
    }

    @Override
    public String toString() {
        return String.format("%s %s [%s]", titulo, autor, estado.getClass().getSimpleName());
    }
}
