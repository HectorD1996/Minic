/* Sección de declaraciones de JFlex */
%%
%line
%column
%public
%class AnalizadorLexico
%cup
%{
 
 /* Código personalizado */
 
 // Se agregó una propiedad para verificar si existen tokens pendientes
 private boolean _existenTokens = false;
 private boolean _existenErrores = false;
 public boolean existenTokens(){
 return this._existenTokens;
 }
public boolean existenError(){
 return this._existenErrores;
 }
 
%}
 
 /* Al utilizar esta instrucción, se le indica a JFlex que devuelva objetos del tipo TokenPersonalizado */
%type TokenPersonalizado
 
%init{
 /* Código que se ejecutará en el constructor de la clase */
%init}
 
%eof{
 
 /* Código a ejecutar al finalizar el análisis, en este caso cambiaremos el valor de una variable bandera */
 this._existenTokens = false;
 
%eof}
 
/* Inicio de Expresiones regulares */
 
 Error =  "/*" [^*]
 PalabrasReservada = "void"|"int"|"double"|"bool"|"string"|"class"|"interface"|"null"|"this"|"extends"|"implements"|"for"|"while"|"if"|"else"|"return"|"break"|"New"|"New Array"|"Print"|"ReadInteger"|"ReadLine"|"Malloc"
 Booleanas = ("true"|"false"|"TRUE"|"FALSE")
 Digito = [0-9]
 Numero = {Digito} {Digito}*
 Letra = [A-Za-z]
 Identificador = {Letra} ({Letra}|{Numero}|"_")*
Simbolo = "+"|"-"|"*"|"/"|"%"|"<"|"<="|">"|">="|"="|"=="|"!="|"&&"|"||"|"!"| ";"|","|"."|"["| "]"|"("|")"|"{"|"}"|"()"|"[]"|"{}" 
 Espacio = " "
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


 
/* Finaliza expresiones regulares */
 
%%
/* Finaliza la sección de declaraciones de JFlex */
 
/* Inicia sección de reglas */
 
// Cada regla está formada por una {expresión} espacio {código}

{Error} {
 TokenPersonalizado t = new TokenPersonalizado("comentario Incompleto", "Error", yycolumn, yyline);
 this._existenTokens = true;
 this._existenErrores = true;
 return t;
}

{PalabrasReservada} {
 TokenPersonalizado t = new TokenPersonalizado(yytext(), "Palabra Reservada", yycolumn, yyline);
 this._existenTokens = true;
 return t;
}
{Numero} {
 TokenPersonalizado t = new TokenPersonalizado(yytext(), "Constante Entera", yycolumn, yyline);
 this._existenTokens = true;
 return t;
}
{Booleanas} {
 TokenPersonalizado t = new TokenPersonalizado(yytext(), "Variable booleana", yycolumn, yyline);
 this._existenTokens = true;
 return t;
}
{HexIntegerLiteral} {
 TokenPersonalizado t = new TokenPersonalizado(yytext(), "Constante Hex", yycolumn, yyline);
 this._existenTokens = true;
 return t;
}

{DoubleLiteral} {
 TokenPersonalizado t = new TokenPersonalizado(yytext(), "Constante Double", yycolumn, yyline);
 this._existenTokens = true;
 return t;
}

{Simbolo} {
 TokenPersonalizado t = new TokenPersonalizado(yytext(), "Simbolo/Operador", yycolumn, yyline);
 this._existenTokens = true;
 return t;
}
 
{Espacio} {
 // Ignorar cuando se ingrese un espacio
}



{StringCharacter} {
 TokenPersonalizado t = new TokenPersonalizado(yytext(), "Cadena String", yycolumn, yyline);
 this._existenTokens = true;
 return t;
}

/*{SingleCharacter} {
 TokenPersonalizado t = new TokenPersonalizado(yytext(), "CHARACTER Char", yycolumn, yyline);
 this._existenTokens = true;
 return t;
}*/



 
{Identificador} {
 TokenPersonalizado t = new TokenPersonalizado(yytext(), "Identificador", yycolumn, yyline);
 this._existenTokens = true;
 return t;
}


{Comment} {
 
}
{EndOfLineComment} {
 
}
{DocumentationComment} {
 
}


{SaltoDeLinea} {
 /*TokenPersonalizado t = new TokenPersonalizado("Enter", "NUEVA_LINEA");
 this._existenTokens = true;
 return t;*/
}
/* error fallback */
[^] { 

 TokenPersonalizado t = new TokenPersonalizado(yytext(), "Unrecognized char: " + yytext(), yycolumn, yyline);
 this._existenTokens = true;
 
 return t; 
 
 }
