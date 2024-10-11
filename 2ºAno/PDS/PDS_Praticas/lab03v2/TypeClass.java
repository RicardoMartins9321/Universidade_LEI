public enum TypeClass {
    T,E;

    public static TypeClass getClassOfString(String typeClass){
        try {
            return valueOf(typeClass);
        } catch (Exception e) {
            return null;
        }
    }
}
