public class ComplexNumber {
    private int realNum;
    private int imaginaryNum;

    public ComplexNumber(int realNum, int imaginaryNum) {
        this.realNum = realNum;
        this.imaginaryNum = imaginaryNum;
    }

    public ComplexNumber(int realNum) {
        this(realNum, 0);
    }

    public ComplexNumber(String complexNum) {
        int real = 0;
        int imaginary = 0;

        complexNum = complexNum.replace(" ", ""); // Remove espaços em branco

        // Verifica se o número é apenas imaginário
        if (complexNum.endsWith("i")) {
            String imagPart = complexNum.substring(0, complexNum.length() - 1); // Remove o 'i'
            if (imagPart.isEmpty() || imagPart.equals("+")) {
                imaginary = 1;
            } else if (imagPart.equals("-")) {
                imaginary = -1;
            } else {
                imaginary = Integer.parseInt(imagPart);
            }
        } else if (complexNum.contains("+") || complexNum.contains("-")) {
            // Separa a parte real e imaginária
            String[] parts = complexNum.split("(?=[+-])", 2);
            real = Integer.parseInt(parts[0].trim());
            if (parts.length > 1) {
                String imagPart = parts[1].replace("i", "").trim();
                imaginary = Integer.parseInt(imagPart);
            }
        } else {
            // Apenas a parte real
            real = Integer.parseInt(complexNum.trim());
        }

        this.realNum = real;
        this.imaginaryNum = imaginary;
    }

    public int getRealNum() {
        return realNum;
    }
    public int getImaginaryNum() {
        return imaginaryNum;
    }

    public ComplexNumber negate(ComplexNumber number) {
        return new ComplexNumber(-this.realNum, -this.imaginaryNum);
    }

    public ComplexNumber addNumbers(ComplexNumber other) {
        return new ComplexNumber(this.realNum + other.realNum, this.imaginaryNum + other.imaginaryNum);
    }

    public ComplexNumber subtractNumbers(ComplexNumber other) {
        if (this.imaginaryNum == 0) {
            return new ComplexNumber(this.realNum - other.realNum, other.imaginaryNum);
        } else {
            return new ComplexNumber(this.realNum - other.realNum, this.imaginaryNum - other.imaginaryNum);
        }    
    }

    public ComplexNumber multiplyNumbers(ComplexNumber other) {
        int newReal = this.realNum * other.realNum - this.imaginaryNum * other.imaginaryNum;
        int newImaginary = this.realNum * other.imaginaryNum + this.imaginaryNum * other.realNum;
        return new ComplexNumber(newReal, newImaginary);
    }

    public ComplexNumber divideNumbers(ComplexNumber other) {
        int denominator = other.realNum * other.realNum + other.imaginaryNum * other.imaginaryNum;
        int newReal = (this.realNum * other.realNum + this.imaginaryNum * other.imaginaryNum) / denominator;
        int newImaginary = (this.imaginaryNum * other.realNum - this.realNum * other.imaginaryNum) / denominator;
        return new ComplexNumber(newReal, newImaginary);
    }

    public ComplexNumber conjugate() {
        return new ComplexNumber(this.realNum, -this.imaginaryNum);
    }

    public double module() {
        return Math.sqrt(this.realNum * this.realNum + this.imaginaryNum * this.imaginaryNum);
    }

    @Override
    public String toString() {
        if (this.realNum == 0 && this.imaginaryNum == 0) {
            return "0";
        }
    
        String realPart = this.realNum != 0 ? String.valueOf(this.realNum) : "";
        String imaginaryPart = "";
    
        if (this.imaginaryNum != 0) {
            if (Math.abs(this.imaginaryNum) == 1) {
                imaginaryPart = this.imaginaryNum > 0 ? " + i" : " - i";
            } else {
                imaginaryPart = this.imaginaryNum > 0 ? " + " + this.imaginaryNum + "i" 
                : " - " + Math.abs(this.imaginaryNum) + "i";
            }
        }
    
        return realPart + imaginaryPart;
    }
}
