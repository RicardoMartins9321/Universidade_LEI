import java.util.Arrays;
import java.util.List;

public class StaticTextProductsReader implements ProductsReader {
    @Override
    public List<Product> getItems() {
        return Arrays.asList(
            new Car("ZA11ZB", "Tesla, Grey, 2021", 100),
            new Van("AA22BB", "Chevrolet Chevy, 2020", 180),
            new Motorcycle("ZA33ZB", "Touring, 750, 2022", 85),
            new Car("BB44ZB", "Ford Mustang, Red, 2021", 150)
        );
    }
}

