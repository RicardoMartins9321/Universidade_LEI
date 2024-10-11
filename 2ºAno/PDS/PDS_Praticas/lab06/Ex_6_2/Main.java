package Ex_6_2;

public class Main {
    public static void main(String[] args) {
        MovieBuilder movieGenericBuilder = new MovieGenericBuilder();
        Diretor diretor = new Diretor();
        diretor.setMovieBuilder(movieGenericBuilder);
        diretor.createMovie1();
        Movie movie1= diretor.getMovie();
        System.out.println(movie1);
        System.out.println();
        diretor.createMovie2();
        Movie movie2= diretor.getMovie();
        System.out.println(movie2);
    }
}
