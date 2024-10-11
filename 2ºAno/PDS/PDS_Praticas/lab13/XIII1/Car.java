
public class Car implements Product{
    private String code;
    private String description;
    private double points;

    public Car(String code, String description, double points) {
        this.code = code;
        this.description = description;
        this.points = points;
    }

    public String code() {
        return code;
    }

    public String description() {
        return description;
    }

    public double points() {
        return points;
    }

    @Override
    public String toString() {
        return "Car [code=" + code + ", description=" + description + ", points=" + points + "]";
    }
}
