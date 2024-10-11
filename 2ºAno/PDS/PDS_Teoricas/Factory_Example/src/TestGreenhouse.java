// main to test Greenhouse
public class TestGreenhouse {
    public static void main(String[] args) {
        Tree tree1 = Greenhouse.createTree("Lemon");
        tree1.getFruit();
        Tree tree2 = Greenhouse.createTree("Orange");
        tree2.getFruit();
        Tree tree3 = Greenhouse.createTree("Apple");
        tree3.getFruit();
        Tree tree4 = Greenhouse.createTree("Pear");
        tree4.getFruit();
    }
}
