import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.List;
import java.util.ArrayList;
import java.util.Scanner;
import java.util.regex.Pattern;

public class Menu {
    private static List<String[]> inputFileContents = new ArrayList<>(); // To store input file content
    private static FlightManager flightManager = new FlightManager();

    public static void main(String[] args) {
        parseArguments();

        // Testing the file reading
        for (String[] words : inputFileContents) {
            for (String word : words) {
                System.out.print(word + " ");
            }
            System.out.println();
        }
    }

    private static void parseArguments() {
        Scanner scanner = new Scanner(System.in);
        String choice = "";

        while (!choice.equalsIgnoreCase("Q")) {
            System.out.println("Enter an option: (H for help)");
            choice = scanner.nextLine();
            String choiceParts[] = choice.split("\\s+");

            switch (choiceParts[0].toUpperCase()) {
                case "H":
                    showOptionsMenu();
                    break;
                case "I":
                    if (choiceParts.length != 2) {
                        System.out.println("Error: Option I requires a file name.");
                        break;
                    }
                    String inputFile = choiceParts[1];
                    readWordsFromFile(inputFile);

                    break;
                case "M":
                    if (choiceParts.length != 2) {
                        System.out.println("Error: Option M requires a flight code.");
                    }
                    flightManager.displayAirPlane(choiceParts[1]);

                    break;
                case "F":
                    if (choiceParts.length != 4 && choiceParts.length != 3) {
                        System.out.println(
                                "Error: Option F requires a flight code, (optional)number of executive seats and number of tourist seats.");
                        break;
                    }
                    if (choiceParts.length == 3) {
                        if (!flightManager.addFlight(choiceParts[1], choiceParts[2])) {
                            System.out.println(
                                    "Error: The flight code has already been used.");
                        }
                        break;
                    }
                    if (!flightManager.addFlight(choiceParts[1], choiceParts[2], choiceParts[3])) {
                        System.out.println(
                                "Error: The flight code has already been used.");
                    }
                    ;
                    break;
                case "R":
                    if (choiceParts.length != 4) {
                        System.out.println("Error: Option R requires a flight code, class and number of seats.");
                        break;
                    }
                    if (!flightManager.addReservaToAirPlane(choiceParts[1], choiceParts[2], choiceParts[3], true)) {
                        System.out.printf("Não foi possível obter lugares para a reserva: %s %s\n", choiceParts[2],
                                choiceParts[3]);
                    }

                    break;
                case "C":
                    if (choiceParts.length != 2) {
                        System.out.println("Error: Option C requires a reservation code.");
                        break;
                    }
                    String[] reservation_code = choiceParts[1].split(":");
                    if (reservation_code.length != 2) {
                        System.out.println("Error: Option C requires a reservation code.");
                        break;
                    }
                    flightManager.removeReservaOfAirPlane(reservation_code[0], Integer.parseInt(reservation_code[1]));

                    break;
                case "Q":
                    System.out.println("Quitting the program.");
                    break;
                default:
                    System.out.println("Unknown option: " + choice);
            }
        }

        scanner.close();

    }

    public static void showOptionsMenu() {
        System.out.println("Options of usage: ");
        System.out.println("1. java Menu H - Shows the Options Menu");
        System.out.println("2. java Menu I <fileName> - Reads a text file containing information from the flight");
        System.out.println("3. java Menu M <flightCode> - Displays the reservations map of a flight");
        System.out
                .println("4. java Menu F <flight_code> <num_seats_executive> <num_seats_tourist> - Adds a new flight");
        System.out.println("5. java Menu R <flight_code> <class number_seats> - Adds a new reservation to a flight");
        System.out.println("6. java Menu C <reservation_code> - Cancel a reservation");
        System.out.println("7. java Menu Q - Quit the program");
    }

    private static void readWordsFromFile(String inputFile) {
        try (BufferedReader reader = new BufferedReader(new FileReader(inputFile))) {
            String firstLine = reader.readLine(); // Read the first line
            String[] firstLineWords = null;

            if (firstLine != null) {
                firstLineWords = firstLine.split("\\s+"); // Split by spaces
            }
            if (!validateFirstLineFormat(firstLineWords)) {
                System.out.println("Error: First line of input file isn't in the correct format.");
                return;
            }
            String codeOfAirplane = firstLineWords[0].replace(">", "");
            if (firstLineWords.length == 2) {
                flightManager.addFlight(codeOfAirplane, firstLineWords[1]);
            } else {
                flightManager.addFlight(codeOfAirplane, firstLineWords[1], firstLineWords[2]);
            }
            flightManager.AirPlaneInformationPrint(codeOfAirplane);

            String line;
            while ((line = reader.readLine()) != null) {
                String[] words = line.split("\\s+"); // Split by spaces
                if (!validateSubsequentLinesFormat(line)) {
                    System.out.println("Error: Invalid format for a subsequent line.");
                    continue; // Skip this line and continue with the next
                }
                if (!flightManager.addReservaToAirPlane(codeOfAirplane, words[0], words[1], false)) {
                    System.out.printf("Não foi possível obter lugares para a reserva: %s %s\n",words[0], words[1]);
                }
            }
        } catch (IOException e) {
            System.out.println("File not found: " + e.getMessage());
        }
    }

    private static boolean validateFirstLineFormat(String[] words) {
        if (words[0].charAt(0) != '>') {
            return false;
        }
        for (int i = 1; i < words.length; i++) {
            // Check if the format is numberxnumber
            if (!Pattern.matches("\\d+x\\d+", words[i])) {
                return false;
            }
        }
        return true;
    }

    private static boolean validateSubsequentLinesFormat(String line) {
        return Pattern.matches("^[TE]\\s\\d+$", line);
    }

}
