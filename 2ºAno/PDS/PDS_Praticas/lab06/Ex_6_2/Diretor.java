package Ex_6_2;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;

/**
 * Diretor
 */
public class Diretor {
    private MovieBuilder movieBuilder;

    public Diretor() {
    }

    public void setMovieBuilder(MovieBuilder movieBuilder) {
        this.movieBuilder = movieBuilder;
    }

    public void createMovie1(){
        Person director = new Person(123456789, "John Doe");
        Person writer = new Person(987654321, "Jane Smith");

        List<Person> cast = new ArrayList<>();
        cast.add(new Person(111222333, "Carlos"));
        cast.add(new Person(444555666, "Bob"));
        cast.add(new Person(777888999, "Charlie"));

        List<Place> locations = new ArrayList<>();
        locations.add(new Place("Location 1", 40.7128, -74.0060));
        locations.add(new Place("Location 2", 34.0522, -118.2437));

        movieBuilder
        .setTitle("Awesome Movie")
        .setYear(2024)
        .setDirector(director)
        .setWriter(writer)
        .setSeries("Series 1")
        .setCast(cast)
        .setLocations(locations)
        .setTelevision(true)
        .setNetflix(true)
        .setIndependent(false);
    }
    
    public void createMovie2(){
        Person director = new Person(123456789, "John Titor");
        Person writer = new Person(987654321, "Jane Smith");

        List<Person> cast = new ArrayList<>();
        cast.add(new Person(111222333, "Carlos"));
        cast.add(new Person(444555666, "Bob"));
        cast.add(new Person(777888999, "Charlie"));

        List<Place> locations = new ArrayList<>();
        locations.add(new Place("Location 1", 140.7128, 4.0060));
        locations.add(new Place("Location 2", 34.0522, 18.2437));

        movieBuilder
        .setTitle("The Movie")
        .setYear(2028)
        .setDirector(director)
        .setWriter(writer)
        .setCast(cast)
        .setLocations(locations)
        .setTelevision(false)
        .setNetflix(false)
        .setIndependent(false);
    }
    public Movie getMovie(){
        return movieBuilder.getMovie();
    }
}