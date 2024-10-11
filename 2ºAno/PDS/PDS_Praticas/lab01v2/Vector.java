package lab01v2;


public class Vector extends Point {
    private Directions direction;
    private int range;

    public Vector(Directions direction, int range) {
        super(direction.getVector().getX() * range, direction.getVector().getY() * range);
        this.direction = direction;
        this.range = range;
    }

    public Vector(Directions direction, Point point,int range) {
        super(point.getX(), point.getY());
        this.direction = direction;
        this.range = range;
    }

    public Vector(Directions direction) {
        super(direction.getVector().getX(), direction.getVector().getY());
        this.direction = direction;
        this.range = 1;
    }

    public Vector(Vector vector) {
        super(vector.getX(), vector.getY());
        this.direction = vector.getDirection();
        this.range = vector.getRange();
    }

    public int getRange() {
        return range;
    }

    public Directions getDirection() {
        return direction;
    }

    public static boolean wordIn(Directions direction, Point point, String word, int size) {
        int length = word.length();
        Vector wordVector = new Vector(direction, length - 1);
        Point coordinates = SumPointVector(wordVector, point);
        return pointIn(coordinates, size);
    }

    public static boolean pointIn(Point point, int max) {
        return (0 <= point.getX() && point.getX() < max) && (0 <= point.getY() && point.getY() < max);

    }

    public static Point SumPointVector(Vector vector, Point point) {
        int x = point.getX() + vector.getX();
        int y = point.getY() + vector.getY();
        return new Point(x, y);
    }
 

    @Override
    public String toString() {
        
        return String.format("%-5d%-8s%-7s", range,(getX()+1)+","+(getY()+1),direction);
    }
}