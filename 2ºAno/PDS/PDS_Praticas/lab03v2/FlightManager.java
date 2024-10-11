import java.util.HashMap;
import java.util.Map;

public class FlightManager {
    private final static int rowID = 0;
    private final static int seatID = 1;
    private Map<String, AirPlane> flights;

    public FlightManager() {
        flights = new HashMap<>();
    }

    public boolean addFlight(String codeOfAirplane, String TuristSeatsSize) {
        if (flights.keySet().contains(codeOfAirplane)) {
            return false;
        }
        int[] size = SizeStringToIntArray(TuristSeatsSize);
        AirPlane airPlane = AirPlane.createPlane(size);
        flights.put(codeOfAirplane, airPlane);
        return true;
    }

    public boolean addFlight(String codeOfAirplane, String ExecutiveSeatsSize, String TuristSeatsSize) {
        if (flights.keySet().contains(codeOfAirplane)) {
            return false;
        }
        int[] sizeExecutive = SizeStringToIntArray(ExecutiveSeatsSize);
        int[] sizeTurist = SizeStringToIntArray(TuristSeatsSize);
        int[] sizes = joinTwoSizeArrays(sizeExecutive, sizeTurist);
        AirPlane airPlane = AirPlane.createPlane(sizes);
        if (airPlane==null) {
            return false;
        }
        flights.put(codeOfAirplane, airPlane);
        return true;
    }

    public boolean addReservaToAirPlane(String codeOfAirplane, String StrTypeClass, String numberOfSeats,
            boolean isOptionR) {
        AirPlane airPlane = flights.get(codeOfAirplane);
        TypeClass typeClass=TypeClass.getClassOfString(StrTypeClass);
        if (typeClass==null||airPlane==null||!StringPossibleTurnToInt(numberOfSeats)) {
            return false;
        }
        int numberOfSeatsINT = Integer.parseInt(numberOfSeats);
        Reserva reserva = new Reserva(typeClass, numberOfSeatsINT);
        boolean successReserva = airPlane.addReserva(reserva);
        if (successReserva && isOptionR) {
            System.out.printf("%s:%d = %s", codeOfAirplane, airPlane.getNumberOfReserva(),
                    airPlane.assignedPlaces(reserva));
        }
        return successReserva;
    }

    public AirPlane getAirPlane(String codeOfAirplane) {
        if (!flights.keySet().contains(codeOfAirplane)) {
            System.err.println("Error: There are no flights with this flight code.");
            System.exit(1);
        }
        return flights.get(codeOfAirplane);
    }

    public void removeReservaOfAirPlane(String codeOfAirplane, int idReserva) {
        getAirPlane(codeOfAirplane).removeReserva(idReserva);
    }

    public void displayAirPlane(String codeOfAirplane) {
        if (!flights.keySet().contains(codeOfAirplane)) {
            System.err.println("Error: There are no flights with this flight code.");
            return;
        }
        System.out.println(getAirPlane(codeOfAirplane));
    }

    public void AirPlaneInformationPrint(String codeOfAirplane) {

        AirPlane airPlane = getAirPlane(codeOfAirplane);
        StringBuilder sb = new StringBuilder();
        sb.append(String.format("Código de voo %s. Lugares disponíveis: ", codeOfAirplane));
        int sizeSeatTurist = airPlane.getNumOfVacantSeats()[0];
        int sizeSeatExecutive = airPlane.getNumOfVacantSeats()[1];
        if (sizeSeatExecutive > 0) {

            sb.append(String.format("%d lugares em classe Executiva; ", sizeSeatExecutive));
        }
        sb.append(String.format("%d lugares em classe Turística.", sizeSeatTurist));
        if (sizeSeatExecutive == 0) {
            sb.append("\nClasse executiva não disponível neste voo.");
        }
        sb.append("\n");
        System.out.println(sb.toString());
    }

    private static int[] SizeStringToIntArray(String strSize) {
        int[] size = new int[2];
        String[] str = strSize.split("x");
        if (str.length != 2||StringPossibleTurnToInt(str[rowID])||StringPossibleTurnToInt(str[seatID])) {
            System.err.println("Error: number_seats invalid.");
            System.exit(1);
        }
        
        size[rowID] = Integer.parseInt(str[rowID]);
        size[seatID] = Integer.parseInt(str[seatID]);
        return size;

    }

    private static int[] joinTwoSizeArrays(int[] sizeExecutive, int[] sizeTurist) {
        int[] newSizeArray = new int[4];
        
        newSizeArray[0] = sizeExecutive[rowID];
        newSizeArray[1] = sizeExecutive[seatID];
        
        newSizeArray[2] = sizeTurist[rowID];
        newSizeArray[3] = sizeTurist[seatID];
        
        return newSizeArray;
    }
    
    private static boolean StringPossibleTurnToInt(String strInt){
        for (int i = 0; i < strInt.length(); i++) {
            if (!Character.isDigit(strInt.charAt(i))) {
                return false;
            }
        }
        return true;
    }
}
