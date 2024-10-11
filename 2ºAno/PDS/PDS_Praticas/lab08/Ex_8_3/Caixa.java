package Ex_8_3;

import java.util.ArrayList;

public class Caixa extends Produto {
    private ArrayList<Produto> produtos = new ArrayList<>();

    public Caixa(String nome, double peso) {
        super(nome, peso);
    }

    // Calculate the total weight of the box including all nested items
    public double calculateTotalWeight() {
        double totalWeight = this.getWeight(); // Start with the weight of the box itself
        for (Produto p : produtos) {
            totalWeight += p instanceof Caixa ? ((Caixa) p).calculateTotalWeight() : p.getWeight();
        }
        return totalWeight;
    }

    // Add a product to the box
    public void add(Produto produto) {
        produtos.add(produto);
    }

    @Override
    public void draw() {
        StringBuffer localIndent = new StringBuffer(indent); // Create a local copy of the indent
        System.out.println(localIndent + "* Caixa '" + this.getName() + "' [ Weight: " + this.getWeight() + "; Total: " + calculateTotalWeight() + "]");
        localIndent.append("   "); // Increase the indent for nested products
        for (Produto produto : produtos) {
            produto.indent = new StringBuffer(localIndent); // Pass the updated indent to each product
            produto.draw();
        }
        indent.setLength(indent.length() > 0 ? indent.length() - 3 : 0); // Safely reduce the indent length
    }
}
