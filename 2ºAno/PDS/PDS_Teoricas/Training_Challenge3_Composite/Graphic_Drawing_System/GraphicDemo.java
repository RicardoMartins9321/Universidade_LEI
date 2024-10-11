package Graphic_Drawing_System;

// Component
interface Graphic {
    void draw();
}

// Leaf
class Circle implements Graphic {
    public void draw() {
        System.out.println("Circle drawn.");
    }
}

// Leaf
class Rectangle implements Graphic {
    public void draw() {
        System.out.println("Rectangle drawn.");
    }
}

// Composite
class CompositeGraphic implements Graphic {
    private List<Graphic> childGraphics = new ArrayList<>();

    public void add(Graphic graphic) {
        childGraphics.add(graphic);
    }

    public void draw() {
        for (Graphic graphic : childGraphics) {
            graphic.draw();
        }
    }
}

// Client
public class GraphicDemo {
    public static void main(String[] args) {
        Circle circle = new Circle();
        Rectangle rectangle = new Rectangle();

        CompositeGraphic graphic = new CompositeGraphic();
        graphic.add(circle);
        graphic.add(rectangle);

        graphic.draw();
    }
}

