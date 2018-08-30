/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.FileOutputStream;
import java.io.File;
import java.io.Writer;
import java.io.FileWriter;
import java.io.OutputStreamWriter;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.BufferedWriter;
import java.util.Scanner;
 
public class Minic {
 
  public static void main(String[] args) {
 
  try{
 
  // Asignación del nombre de archivo por defecto que usará la aplicación
    System.out.println("Ingrese Ubicacion Archivo de Entrada ");
    Scanner s = new Scanner (System.in);
    String archivo = s.nextLine();
  //String archivo = "prueba.txt";
 
  // Se trata de leer el archivo y analizarlo en la clase que se ha creado con JFlex
   BufferedReader buffer = new BufferedReader(new FileReader(archivo));
   AnalizadorLexico analizadorJFlex = new AnalizadorLexico(buffer);
   BufferedWriter output = null;
   System.out.println("Ingrese Ubicacion Archivo de Salida");
   String out = s.nextLine();
   File file = new File(out);
            output = new BufferedWriter(new FileWriter(file));
  while(true){
 
  // Obtener el token analizado y mostrar su información
  TokenPersonalizado token = analizadorJFlex.yylex();
 
  if (!analizadorJFlex.existenTokens())
   break;
 
  
    output.write(token.toString());
    output.newLine();
     
  
  System.out.println(token.toString());
   if (analizadorJFlex.existenError()) {
          break;
      }
 }
   output.close();
 }
 catch (Exception e){
   System.out.println(e.toString());
 }
 }
}