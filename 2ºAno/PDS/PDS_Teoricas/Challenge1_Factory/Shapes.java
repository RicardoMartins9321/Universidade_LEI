public class Shapes {
    public static Forma createForma(String shape){
        if (shape.equals("Circle")) return new Circle(2, "black");
        else if (shape.equals("Rectangle")) return new Rectangle(4, 2, "black");
        else if (shape.equals("Triangle")) return new Triangle("black", 2, 2, 2);
        else return null;
    }
}