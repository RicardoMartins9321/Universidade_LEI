import java.lang.Math;

public class Circle extends Forma {
    int raio;

    public Circle(int raio, String color){
        super(color);
        if (validation(raio)){
            this.raio = raio;
            super.setPerimeter(Perimeter());
            super.setArea(Area());
        }
    }

    public String toString(){
        return "";
    }

    public boolean equals(int r, String cor){
        if (raio == r && getColor().equals(cor)){
            return true;
        }
        return false;
    }

    public int getRaio(){
        return raio;
    }

    public double Area(){
        return raio * raio * Math.PI;
    }

    public double Perimeter(){
        return 2 * raio * Math.PI;
    }
}
