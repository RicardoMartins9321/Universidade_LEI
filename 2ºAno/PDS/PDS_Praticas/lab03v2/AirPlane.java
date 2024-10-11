class AirPlane {
    // Size identifiers
    private static final int rowID = 0;
    private static final int seatID = 1;
    // Class identifiers for structures below that have an additional dimension
    // to support both types of classes
    private static final int TuristID = 0;
    private static final int ExecutiveID = 1;
    // Array of seats
    private int[][][] seatsGrid = new int[2][][];
    // Array of seat sizes
    private int[][] sizePlaces = new int[2][];
    private int[] NumOfVacantSeats = { 0, 0 };
    private int numberOfReserva = 0;

    private AirPlane(int row, int seat) {
        seatsGrid[TuristID] = new int[row][seat];
        sizePlaces[TuristID] = new int[] { row, seat };
        NumOfVacantSeats[TuristID] = row * seat;
        emptyPlaces(TuristID);
        sizePlaces[ExecutiveID] = new int[] { 0, 0 };
    }

    private AirPlane(int rowE, int seatE, int rowT, int seatT) {
        seatsGrid[TuristID] = new int[rowT][seatT];
        sizePlaces[TuristID] = new int[] { rowT, seatT };
        NumOfVacantSeats[TuristID] = rowT * seatT;
        seatsGrid[ExecutiveID] = new int[rowE][seatE];
        sizePlaces[ExecutiveID] = new int[] { rowE, seatE };
        NumOfVacantSeats[ExecutiveID] = rowE * seatE;
        emptyPlaces(TuristID);
        emptyPlaces(ExecutiveID);
    }
    public static AirPlane createPlane(int[] sizes) {
        switch (sizes.length) {
            case 2:
                return new AirPlane(sizes[0],sizes[1]);
            case 4:
                return new AirPlane(sizes[0],sizes[1],sizes[2],sizes[3]);
        }
        return null;
    }

    public int getNumberOfReserva() {
        return numberOfReserva;
    }

    public int[] getNumOfVacantSeats() {
        return NumOfVacantSeats;
    }

    public boolean addReserva(Reserva reserva) {
        int idClass = NumOfClass(reserva);
        int numberSeatsNeed = reserva.getNumberOfSeats();
        if (NumOfVacantSeats[idClass] < numberSeatsNeed) {
            return false;
        }
        addSeats(numberSeatsNeed, SeachForLineEmpty(idClass), idClass);
        NumOfVacantSeats[idClass] -= numberSeatsNeed;
        return true;
    }

    public void removeReserva(int idReserva) {
        removeSeats(TuristID, idReserva);
        removeSeats(ExecutiveID, idReserva);
    }

    // Returns the string of the last occupied seats
    public String assignedPlaces(Reserva reserva) {
        StringBuilder sb = new StringBuilder();
        int idReserva = numberOfReserva;
        int idClass = NumOfClass(reserva);
        boolean first = true;
        for (int line = 0; line < sizePlaces[idClass][rowID]; line++) {
            for (int seat = 0; seat < sizePlaces[idClass][seatID]; seat++) {
                if (seatsGrid[idClass][line][seat] == idReserva) {
                    int seatDigit = line + 1;
                    seatDigit += (idClass == TuristID ? sizePlaces[ExecutiveID][rowID] : 0);
                    char seatLetter = (char) ('A' + seat);
                    if (first) {
                        sb.append(seatDigit + "" + seatLetter);
                        first = false;
                    } else {
                        sb.append(" | " + seatDigit + "" + seatLetter);
                    }
                }
            }
        }
        return sb.toString() + "\n";
    }

    private void removeSeats(int idClass, int idReserva) {
        for (int line = 0; line < sizePlaces[idClass][rowID]; line++) {
            for (int seat = 0; seat < sizePlaces[idClass][seatID]; seat++) {
                if (seatsGrid[idClass][line][seat] == idReserva) {
                    seatsGrid[idClass][line][seat] = 0;
                }
            }
        }
    }

    private void addSeats(int numSeats, int line, int idClass) {
        // se não
        int index = line != -1 ? line * sizePlaces[idClass][seatID] : 0;
        numberOfReserva++;
        while (numSeats > 0) {
            int row = index / sizePlaces[idClass][seatID];
            int seat = index % sizePlaces[idClass][seatID];
            if (seatsGrid[idClass][row][seat] == 0) {
                seatsGrid[idClass][row][seat] = numberOfReserva;
                numSeats--;
            }
            index++;
            if (index >= sizePlaces[idClass][seatID] * sizePlaces[idClass][rowID]) {
                index = 0;
            }
        }
    }

    private int SeachForLineEmpty(int idClass) {
        for (int column = 0; column < sizePlaces[idClass][rowID]; column++) {
            boolean emptyLine = true;
            for (int line = 0; line < sizePlaces[idClass][seatID]; line++) {
                if (seatsGrid[idClass][column][line] != 0) {
                    emptyLine = false;
                    break;
                }
            }
            if (emptyLine) {
                return column;
            }
        }
        return -1;
    }

    // Set all seats as empty
    private void emptyPlaces(int idClass) {
        for (int line = 0; line < sizePlaces[idClass][rowID]; line++) {
            for (int seat = 0; seat < sizePlaces[idClass][seatID]; seat++) {
                seatsGrid[idClass][line][seat] = 0;
            }
        }
    }

    private int NumOfClass(Reserva reserva) {
        return reserva.getplaneClass() == TypeClass.E ? 1 : 0;
    }

    private static int Max(int num1, int num2) {
        return num1 > num2 ? num1 : num2;
    }

    // Is a airPlane map
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        char lineChar = 'A';
        sb.append("   ");
        for (int i = 1; i <= sizePlaces[TuristID][rowID] + sizePlaces[ExecutiveID][rowID]; i++) {
            sb.append(String.format("%3d", i));
        }
        sb.append("\n");
        for (int seat = 0; seat < Max(sizePlaces[ExecutiveID][seatID], sizePlaces[TuristID][seatID]); seat++) {
            sb.append(String.format("%3c", lineChar++));
            // So the id will be both classes
            for (int id = 1; id >= 0; id--) {
                for (int line = 0; line < sizePlaces[id][rowID]; line++) {
                    if (seat < sizePlaces[id][seatID]) {
                        sb.append(String.format("%3d", seatsGrid[id][line][seat]));
                    } else {
                        sb.append("   ");
                    }
                }
            }
            sb.append("\n");
        }
        return sb.toString();
    }

}
