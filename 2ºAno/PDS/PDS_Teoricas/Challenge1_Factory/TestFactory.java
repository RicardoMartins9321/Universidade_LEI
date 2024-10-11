public class TestFactory {
    public static void main(String[] args) {
        Forma circulo = Shapes.createForma("Circle");
        Forma retangulo = Shapes.createForma("Rectangle");
        Forma triangulo = Shapes.createForma("Triangle");

        System.out.println(circulo);
        System.out.println(retangulo);
        System.out.println(triangulo);
    }
}
