public class CeilingFan {
    private State currentState;

    public CeilingFan() {
        currentState = new OffState(); // Estado inicial
    }

    public void setState(State state) {
        currentState = state;
    }

    public State getState() {
        return currentState;
    }

    public void pull() {
        currentState.pull(this);
    }
}
