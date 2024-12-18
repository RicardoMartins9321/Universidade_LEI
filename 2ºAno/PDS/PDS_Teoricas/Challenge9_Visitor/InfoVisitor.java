class InfoVisitor implements Visitor {
    @Override
    public void visit(Circle circle) {
        System.out.println("Circle with radius: " + circle.getRadius());
    }

    @Override
    public void visit(Rectangle rectangle) {
        System.out.println("Rectangle with length: " + rectangle.getLength() + " and width: " + rectangle.getWidth());
    }
}