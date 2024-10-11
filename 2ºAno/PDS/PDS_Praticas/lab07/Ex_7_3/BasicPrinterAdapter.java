package Ex_7_3;

import java.util.List;
import java.util.ArrayList;

public class BasicPrinterAdapter implements AdvancedPrinterInterface {
    private BasicPrinter basicPrinter;

    public BasicPrinterAdapter(BasicPrinter printer) {
        this.basicPrinter = printer;
    }

    @Override
    public int print(Document doc) {
        String[] content = doc.getContent();
        boolean success = basicPrinter.print(content);
        basicPrinter.refill();
        return success ? 0 : -1; // Simple job ID simulation
    }

    @Override
    public List<Integer> print(List<Document> docs) {
        List<Integer> jobIds = new ArrayList<>();
        for (Document doc : docs) {
            int jobId = print(doc);
            jobIds.add(jobId);
        }
        return jobIds;
    }

    @Override
    public void showQueuedJobs() {
        System.out.println("Basic Printer does not support job queueing.");
    }

    @Override
    public boolean cancelJob(int jobId) {
        System.out.println("Basic Printer does not support job cancellation.");
        return false;
    }

    @Override
    public void cancelAll() {
        System.out.println("Basic Printer does not support canceling all jobs.");
    }
}
