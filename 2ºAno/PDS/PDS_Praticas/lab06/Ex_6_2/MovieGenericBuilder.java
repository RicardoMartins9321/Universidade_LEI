package Ex_6_2;

import java.util.List;

public class MovieGenericBuilder implements MovieBuilder {

    // Campos para armazenar temporariamente os valores enquanto a construção ocorre
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

    // Construtor
    public MovieGenericBuilder() {
        reset();
    }

    @Override
    public Movie getMovie() {
        return new Movie(title, year, director, writer, series, cast, locations, languages, genres, isTelevision, isNetflix, isIndependent);
    }

    @Override
    public MovieBuilder setTitle(String title) {
        this.title = title;
        return this;
    }

    @Override
    public MovieBuilder setYear(int year) {
        this.year = year;
        return this;
    }

    @Override
    public MovieBuilder setDirector(Person director) {
        this.director = director;
        return this;
    }

    @Override
    public MovieBuilder setWriter(Person writer) {
        this.writer = writer;
        return this;
    }

    @Override
    public MovieBuilder setSeries(String series) {
        this.series = series;
        return this;
    }

    @Override
    public MovieBuilder setCast(List<Person> cast) {
        this.cast = cast;
        return this;
    }

    @Override
    public MovieBuilder setLocations(List<Place> locations) {
        this.locations = locations;
        return this;
    }

    @Override
    public MovieBuilder setLanguages(List<String> languages) {
        this.languages = languages;
        return this;
    }

    @Override
    public MovieBuilder setGenres(List<String> genres) {
        this.genres = genres;
        return this;
    }

    @Override
    public MovieBuilder setTelevision(boolean isTelevision) {
        this.isTelevision = isTelevision;
        return this;
    }

    @Override
    public MovieBuilder setNetflix(boolean isNetflix) {
        this.isNetflix = isNetflix;
        return this;
    }

    @Override
    public MovieBuilder setIndependent(boolean isIndependent) {
        this.isIndependent = isIndependent;
        return this;
    }

    @Override
    public MovieBuilder reset() {
        // Reinicia todos os campos para seus valores padrão
        title=null;
        year=0;
        director=null;
        writer=null;
        series=null;
        cast=null;
        locations=null;
        languages=null;
        genres=null;
        isTelevision=false;
        isNetflix=false;
        isIndependent=false;
        return this;
    }

    
}
