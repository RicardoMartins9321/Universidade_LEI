public abstract class Forma{
    public double perimeter;
    private double area;
    private String color;

    public Forma(String color){
        if (colorValidation(color)){
            this.color = color;
        }
        else{
            color = null;
        }
    }

    public String getColor(){
        return color;
    }

    public double getPerimeter(){
        return perimeter;
    }

    public void setPerimeter(double perimeter){
        this.perimeter = perimeter;
    }

    public double getArea(){
        return area;
    }

    public void setArea(double area){
        this.area = area;
    }

    public boolean validation(int n){
        if (n > 0){
            return true;
        }
        return false;
    }

    public boolean colorValidation(String color){
        String[] colors = {"red", "blue", "cyan", "yellow", "green", "brown", "grey", "black", "white", "purple", "orange", "pink", "violet", "magenta"};
        for (String s : colors){
            if (color.equals(s)){
                return true;
            }
        }
        return false;
    }
}
