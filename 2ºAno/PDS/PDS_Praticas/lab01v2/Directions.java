package lab01v2;


public enum Directions {
    Right(new Point(0, 1)),
    DownRight(new Point(1, 1)),
    Down(new Point(1, 0)),
    DownLeft(new Point(1, -1)),
    Left(new Point(0, -1)),
    UpLeft(new Point(-1, -1)),
    Up(new Point(-1, 0)),
    UpRight(new Point(-1, 1));

    private final Point point;

    Directions(Point point) {
        this.point = point;
    }

    public Point getVector() {
        return point;
    }

    
}
