% Para abrir un archivo

% open(<Archivo fisico>, <Modo de apertura>, <Flujo>)

% <Modo de apertura>: 
% Puede ser alguno de los siguientes: read, write, append, update.

% La diferencia es que en write la info que se tenia antes en el archivo es borrada.
% Update no te elimina datos, pero te coloca el puntero del archivo de salida al inicio.

% <Flujo>: Es el nombre que se le dara dentro del programa.

% Para cerrar el archivo se utiliza close(<Flujo>)
% Cuando el archivo no existe con write este se crea vacio.

prueba_archivo :-
    open('miarchivo.txt', write, Archivo),
    close(Archivo).

leer_archivo :- 
    open('nombre.txt', read, DatosPers),
    write('El nombre almacenado es: '),
    read(DatosPers, Var),
    write(Var),
    close(DatosPers).

grabar_en_archivo :-
    write('Escriba su nombre: '),
    read(Nombre),
    open('nombre.txt', write, Datos),
    write(Datos, Nombre),
    close(Datos).

grabar_en_archivo2 :-
    writeln('Introduzca el nombre del archivo en disco: '),
    read(NombreArchivo),
    writeln('Introduzca el nombre del flujo: '),
    read(NombreFlujo),
    writeln('Introduzca el texto a grabar: '),
    read(Texto),
    open(NombreArchivo, write, NombreFlujo),
    write(NombreFlujo, Texto),
    close(NombreFlujo).
    
leer_archivo_vacio :-
    open('Archivovacio.txt', read, Flujo),
    read(Flujo, Dato),
    probar(Dato),
    close(Flujo).

probar(Dato) :-
    ==(Dato, end_of_file),
    writeln('Se ha llegado al final del archivo'),
    !.

probar(Dato) :-
    \==(Dato, end_of_file),
    writeln('Todavia hay datos por leer dentro del archivo').

leerDeArchivoNoVacio :-
    open('lista_numeros.txt', read, ListaNumeros),
    lectura(ListaNumeros),
    close(ListaNumeros).

lectura(Flujo) :-
    read(Flujo, Dato),
    probar2(Dato, Flujo).

probar2(Dato, Flujo) :-
    \==(Dato, end_of_file),
    write(Dato), nl,
    lectura(Flujo), !.

probar2(Dato, _) :-
    ==(Dato, end_of_file),
    writeln('Se agotaron los datos'),
    !.