
// Clase que será utilizada para devolver los tokens
public class TokenPersonalizado {
 
    String _token;
    String _lexema;
    int _column;
    int _column_end;
    int _line;
   
    public String getLexema(){
      return this._lexema;
    }
   
    public String getToken(){
      return this._token;
    }
   
    TokenPersonalizado (String lexema, String token, int columna, int linea){
      this._lexema = lexema;
      this._token = token;
      this._column = columna + 1;
      this._column_end = columna + _lexema.length();
      this._line = linea +1;
    }
   
    public String toString(){
        if (_token == "Identificador" && _lexema.length() > 31 ) {
            _lexema = _lexema.substring(0, 31) +"\"";
            _token = "Identificador (Recortado)";
        }
        if (_token == "Error") {
            return "Comentario incompleto" +" at line "+this._line+";";
        }
        if (_token == "Constante Entera") {
            return "Lexema: " + this._lexema + " Token: " + this._token +" at line "+this._line+", "+"column "+this._column +"-" + this._column_end +"(Value = "+String.valueOf(Integer.parseInt(_lexema))+")" +";";
        }
        if ( _token == "Constante Double") {
            return "Lexema: " + this._lexema + " Token: " + this._token +" at line "+this._line+", "+"column "+this._column +"-" + this._column_end +"(Value = "+String.valueOf(Double.parseDouble(_lexema))+")" +";";

        }
        if (_token=="Constante Hex") {
            return "Lexema: " + this._lexema + " Token: " + this._token +" at line "+this._line+", "+"column "+this._column +"-" + this._column_end +"(Value = "+String.valueOf(_lexema)+")" +";";
            
        }
        if (_token == "Variable booleana") {
             return "Lexema: " + this._lexema + " Token: " + this._token +" at line "+this._line+", "+"column "+this._column +"-" + this._column_end +"(Value = "+String.valueOf(_lexema.toLowerCase())+")" +";";
           
        }
      return "Lexema: " + this._lexema + " Token: " + this._token +" at line "+this._line+", "+"column "+this._column +"-" + this._column_end   +";";
    }
  }