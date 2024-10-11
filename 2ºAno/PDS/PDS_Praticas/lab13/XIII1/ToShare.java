
import java.util.*;

public class ToShare implements Iterable<Product> {
    private List<Product> products = new ArrayList<>();
    private Map<String, Client> sharedProducts = new HashMap<>();

    public boolean add(Product p) {
        return products.add(p);
    }

    public Product remove(String code) {
        Product p = findProductByCode(code);
        if (p != null) {
            products.remove(p);
            sharedProducts.remove(code);
        }
        return p;
    }

    public Product remove(Product p) {
        if (products.remove(p)) {
            sharedProducts.remove(p.code());
            return p;
        }
        return null;
    }

    public boolean share(String code, Client user) {
        Product p = findProductByCode(code);
        if (p != null && !sharedProducts.containsKey(code)) {
            sharedProducts.put(code, user);
            return true;
        }
        return false;
    }

    public boolean share(Product p, Client user) {
        return share(p.code(), user);
    }

    public boolean giveBack(String code) {
        return sharedProducts.remove(code) != null;
    }

    public boolean giveBack(Product p) {
        return giveBack(p.code());
    }

    public List<Product> getProducts() {
        return products;
    }

    public String sharedProducts() {
        StringBuilder sb = new StringBuilder();
        sb.append("Total : ").append(sharedProducts.size()).append("\n");
        for (Map.Entry<String, Client> entry : sharedProducts.entrySet()) {
            Product p = findProductByCode(entry.getKey());
            sb.append(p.getClass().getSimpleName()).append(" ").append(entry.getKey())
              .append(" shared with ").append(entry.getValue()).append("\n");
        }
        return sb.toString();
    }

    public String allAlugados() {
        StringBuilder sb = new StringBuilder();
        sb.append("Total : ").append(products.size()).append("\n");
        for (Product p : products) {
            sb.append(p.getClass().getSimpleName()).append(" [code=").append(p.code())
              .append(", descr=").append(p.description())
              .append(", points=").append(p.points()).append("]\n");
        }
        return sb.toString();
    }

    public void loadProducts(ProductsReader reader) {
        products.addAll(reader.getItems());
    }

    private Product findProductByCode(String code) {
        for (Product p : products) {
            if (p.code().equals(code)) {
                return p;
            }
        }
        return null;
    }

    @Override
    public Iterator<Product> iterator() {
        return products.iterator();
    }

    public String totalSharedProducts() {
        return "Total : " + sharedProducts.size();
    }
}

