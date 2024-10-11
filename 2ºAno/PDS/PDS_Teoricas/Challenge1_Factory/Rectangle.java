public class Rectangle extends Forma {
    int comprimento, altura;

    public Rectangle(int comprimento, int altura, String color){
        super(color);
        if (validation(comprimento) && validation(altura)){
            this.comprimento = comprimento;
            this.altura = altura;
            super.setPerimeter(Perimeter());
            super.setArea(Area());
        }
    }

    public String toString(){
        return "";
    }

    public boolean equals(int c, int a, String cor){
        if (comprimento == c && altura == a && getColor().equals(cor)){
            return true;
        }
        return false;
    }

    public int getComprimento(){
        return comprimento;
    }

    public int getAltura(){
        return altura;
    }

    public double Area(){
        return comprimento * altura;
    }

    public double Perimeter(){
        return 2 * (comprimento + altura);
    }
}
