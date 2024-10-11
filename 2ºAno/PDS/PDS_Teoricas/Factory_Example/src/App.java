public class App {
    public static void main(String[] args){
        Figure circle = FigureFactory.createFigure("circle");
        circle.draw();

        Figure square = FigureFactory.createFigure("square");
        square.draw();

        Figure rectangle = FigureFactory.createFigure("rectangle");
        rectangle.draw();
    }
}

// Implementing a Factory class to create Figures
class FigureFactory {
    public static Figure createFigure(String type) {
        if (type.equals("circle")) {
            return new Circle();
        } else if (type.equals("square")) {
            return new Square();
        } else if (type.equals("rectangle")) {
            return new Rectangle();
        } else {
            return null;
        }
    }
}

// Implementing a Figure interface
interface Figure {
    void draw();
}

// Implementing a Circle class
class Circle implements Figure {
    @Override
    public void draw() {
        System.out.println("Drawing a Circle");
    }
}

// Implementing a Square class
class Square implements Figure {
    @Override
    public void draw() {
        System.out.println("Drawing a Square");
    }
}

// Implementing a Rectangle class
class Rectangle implements Figure {
    @Override
    public void draw() {
        System.out.println("Drawing a Rectangle");
    }
}
