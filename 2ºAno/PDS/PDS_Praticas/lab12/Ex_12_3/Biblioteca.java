package Ex_12_3;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Biblioteca {
    private List<Livro> livros = new ArrayList<>();

    public void adicionarLivro(Livro livro) {
        livros.add(livro);
    }

    public void exibirLivros() {
        System.out.println("*** Biblioteca ***");
        for (int i = 0; i < livros.size(); i++) {
            System.out.printf("%d  %s\n", i + 1, livros.get(i));
        }
    }

    public void interagir() {
        Scanner scanner = new Scanner(System.in);
        while (true) {
            exibirLivros();
            System.out.println(">> <livro>, <operação: (1)regista; (2)requisita; (3)devolve; (4)reserva; (5)cancela>");
            String input = scanner.nextLine();
            if (input.equalsIgnoreCase("exit")) break;

            String[] parts = input.split(",");
            if (parts.length != 2) {
                System.out.println("Input inválido. Por favor, use o formato: <livro>, <operação>");
                continue;
            }

            try {
                int livroIndex = Integer.parseInt(parts[0].trim()) - 1;
                int operacao = Integer.parseInt(parts[1].trim());

                if (livroIndex < 0 || livroIndex >= livros.size()) {
                    System.out.println("Número do livro inválido.");
                    continue;
                }

                Livro livro = livros.get(livroIndex);
                switch (operacao) {
                    case 1:
                        livro.regista();
                        break;
                    case 2:
                        livro.requisita();
                        break;
                    case 3:
                        livro.devolve();
                        break;
                    case 4:
                        livro.reserva();
                        break;
                    case 5:
                        livro.cancelaReserva();
                        break;
                    default:
                        System.out.println("Operação não disponível.");
                }
            } catch (NumberFormatException e) {
                System.out.println("Formato de número inválido. Por favor, use inteiros.");
            }
        }
        scanner.close();
    }

    public static void main(String[] args) {
        Biblioteca biblioteca = new Biblioteca();
        biblioteca.adicionarLivro(new Livro("Clean Code", "0123456789", 2004, "Robert Martin"));
        biblioteca.adicionarLivro(new Livro("The Pragmatic Programmer", "9876543210", 2010, "Andy Hunt"));
        biblioteca.adicionarLivro(new Livro("Python Crash Course", "1112223334", 2019, "Eric Matthes"));

        biblioteca.interagir();
    }
}



