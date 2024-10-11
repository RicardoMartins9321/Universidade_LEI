package lab05.Ex2;

public class Tupperware extends Container{
    // Construtor
    protected Tupperware(Portion portion){
        super(portion);
    }

    @Override
    public String toString(){
        return "Tupperware with portion = " + getPortion().toString();
    }
}
