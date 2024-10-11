package lab05.Ex2;

public class TermicBottle extends Container{
    // Construtor
    protected TermicBottle(Portion portion){
        super(portion);
    }

    @Override
    public String toString(){
        return "TermicBottle with portion = " + getPortion().toString();
    }
}
