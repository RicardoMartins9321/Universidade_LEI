
public class Motorcycle implements Product{
    private String code;
    private String description;
    private double points;

    public Motorcycle(String code, String description, double points) {
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
        return "Motorcycle [code=" + code + ", description=" + description + ", points=" + points + "]";
    }
}
