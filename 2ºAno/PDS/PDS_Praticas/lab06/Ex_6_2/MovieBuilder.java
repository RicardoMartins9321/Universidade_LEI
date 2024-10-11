package Ex_6_2;

import java.util.List;

public interface MovieBuilder {
   Movie getMovie();
   MovieBuilder setTitle(String title);
   MovieBuilder setYear(int year);
   MovieBuilder setDirector(Person director);
   MovieBuilder setWriter(Person writer);
   MovieBuilder setSeries(String series);
   MovieBuilder setCast(List<Person> cast);
   MovieBuilder setLocations(List<Place> locations);
   MovieBuilder setLanguages(List<String> languages);
   MovieBuilder setGenres(List<String> genres);
   MovieBuilder setTelevision(boolean isTelevision);
   MovieBuilder setNetflix(boolean isNetflix);
   MovieBuilder setIndependent(boolean isIndependent);
   MovieBuilder reset();
}
