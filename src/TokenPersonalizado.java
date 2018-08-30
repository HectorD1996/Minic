
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
        if (_token == "Cadena String (recortada)" && _lexema.length() > 36 ) {
            _lexema = _lexema.substring(0, 36) +"\"";
        }
        if (_token == "Error") {
            return "Comentario incompleto" +" at line "+this._line+";";
        }
      return "Lexema: " + this._lexema + " Token: " + this._token +" at line "+this._line+", "+"column "+this._column +"-" + this._column_end   +";";
    }
  }