package Ex_7_3;

import java.util.concurrent.Callable;

public class PrintJob implements Callable<String> {
    private Document document;
    private int jobId;

    public PrintJob(Document document, int jobId) {
        this.document = document;
        this.jobId = jobId;
    }

    @Override
    public String call() throws Exception {
        System.out.println("Printing document: " + document.getContent()[0].substring(0, Math.min(20, document.getContent()[0].length()-1)));
        // Simulate printing delay
        Thread.sleep(1000);
        System.out.println("Finished Job " + jobId + ": \"" + document.getContent()[0].substring(0, Math.min(20, document.getContent()[0].length()-1)) + "\"");
        return "Document printed: " + document.getContent()[0].substring(0, Math.min(20, document.getContent()[0].length()-1));
    }

    public Document getDocument() {
        return document;
    }

    public int getJobId() {
        return jobId;
    }
}
