package ex_02;

import org.stringtemplate.v4.ST;
import org.stringtemplate.v4.STGroup;
import org.stringtemplate.v4.STGroupFile;

public class Main {
    public static void main(String[] args) {
        // Carrega o template
        STGroup templates = new STGroupFile("CalculadoraTemplate.stg");
        ST programTemplate = templates.getInstanceOf("CalculadoraTemplate");

        // Define os dados para o template
        programTemplate.add("program", new Programa()); // Supondo que Programa é uma classe que representa o programa

        // Gera o código
        String code = programTemplate.render();

        // Imprime o código gerado
        System.out.println(code);
    }
}

