package Ex_8_1;

import java.util.Date;

public class TeamLeader extends Decorator {

    public TeamLeader(EmployeeInterface employee) {
        super(employee);
    }

    @Override
    public void start(Date date) {
        super.start(date);
    }

    @Override
    public void terminate(Date date) {
        super.terminate(date);
    }

    @Override
    public void work() {
        super.work();
    }

    public void plan() {
        System.out.println(super.getName() + " plans the team's work");
    }
}
