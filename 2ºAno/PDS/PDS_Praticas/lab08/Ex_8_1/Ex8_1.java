package Ex_8_1;

import java.util.Date;

public class Ex8_1 {
    public static void main(String[] args) {
        // Create employee
        EmployeeInterface employee1 = new Employee("Ricardo Martins");
        EmployeeInterface employee2 = new Employee("João Viegas");

        // Employee start
        employee1.start(new Date());
        employee2.start(new Date());

        // Employee work
        employee1.work();
        employee2.work();

        // Employee terminate
        employee1.terminate(new Date());
        employee2.terminate(new Date());

        System.out.println();

        // TeamMember class
        EmployeeInterface employee3 = new Employee("António Silva");
        TeamMember teamMember = new TeamMember(employee3);
        teamMember.start(new Date());
        teamMember.work();
        teamMember.colaborate();
        teamMember.terminate(new Date());

        System.out.println();
        // TeamLeader class
        EmployeeInterface employee4 = new Employee("Miguel Pinto");
        TeamLeader teamLeader = new TeamLeader(employee4);
        teamLeader.start(new Date());
        teamLeader.work();
        teamLeader.plan();
        teamLeader.terminate(new Date());

        System.out.println();
        // Manager class
        EmployeeInterface employee5 = new Employee("Rodrigo Santos");
        Manager manager = new Manager(employee5);
        manager.start(new Date());
        manager.work();
        manager.manage();
        manager.terminate(new Date());

        System.out.println();
        // Testing all classes
        EmployeeInterface employee6 = new Employee("Bruno Pereira");
        Manager managerTest = new Manager(new TeamLeader(new TeamMember(employee6)));
        managerTest.start(new Date());
        managerTest.work();
        managerTest.manage();
        managerTest.terminate(new Date());

        // Testing: Role Transitions
        EmployeeInterface emp3 = new Employee("Ana Pereira");
        TeamMember teamMember3 = new TeamMember(emp3);
        TeamLeader leader3 = new TeamLeader(teamMember3);
        Manager manager3 = new Manager(leader3);
        manager3.start(new Date());
        manager3.work();
        manager3.manage();
        leader3.plan();
        teamMember3.colaborate();
        manager3.terminate(new Date());

        System.out.println();
    }
}
