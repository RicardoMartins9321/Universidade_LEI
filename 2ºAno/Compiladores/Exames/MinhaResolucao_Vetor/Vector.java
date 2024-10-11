import java.util.ArrayList;

public class Vector {
    private ArrayList<Double> values = new ArrayList<>();
    private int dimension;
    private boolean scalar = false;
    private boolean error = false;

    public Vector(ArrayList<Double> val) {
        this.values = val;
        this.dimension = val.size();
    }

    public Vector(ArrayList<Double> val, boolean scalar) {
        this.values = val;
        this.scalar = scalar;
        this.dimension = val.size();
    }

    public Vector(String vec) {
        String vector = vec.substring(1, vec.length() - 1);
        String[] numbers = vector.split(",");

        try {
            for (String number : numbers) {
                values.add(Double.parseDouble(number.trim()));
            }
        } catch (NumberFormatException e) {
            this.error = true;
        }

        this.dimension = this.values.size();
    }

    public ArrayList<Double> values() {
        return this.values;
    }

    public int dimension() {
        return this.dimension;
    }

    public boolean scalar() {
        return this.scalar;
    }

    public boolean error() {
        return this.error;
    }

    public Vector symmetric() {
        ArrayList<Double> symmetricValues = new ArrayList<>();
        for (Double value : this.values) {
            symmetricValues.add(-value);
        }

        return new Vector(symmetricValues, this.scalar);
    }

    public Vector add(Vector v) {
        ArrayList<Double> newValues = new ArrayList<>();
        for (int i = 0; i < this.dimension; i++) {
            newValues.add(this.values.get(i) + v.values().get(i));
        }

        return new Vector(newValues, this.scalar);
    }

    public Vector subtract(Vector v) {
        ArrayList<Double> newValues = new ArrayList<>();
        for (int i = 0; i < this.dimension; i++) {
            newValues.add(this.values.get(i) - v.values().get(i));
        }

        return new Vector(newValues, this.scalar);
    }

    public Vector multiplication(Vector v) {
        ArrayList<Double> newValues = new ArrayList<>();
        if (this.scalar && !v.scalar) {
            for (Double value : v.values()) {
                newValues.add(this.values.get(0) * value);
            }
            return new Vector(newValues);
        } else if (!this.scalar && v.scalar) {
            for (Double value : this.values) {
                newValues.add(v.values().get(0) * value);
            }
            return new Vector(newValues);
        } else if (this.scalar && v.scalar) {
            newValues.add(this.values.get(0) * v.values().get(0));
            return new Vector(newValues, true);
        } else {
            double result = 0.0;
            for (int i = 0; i < this.dimension; i++) {
                result += this.values.get(i) * v.values().get(i);
            }
            newValues.add(result);
            return new Vector(newValues, true);
        }
    }

    @Override
    public String toString() {
        if (this.scalar) {
            return values.get(0).toString();
        } else {
            return values.toString();
        }
    }
}
