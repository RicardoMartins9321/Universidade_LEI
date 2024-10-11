package lab05.Ex2;

public class PlasticBottle extends Container{
    // Construtor
    protected PlasticBottle(Portion portion){
        super(portion);
    }

    @Override
    public String toString(){
        return "PlasticBottle with portion = " + getPortion().toString();
    }
}
