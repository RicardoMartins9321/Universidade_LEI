package Ex_6_2;
 // to complete

import java.util.List;

public class Movie {
   private String title;
   private int year;
   private Person director;
   private Person writer;
   private String series;
   private List<Person> cast;
   private List<Place> locations;
   private List<String> languages;
   private List<String> genres;
   private boolean isTelevision;
   private boolean isNetflix;
   private boolean isIndependent;

   public Movie(String title, int year, Person director, Person writer, String series, List<Person> cast,
         List<Place> locations, List<String> languages, List<String> genres, boolean isTelevision, boolean isNetflix,
         boolean isIndependent) {
      this.title = title;
      this.year = year;
      this.director = director;
      this.writer = writer;
      this.series = series;
      this.cast = cast;
      this.locations = locations;
      this.languages = languages;
      this.genres = genres;
      this.isTelevision = isTelevision;
      this.isNetflix = isNetflix;
      this.isIndependent = isIndependent;
   }

   public Movie() {
    }

   @Override
   public String toString() {
      return "Movie [title=" + title + ", year=" + year + ", director=" + director + ", writer=" + writer + ", series="
            + series + ", cast=" + cast + ", locations=" + locations + ", languages=" + languages + ", genres=" + genres
            + ", isTelevision=" + isTelevision + ", isNetflix=" + isNetflix + ", isIndependent=" + isIndependent + "]";
   }

   
}
