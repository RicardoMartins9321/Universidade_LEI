public class OffState implements State{
    public void pull(CeilingFan fan){
        fan.setState(new LowSpeedState());
        System.out.println("Turning to low speed.");
    }
}

class LowSpeedState implements State {
    @Override
    public void pull(CeilingFan fan) {
        fan.setState(new MediumSpeedState());
        System.out.println("Turning to medium speed.");
    }
}

class MediumSpeedState implements State {
    @Override
    public void pull(CeilingFan fan) {
        fan.setState(new HighSpeedState());
        System.out.println("Turning to high speed.");
    }
}

class HighSpeedState implements State {
    @Override
    public void pull(CeilingFan fan) {
        fan.setState(new OffState());
        System.out.println("Turning off.");
    }
}