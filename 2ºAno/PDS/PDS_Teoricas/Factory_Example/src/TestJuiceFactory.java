// Main file for testing JuiceFactory

public class TestJuiceFactory {
    public static void main(String[] args) {
        JuiceFactory metalFactory = new MetalJuiceFactory();
        JuiceFactory plasticFactory = new PlasticJuiceFactory();
        JuiceFactory glassFactory = new GlassJuiceFactory();

        OrangeJuice metalOrangeJuice = metalFactory.makeOrangeJuice();
        metalOrangeJuice.drink();

        AppleJuice plasticAppleJuice = plasticFactory.makeAppleJuice();
        plasticAppleJuice.drink();

        LemonJuice glassLemonJuice = glassFactory.makeLemonJuice();
        glassLemonJuice.drink();
    }
}
