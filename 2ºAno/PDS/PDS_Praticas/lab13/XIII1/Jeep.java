public class Jeep implements Product {
    private OldJeep oldJeep;

    public Jeep(OldJeep oldJeep) {
        this.oldJeep = oldJeep;
    }

    @Override
    public String code() {
        return oldJeep.getData().split(";")[0];
    }

    @Override
    public String description() {
        return oldJeep.getData().split(";")[1];
    }

    @Override
    public double points() {
        return Double.parseDouble(oldJeep.getData().split(";")[2]);
    }

    @Override
    public String toString() {
        return "Jeep [code=" + code() + ", description=" + description() + ", points=" + points() + "]";
    }
}
