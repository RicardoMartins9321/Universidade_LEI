import java.lang.Math;

public class Triangle extends Forma {
    int lado1, lado2, lado3;

    public Triangle(String color, int lado1, int lado2, int lado3){
        super(color);
        if (validation(lado1) && validation(lado2) && validation(lado3)){
            this.lado1 = lado1;
            this.lado2 = lado2;
            this.lado3 = lado3;
            super.setPerimeter(Perimeter());
            super.setArea(Area());
        }
    }

    public String toString(){
        return "";
    }

    public boolean equals(int l1, int l2, int l3, String cor){
        if (lado1 == l1 && lado2 == l2 && lado3 == l3 && getColor().equals(cor)){
            return true;
        }
        return false;
    }

    public int getLado1(){
        return lado1;
    }

    public int getLado2(){
        return lado2;
    }

    public int getLado3(){
        return lado3;
    }

    public double Area(){
        double p = Perimeter() / 2;
        return Math.sqrt(p * (p - lado1) * (p - lado2) * (p - lado3));
    }

    public double Perimeter(){
        return lado1 + lado2 + lado3;
    }
}
