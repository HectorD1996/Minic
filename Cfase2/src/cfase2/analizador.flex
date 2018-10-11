

/* --------------------------Usercode Section------------------------ */
package cfase2;   
import java_cup.runtime.Symbol;
      
%%
   
/* -----------------Options and Declarations Section----------------- */
   
/* 
   The name of the class JFlex will create will be Lexer.
   Will write the code to the file Lexer.java. 
*/
%class Lexer

/*
  The current line number can be accessed with the variable yyline
  and the current column number with the variable yycolumn.
*/
%line
%column
    
/* 
   Will switch to a CUP compatibility mode to interface with a CUP
   generated parser.
*/
%cup
   
/*
  Declarations
   
  Code between %{ and %}, both of which must be at the beginning of a
  line, will be copied letter to letter into the lexer class source.
  Here you declare member variables and functions that are used inside
  scanner actions.  
*/
%{   
    /* To create a new java_cup.runtime.Symbol with information about
       the current token, the token will have no value in this
       case. */
    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }
    
    /* Also creates a new java_cup.runtime.Symbol with information
       about the current token, but this object has a value. */
    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }
%}
   

/*
  Macro Declarations
  
  These declarations are regular expressions that will be used latter
  in the Lexical Rules Section.  
*/

Error =  "/*" [^*]
 //PalabrasReservada = "void"|"int"|"double"|"bool"|"string"|"class"|"interface"|"null"|"this"|"extends"|"implements"|"for"|"while"|"if"|"else"|"return"|"break"|"New"|"New Array"|"Print"|"ReadInteger"|"ReadLine"|"Malloc"
 Booleanas = ("true"|"false"|"TRUE"|"FALSE")
 Digito = [0-9]
 Numero = {Digito} {Digito}*
 Letra = [A-Za-z]
 Identificador = {Letra} ({Letra}|{Numero}|"_")*
 //Simbolo = "+"|"-"|"*"|"/"|"%"|"<"|"<="|">"|">="|"="|"=="|"!="|"&&"|"||"|"!"| ";"|","|"."|"["| "]"|"("|")"|"{"|"}"|"()"|"[]"|"{}" 
 Espacio = [\s]
 SaltoDeLinea = \n|\r|\r\n
 InputCharacter = [^\r\n]

 /*Comenatarios*/
 
 Comment = {TraditionalComment} | {EndOfLineComment} | 
          {DocumentationComment}
 TraditionalComment = "/*" [^*] ~"*/" | "/*" "*"+ "/"
 EndOfLineComment = "//" {InputCharacter}* {SaltoDeLinea}?
 DocumentationComment = "/*" "*"+ [^/*] ~"*/"
 
 


 /*Hexacedecimal*/
 HexIntegerLiteral = 0[xX][0-9a-fA-F]+


/*Constantes Double*/
 DoubleLiteral = ({FLit1}|{FLit3}) {Exponent}?
 FLit1    = [0-9]+ \. [0-9]* 

 FLit3    = [0-9]+ 
 Exponent = [eE] [+-]? [0-9]+

/*cadenas String*/

/*StringCharacter = [^\r\n\"\\]*/
StringCharacter = \"[^\"]([^\r\n\"\\])*\"
/*SingleCharacter = [^\r\n\'\\]*/

   
%%
/* ------------------------Lexical Rules Section---------------------- */
   
/*
   This section contains regular expressions and actions, i.e. Java
   code, that will be executed when the scanner matches the associated
   regular expression. */
   
{Error} {
 System.out.print(yytext());  return symbol(sym.error, new Integer(1));
}

//{PalabrasReservada} {
"void" { System.out.print(yytext());  return symbol(sym.VOID, new Integer(1));}
"int"  { System.out.print(yytext());  return symbol(sym.INT, new Integer(1));}
"double" { System.out.print(yytext());  return symbol(sym.DOUBLE, new Integer(1));}
"bool"   { System.out.print(yytext());  return symbol(sym.BOOL, new Integer(1));}
"string" { System.out.print(yytext());  return symbol(sym.STRING, new Integer(1));}
"class" { System.out.print(yytext());  return symbol(sym.CLASS, new Integer(1));}
"interface" { System.out.print(yytext());  return symbol(sym.INTERFACE, new Integer(1));}
"null"  { System.out.print(yytext());  return symbol(sym.NULL, new Integer(1));}
"this"  { System.out.print(yytext());  return symbol(sym.THIS, new Integer(1));}
"extends" { System.out.print(yytext());  return symbol(sym.EXTENDS, new Integer(1));}
"implements" { System.out.print(yytext());  return symbol(sym.IMPLEMENTS, new Integer(1));}
"for" { System.out.print(yytext());  return symbol(sym.FOR, new Integer(1));}
"while" { System.out.print(yytext());  return symbol(sym.WHILE, new Integer(1));}
"if" { System.out.print(yytext());  return symbol(sym.IF, new Integer(1));}
"else" { System.out.print(yytext());  return symbol(sym.ELSE, new Integer(1));}
"return" { System.out.print(yytext());  return symbol(sym.RETURN, new Integer(1));}
"break"  { System.out.print(yytext());  return symbol(sym.BREAK, new Integer(1));}
"New"  { System.out.print(yytext());  return symbol(sym.NEW, new Integer(1));}
"New Array" { System.out.print(yytext());  return symbol(sym.NEWARRAY, new Integer(1));}
"Print" { System.out.print(yytext());  return symbol(sym.PRINT, new Integer(1));}
"ReadInteger" { System.out.print(yytext());  return symbol(sym.READINTEGER, new Integer(1));}
"ReadLine" { System.out.print(yytext());  return symbol(sym.READLINE, new Integer(1));}
"Malloc" { System.out.print(yytext());  return symbol(sym.MALLOC, new Integer(1));}
"GetByte" { System.out.print(yytext());  return symbol(sym.GETBYTE, new Integer(1));}
"SetByte" { System.out.print(yytext());  return symbol(sym.SETBYTE, new Integer(1));}

 
{Espacio} {
 // Ignorar cuando se ingrese un espacio
}

//}

//{Simbolo} {
"+" { System.out.print(" + "); return symbol(sym.PLUS); }
"-" { System.out.print(" - "); return symbol(sym.MINUS); }
"*" { System.out.print(" * "); return symbol(sym.TIMES); }
"/" { System.out.print(yytext()); return symbol(sym.DIV); }
"%" { System.out.print(yytext()); return symbol(sym.MOD); }
"<" { System.out.print(yytext()); return symbol(sym.LESS); }
"<=" { System.out.print(yytext()); return symbol(sym.LESSEQ); }
">" { System.out.print(yytext()); return symbol(sym.GREATER); }
">=" { System.out.print(yytext()); return symbol(sym.GREATEREQ); }
"=" { System.out.print(yytext()); return symbol(sym.EQTO); } 
"==" { System.out.print(yytext()); return symbol(sym.EQTO); } 
"!=" { System.out.print(yytext()); return symbol(sym.NOTEQ); }
"&&" { System.out.print(yytext()); return symbol(sym.AMPERSONS); }
"||" { System.out.print(yytext()); return symbol(sym.OR); }
"!" { System.out.print(yytext()); return symbol(sym.EXCLAM); }
 ";" { System.out.print(yytext()); return symbol(sym.SEMI); }
"," { System.out.print(yytext()); return symbol(sym.COMMA); }
"." { System.out.print(yytext()); return symbol(sym.PERIOD); }
"[" { System.out.print(yytext()); return symbol(sym.LCOR); }
 "]" { System.out.print(yytext()); return symbol(sym.RCOR); }
"(" { System.out.print(yytext()); return symbol(sym.LPAR); }
")" { System.out.print(yytext()); return symbol(sym.RPAR); }
"{" { System.out.print(yytext()); return symbol(sym.LLLAV); }
"}" { System.out.print(yytext()); return symbol(sym.RLLAV); }
//"()" { System.out.print(yytext()); return symbol(sym.PARS); }
"[]" { System.out.print(yytext()); return symbol(sym.CORS); }
"{}" {}

//}
{Numero} {
System.out.print(yytext());
                         return symbol(sym.intConstant, new Integer(yytext())); 
}
{Booleanas} {
System.out.print(yytext());  return symbol(sym.boolConstant, new Integer(1));
}
{HexIntegerLiteral} {
System.out.print(yytext());  return symbol(sym.hexConstant, new Integer(1));
}

{DoubleLiteral} {
 System.out.print(yytext());  return symbol(sym.doubleConstant, new Integer(1));
}


 
{Espacio} {
 // Ignorar cuando se ingrese un espacio
}



{StringCharacter} {
 System.out.print(yytext());  return symbol(sym.stringConstant, new Integer(1));

}

/*{SingleCharacter} {

}*/



 
{Identificador} {
System.out.print(yytext());  return symbol(sym.IDENT, new Integer(1));
}


{Comment} {
 
}
{EndOfLineComment} {
 
}
{DocumentationComment} {
 
}


{SaltoDeLinea} {

}


/* No token was found for the input so through an error.  Print out an
   Illegal character message with the illegal character that was found. */
[^]                    { throw new Error("Caracter no Esperado <"+yytext()+">"); }