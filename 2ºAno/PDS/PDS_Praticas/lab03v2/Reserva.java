public class Reserva {
    private TypeClass pClass;
    private int numberOfSeats;
    public Reserva(TypeClass pClass, int numberOfSeats) {
        this.pClass = pClass;
        this.numberOfSeats = numberOfSeats;
    }
    public TypeClass getplaneClass() {
        return pClass;
    }
    public void setpClass(TypeClass pClass) {
        this.pClass = pClass;
    }
    public int getNumberOfSeats() {
        return numberOfSeats;
    }
    public void setNumberOfSeats(int numberOfSeats) {
        this.numberOfSeats = numberOfSeats;
    }



}
