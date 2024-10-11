public class User {
    private final String username;
    private final String email;

    private User(Builder builder) {
        this.username = builder.username;
        this.email = builder.email;
    }

    public String getUsername() {
        return username;
    }

    public String getEmail() {
        return email;
    }

    public static class Builder {
        private String username;
        private String email;

        public Builder setUsername(String username) {
            this.username = username;
            return this;
        }

        public Builder setEmail(String email) {
            this.email = email;
            return this;
        }

        public User build() {
            return new User(this);
        }
    }
}

// Usage:
public class Main {
    public static void main(String[] args) {
        User user = new User.Builder()
                .setUsername("john_doe")
                .setEmail("john@example.com")
                .build();

        System.out.println("Username: " + user.getUsername());
        System.out.println("Email: " + user.getEmail());
    }
}

