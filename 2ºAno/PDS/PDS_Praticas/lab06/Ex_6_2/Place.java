package Ex_6_2;

public class Place {
    private String namePlace;
    private double Latitude;
    private double Longitude;
    public Place(String namePlace, double latitude, double longitude) {
        this.namePlace = namePlace;
        Latitude = latitude;
        Longitude = longitude;
    }
    public String getNamePlace() {
        return namePlace;
    }
    public double getLatitude() {
        return Latitude;
    }
    public double getLongitude() {
        return Longitude;
    }
}
