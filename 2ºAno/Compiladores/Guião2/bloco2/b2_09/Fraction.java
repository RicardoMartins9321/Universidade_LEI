import java.lang.Math;

public class Fraction {

    int numerator;
    int denominator;

    public Fraction(int numr, int denr) {
        numerator = numr;
        denominator = denr;
    }

    public Fraction(int numr) {
        this(numr,1);
    }

    public int getNumerator() {
        return numerator;
    }

    public int getDenominator() {
        return denominator;
    }

    public int calculateGCD(int numerator, int denominator) {
        if (numerator % denominator == 0) {
            return denominator;
        }
        return calculateGCD(denominator, numerator % denominator);
    }

    /**
     * Reduce the fraction to lowest form
     */
    public Fraction reduce() {
        int temp_numr = numerator;
        int temp_denr = denominator;
        int gcd = calculateGCD(temp_numr, temp_denr);
        temp_numr /= gcd;
        temp_denr /= gcd;
        return new Fraction(temp_numr, temp_denr);
    }

    public Fraction add(Fraction fractionTwo) {
        int numer = (numerator * fractionTwo.getDenominator()) + (fractionTwo.getNumerator() * denominator);
        int denr = denominator * fractionTwo.getDenominator();
        return new Fraction(numer, denr);
    }

    public Fraction subtract(Fraction fractionTwo) {
        int newNumerator = (numerator * fractionTwo.denominator) - (fractionTwo.numerator * denominator);
        int newDenominator = denominator * fractionTwo.denominator;
        Fraction result = new Fraction(newNumerator, newDenominator);
        return result;
    }


    public Fraction multiply(Fraction fractionTwo) {
        int newNumerator = numerator * fractionTwo.numerator;
        int newDenominator = denominator * fractionTwo.denominator;
        Fraction result = new Fraction(newNumerator, newDenominator);
        return result;
    }


    public Fraction divide(Fraction fractionTwo) {
        int newNumerator = numerator * fractionTwo.getDenominator();
        int newDenominator = denominator * fractionTwo.numerator;
        Fraction result = new Fraction(newNumerator, newDenominator);
        return result;
    }

    public Fraction powtencia(Fraction frac){
        int newNumerator=numerator;
        int newDenominator=denominator;
        
        for (int i = 0; i < frac.numerator-1; i++) {
            newNumerator = newNumerator * numerator;
            newDenominator = newDenominator * denominator;
        }
        
        Fraction result = new Fraction(newNumerator, newDenominator);
        return result;

    }

    
    @Override
    public String toString() {
        if (this.denominator == 1) {
            return this.numerator + "";
        }
        else if (this.numerator == 0) {
            return "0";
        }
        return this.numerator + "/" + this.denominator;
    }
}