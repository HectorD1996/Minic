# Minic
Fase 1 Proyecto Compiladores Hector Davila

Proyecto de Java Creado en Netbeans con ayuda de Jflex

Para operar el programa una vez corrar el ejecutable pedira por medio de la Consola el ingresar la dirreccion de archivo de 
entrada (sin comillas), entonces mostrara en pantalla el reusltado del analisis y creara un archivo de salida con los mismo resultados
en la mism dirrecion que el archivo original con .out agregado como extension.

Funcionmiento

El programa utiliza un archvio Jflex para la creacion AnalisisLexico que es en conjunto con otras 2 clases un el analisador completo
el programa analisa pór emdio de expresiones regulares lo que se encuentra en al archivo de entrda, leyendo el arrchivo enviandolo a la clase Analisador lexico que crea varibles en la clase TokenPersonalisado para asi poder escribir la informacion de cada lexema y token encontrado estos se imprimen en pantalla y se continua el proceso hasta que la clase analizadorlexico indica que termino, despues se imprime los resultados en una archivo de salida


Errorres

AL encontrar un carcter no identificado lo informra de la mismo forma que un carcater dando a entender que no pertence a lo establecio al no estar de acuerdo con ninguna expersion reular establecida y se dara su columna y linea

Al encontrar u error de comentario incompleto de mostrar en patalla que el problema existe y se imprimira tambien el archivo de salida que un comentatio sin finalizacion sucedio.
