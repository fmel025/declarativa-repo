% Eliminar la cabeza de la lista:
eliminarCabeza([_|Cola],Cola).

% Eliminar un elemento determinado de la lista:

% Casos base
eliminarElemento(_,[],[]) :- !.
eliminarElemento(Elemento,[Elemento|Cola],Cola) :- !.

% Casos recursivos
eliminarElemento(Elemento,[Cabeza|Cola],[Cabeza|Cola2]):-
    eliminarElemento(Elemento,Cola,Cola2).

% Eliminar todos los elementos que coincidan un elemento determinado dentro de una lista.

% Casos base
eliminarTodosElementos(_,[],[]) :- !.

eliminarTodosElementos(Elemento,[Elemento|Cola],Cola2) :-
    eliminarTodosElementos(Elemento,Cola,Cola2),!.

% Casos recursivos
eliminarTodosElementos(Elemento,[Cabeza|Cola],[Cabeza|Cola2]) :-
    eliminarTodosElementos(Elemento,Cola,Cola2).
