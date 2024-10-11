package Ex_7_3;

import java.util.List;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

public class AdvancedPrinter implements AdvancedPrinterInterface {

    // https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/util/concurrent/ExecutorService.html
    class PrinterService implements Runnable {
        private final LinkedBlockingQueue<PrintJob> printQueue;
        private final ExecutorService pool;
        private int id=1; 
      

        // este serviço simula a fila de impressão e a impressão de um documento de cada vez
        public PrinterService() {
                printQueue = new LinkedBlockingQueue<>();
                pool = Executors.newFixedThreadPool(1);
        }

        public void run() { // run the service
            try {
                for (;;) {
                    PrintJob j = printQueue.take();
                    pool.submit(j).get();
                }
            } catch (java.util.concurrent.RejectedExecutionException ex) {
                System.out.println("Job rejected by spool: service shutting down?");
            } catch (ExecutionException e) {
                System.out.println("Error");
                e.printStackTrace();
            } catch (InterruptedException ex) {
            this.shutdownAndAwaitTermination();
            }
        }

        public int newPrintJob(Document doc) {
           if (printQueue.add(new PrintJob(doc, id))) {
                return id++;
           } else{
            return -1;
           }
        }

        public boolean cancelJob(int job) {
           for (PrintJob printJob : printQueue) {
            if (printJob.getJobId()==job) {
                return printQueue.remove(printJob);
            }
           }
           return false;
        }

        void shutdownAndAwaitTermination() {
            pool.shutdown(); // Disable new tasks from being submitted
            try {
            // Wait a while for existing tasks to terminate
            if (!pool.awaitTermination(60, TimeUnit.SECONDS)) {
                pool.shutdownNow(); // Cancel currently executing tasks
                // Wait a while for tasks to respond to being cancelled
                if (!pool.awaitTermination(60, TimeUnit.SECONDS))
                    System.err.println("Spool did not terminate.");
            }
            } catch (InterruptedException ie) {
                // (Re-)Cancel if current thread also interrupted
                pool.shutdownNow();
                printQueue.clear();
                // Preserve interrupt status
                Thread.currentThread().interrupt();
            }
        }

        public LinkedBlockingQueue<PrintJob> getPrintQueue() {
            return printQueue;
        }

       public String getDocForID(int jobID){
        for (PrintJob printJob : printQueue) {
            if (printJob.getJobId()==jobID) {
                return printJob.getDocument().getContent()[0].substring(0, Math.min(20, printJob.getDocument().getContent()[0].length()-1));
            }
        }
        return "";
       }

    }

    private PrinterService spool;

    public AdvancedPrinter() {
        this.spool = new PrinterService();
        new Thread(this.spool).start();
    }

    @Override
    public int print(Document doc) {
        int jobId = spool.newPrintJob(doc);
        System.out.println("Spooled document: " + doc.getContent()[0].substring(0, Math.min(20, doc.getContent()[0].length()-1)) + " as Job " + jobId);
        return jobId;
    }

    @Override
    public List<Integer> print(List<Document> docs) {
        System.out.println("Spooling " + docs.size() + " documents.");
        return docs.stream().map(this::print).collect(Collectors.toList());
    }

    @Override
    public void showQueuedJobs() {
        System.out.print("Spooled jobs: ");
        for (PrintJob printJob : spool.getPrintQueue()) {
            System.out.println(printJob.getJobId()+" "+printJob.getDocument().getContent()[0].substring(0, Math.min(20, printJob.getDocument().getContent()[0].length()-1)) );
           }
    }

    @Override
    public boolean cancelJob(int jobId) {
        if (spool.cancelJob(jobId)) {
            System.out.println("Cancelled Job " + jobId+" "+spool.getDocForID(jobId));
            return true;
        }
        System.out.println("Failed to cancel Job " + jobId);
        return false;
    }

    @Override
    public void cancelAll() {
        System.out.println("Cancelling all jobs.");
        for (PrintJob printJob : spool.getPrintQueue()) {
            cancelJob(printJob.getJobId());
           }
    }

   

}