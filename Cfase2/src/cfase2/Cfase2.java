/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cfase2;

/**
 *
 * @author hecto
 */
import java.io.*;
import java.util.*;

public class Cfase2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
         try {
        System.out.println("Ingrese Ubicacion Archivo de Entrada ");
        Scanner s = new Scanner (System.in);
        String archivo = s.nextLine();
        Parser p = new Parser(new Lexer(new FileReader(archivo)));
        Object result = p.parse().value;      
    } catch (Exception e) {
      /* do cleanup here -- possibly rethrow e */
      e.printStackTrace();
    }
    }
    
}
