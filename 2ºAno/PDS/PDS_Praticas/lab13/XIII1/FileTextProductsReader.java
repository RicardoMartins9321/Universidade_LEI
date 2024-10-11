import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class FileTextProductsReader implements ProductsReader {
    private String filePath;

    public FileTextProductsReader(String filePath) {
        this.filePath = filePath;
    }

    @Override
    public List<Product> getItems() {
        List<Product> products = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split("\t");
                if (parts.length == 4) {
                    String type = parts[0];
                    String code = parts[1];
                    String description = parts[2];
                    double points = Double.parseDouble(parts[3]);
                    switch (type) {
                        case "Car":
                            products.add(new Car(code, description, points));
                            break;
                        case "Van":
                            products.add(new Van(code, description, points));
                            break;
                        case "Motorcycle":
                            products.add(new Motorcycle(code, description, points));
                            break;
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return products;
    }
}
