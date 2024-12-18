package Ex_7_3;
import java.util.ArrayList;
import java.util.List;

public class PrinterTestBasicAdap {

    private static void pause(long millis) {
        try {
            Thread.sleep(millis);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) throws InterruptedException {
        BasicPrinter basicPrinter = new BasicPrinter();
        AdvancedPrinterInterface p = new BasicPrinterAdapter(basicPrinter);

        List<Document> docs = new ArrayList<Document>();
        docs.add(new Document("C:/Users/joaov/Desktop/tudo3/tudo2/programing/java/PDS/practical-gp311/lab07/Ex_7_3/text1.txt"));
        docs.add(new Document("C:/Users/joaov/Desktop/tudo3/tudo2/programing/java/PDS/practical-gp311/lab07/Ex_7_3/text2.txt"));
        docs.add(new Document("C:/Users/joaov/Desktop/tudo3/tudo2/programing/java/PDS/practical-gp311/lab07/Ex_7_3/text3.txt"));

        p.print(docs.get(0));   // print first document only
        pause(2000);            // wait for a while

        p.print(docs);
        p.showQueuedJobs();
        pause(4000);            // wait for a while

        p.print(docs);
        p.cancelJob(6);
        p.showQueuedJobs();
        pause(4000);            // wait for a while

        p.print(docs);
        p.cancelAll();
        p.showQueuedJobs();

        pause(2000);            // wait for a while
    }
}
