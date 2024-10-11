package lab05.Ex1;

import java.util.ArrayList;
import java.util.List;

public class Rental {
    private String name;
    private String phoneNumber;
    private String email;
    private List<Veiculo> stock;

    public Rental(String name, String phoneNumber, String email) {
        this.name = name;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.stock = new ArrayList<>();
    }

    public void addVeiculo(Veiculo veiculo) {
        stock.add(veiculo);
    }

    public List<Veiculo> getStock() {
        return stock;
    }
}
