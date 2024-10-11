package WindowsSystem;

// Component
interface Window {
    void draw();
}

// Concrete Component
class SimpleWindow implements Window {
    public void draw() {
        System.out.println("Drawing a simple window.");
    }
}

// Decorator
abstract class WindowDecorator implements Window {
    protected Window window;

    public WindowDecorator(Window window) {
        this.window = window;
    }

    public void draw() {
        window.draw();
    }
}

// Concrete Decorators
class BorderDecorator extends WindowDecorator {
    public BorderDecorator(Window window) {
        super(window);
    }

    public void draw() {
        window.draw();
        System.out.println("Adding border to the window.");
    }
}

class ScrollBarDecorator extends WindowDecorator {
    public ScrollBarDecorator(Window window) {
        super(window);
    }

    public void draw() {
        window.draw();
        System.out.println("Adding scroll bar to the window.");
    }
}

// Client
public class WindowDemo {
    public static void main(String[] args) {
        Window simpleWindow = new SimpleWindow();
        Window borderedWindow = new BorderDecorator(simpleWindow);
        Window scrolledBorderedWindow = new ScrollBarDecorator(borderedWindow);

        scrolledBorderedWindow.draw();
    }
}

