package ex_7_2;

public class Contact {
    private String name;
    private long numberPhone;

    public Contact(String name, long numberPhone) {
        this.name = name;
        this.numberPhone = numberPhone;
    }

    public String getName() {
        return name;
    }

    public long getNumberPhone() {
        return numberPhone;
    }

    @Override
    public String toString() {
        return "Contact [name=" + name + ", numberPhone=" + numberPhone + "]";
    }

   

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Contact other = (Contact) obj;
        if (name == null) {
            if (other.name != null)
                return false;
        } else if (!name.equals(other.name))
            return false;
        if (numberPhone != other.numberPhone)
            return false;
        return true;
    }

}
