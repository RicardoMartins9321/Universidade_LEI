package Menu_System;

// Component
interface MenuComponent {
    void print();
}

// Leaf
class MenuItem implements MenuComponent {
    private String name;

    public MenuItem(String name) {
        this.name = name;
    }

    public void print() {
        System.out.println("Menu Item: " + name);
    }
}

// Composite
class Menu implements MenuComponent {
    private List<MenuComponent> menuComponents = new ArrayList<>();
    private String name;

    public Menu(String name) {
        this.name = name;
    }

    public void add(MenuComponent menuComponent) {
        menuComponents.add(menuComponent);
    }

    public void print() {
        System.out.println("Menu: " + name);
        for (MenuComponent menuComponent : menuComponents) {
            menuComponent.print();
        }
    }
}

// Client
public class MenuDemo {
    public static void main(String[] args) {
        Menu mainMenu = new Menu("Main");
        MenuItem menuItem1 = new MenuItem("Item 1");
        Menu subMenu = new Menu("Submenu");

        mainMenu.add(menuItem1);
        mainMenu.add(subMenu);

        MenuItem menuItem2 = new MenuItem("Item 2");
        subMenu.add(menuItem2);

        mainMenu.print();
    }
}

