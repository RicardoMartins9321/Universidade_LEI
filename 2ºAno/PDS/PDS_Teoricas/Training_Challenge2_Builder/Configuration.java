public class Configuration {
    private final String databaseUrl;
    private final String username;
    private final String password;

    private Configuration(Builder builder) {
        this.databaseUrl = builder.databaseUrl;
        this.username = builder.username;
        this.password = builder.password;
    }

    public String getDatabaseUrl() {
        return databaseUrl;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public static class Builder {
        private String databaseUrl;
        private String username;
        private String password;

        public Builder setDatabaseUrl(String databaseUrl) {
            this.databaseUrl = databaseUrl;
            return this;
        }

        public Builder setUsername(String username) {
            this.username = username;
            return this;
        }

        public Builder setPassword(String password) {
            this.password = password;
            return this;
        }

        public Configuration build() {
            return new Configuration(this);
        }
    }
}

// Usage:
public class Main {
    public static void main(String[] args) {
        Configuration config = new Configuration.Builder()
                .setDatabaseUrl("jdbc:mysql://localhost:3306/mydb")
                .setUsername("admin")
                .setPassword("password")
                .build();

        System.out.println("Database URL: " + config.getDatabaseUrl());
        System.out.println("Username: " + config.getUsername());
        System.out.println("Password: " + config.getPassword());
    }
}
