package lab01v2;

import java.util.ArrayList;

public class Point {
    // x is vetrical axis and y is horizontal axis
    private int x;
    private int y;

    public Point(int x, int y) {
        this.x = x;
        this.y = y;
    }

    public Point(Point point) {
        this.x = point.getX();
        this.y = point.getY();
    }

    public int getX() {
        return x;
    }

    public int getY() {
        return y;
    }

    public void AddDirecion(Directions direction) {
        x += direction.getVector().getX();
        y += direction.getVector().getY();
    }

    public static void removeExtraVector(ArrayList<Vector> pointsToRemove, Point pointMain) {
        for (Point pointToRemove : pointsToRemove) {
            if (pointMain.equals(pointToRemove)) {
                pointsToRemove.remove(pointToRemove);
                return;
            }
        }
    }

    @Override
    public String toString() {
        return "Point [x=" + x + ", y=" + y + "]";
    }

    @Override
    // Use for know if 2 point have same x and y
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        // if (getClass() != obj.getClass())
        // return false;
        Point other = (Point) obj;
        if (x != other.x)
            return false;
        if (y != other.y)
            return false;
        return true;
    }

}
