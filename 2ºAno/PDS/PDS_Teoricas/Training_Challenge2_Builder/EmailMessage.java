public class EmailMessage {
    private final String sender;
    private final String recipient;
    private final String subject;
    private final String body;

    private EmailMessage(Builder builder) {
        this.sender = builder.sender;
        this.recipient = builder.recipient;
        this.subject = builder.subject;
        this.body = builder.body;
    }

    public String getSender() {
        return sender;
    }

    public String getRecipient() {
        return recipient;
    }

    public String getSubject() {
        return subject;
    }

    public String getBody() {
        return body;
    }

    public static class Builder {
        private String sender;
        private String recipient;
        private String subject;
        private String body;

        public Builder setSender(String sender) {
            this.sender = sender;
            return this;
        }

        public Builder setRecipient(String recipient) {
            this.recipient = recipient;
            return this;
        }

        public Builder setSubject(String subject) {
            this.subject = subject;
            return this;
        }

        public Builder setBody(String body) {
            this.body = body;
            return this;
        }

        public EmailMessage build() {
            return new EmailMessage(this);
        }
    }
}

// Usage:
public class Main {
    public static void main(String[] args) {
        EmailMessage email = new EmailMessage.Builder()
                .setSender("sender@example.com")
                .setRecipient("recipient@example.com")
                .setSubject("Test Email")
                .setBody("Hello, this is a test email.")
                .build();

        System.out.println("Sender: " + email.getSender());
        System.out.println("Recipient: " + email.getRecipient());
        System.out.println("Subject: " + email.getSubject());
        System.out.println("Body: " + email.getBody());
    }
}
