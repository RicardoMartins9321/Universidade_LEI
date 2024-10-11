// Interface for an abstract factory for juice, considering three different types of bottles: metal, plastic, and glass.
// The factory will have three methods, one for each type of juice: orange, apple, and lemon.
// The factory will return the corresponding juice in the corresponding bottle.
// The classes that implement the interfaces will be OrangeJuice, AppleJuice, and LemonJuice for the juice, and MetalBottle, PlasticBottle, and GlassBottle for the bottles.
// The factory will be called JuiceFactory.

interface JuiceFactory {
    OrangeJuice makeOrangeJuice();
    AppleJuice makeAppleJuice();
    LemonJuice makeLemonJuice();
}

// Implement the Factory for metal bottles
class MetalJuiceFactory implements JuiceFactory {
    @Override
    public OrangeJuice makeOrangeJuice() {
        return new MetalOrangeJuice();
    }

    @Override
    public AppleJuice makeAppleJuice() {
        return new MetalAppleJuice();
    }

    @Override
    public LemonJuice makeLemonJuice() {
        return new MetalLemonJuice();
    }
}

// Implement the Factory for plastic bottles
class PlasticJuiceFactory implements JuiceFactory {
    @Override
    public OrangeJuice makeOrangeJuice() {
        return new PlasticOrangeJuice();
    }

    @Override
    public AppleJuice makeAppleJuice() {
        return new PlasticAppleJuice();
    }

    @Override
    public LemonJuice makeLemonJuice() {
        return new PlasticLemonJuice();
    }
}

// Implement the Factory for glass bottles
class GlassJuiceFactory implements JuiceFactory {
    @Override
    public OrangeJuice makeOrangeJuice() {
        return new GlassOrangeJuice();
    }

    @Override
    public AppleJuice makeAppleJuice() {
        return new GlassAppleJuice();
    }

    @Override
    public LemonJuice makeLemonJuice() {
        return new GlassLemonJuice();
    }
}
