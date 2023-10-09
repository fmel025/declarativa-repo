% Recorrer un arbol binario de busqueda en orden, preorden y postorden.
% Tomando en cuenta que el nodo es el dato de en medio y el izquierdo
% y derecho son sus hijos.

% In order
mostrarIn([]) :- !.

mostrarIn([SubI, Dato, SubD]) :-
    mostrarIn(SubI),
    write(Dato), write(" "),
    mostrarIn(SubD).


% Preorder
mostrarPre([]) :- !.

mostrarPre([SubI, Dato, SubD]) :-
    write(Dato), write(" "),
    mostrarPre(SubI),
    mostrarPre(SubD).

% Postorder
mostrarPost([]) :- !.

mostrarPost([SubI, Dato, SubD]) :-
    mostrarPost(SubI),
    mostrarPost(SubD),
    write(Dato), write(" ").

% Elabore un programa que, dado un numero y un arbol binario de busqueda, realice la busqueda de dicho numero en el arbol.

buscar(_, []) :- !, fail.

buscar(Num, [_, Num, _]) :- !.

buscar(Num, [SubI, Dato, _]) :-
    Num < Dato, !,
    buscar(Num, SubI).

buscar(Num, [_, Dato, SubD]) :-
    Num > Dato, !,
    buscar(Num, SubD).

% Calcular la altura de un arbol binario de busqueda.
altura([], 0) :- !.

altura([SubI, _, SubD], Altura) :-
    altura(SubI, AlturaI),
    altura(SubD, AlturaD),
    Altura is max(AlturaI, AlturaD) + 1.

% Tareas:
% Insertar nuevo dato en un arbol binario, no se permiten repetidos

% Caso base: El arbol estaba vacio o no habian nodos ahi
insertar(Num, [], [ [], Num, [] ]) :- !.

% Caso donde el numero es igual al dato del nodo actual
insertar(Num, [SubI, Num, SubD], [SubI, Num, SubD]) :- !.

% Caso 1: El numero es menor que el dato del nodo actual
% SubI es el arbol izquierdo del nodo actual
% SubD es el arbol derecho del nodo actual
insertar(Num, [SubI, Dato, SubD], [SubINuevo, Dato, SubD]) :-
    Num < Dato, !,
    insertar(Num, SubI, SubINuevo).

% Caso 2: El numero es mayor que el dato del nodo actual
insertar(Num, [SubI, Dato, SubD], [SubI, Dato, SubDNuevo]) :-
    Num > Dato, !,
    insertar(Num, SubD, SubDNuevo).

pruebaInsert :-
    Arbol = [],
    insertar(5, Arbol, Arbol1),
    insertar(3, Arbol1, Arbol2),
    insertar(7, Arbol2, Arbol3),
    insertar(2, Arbol3, Arbol4),
    insertar(4, Arbol4, Arbol5),
    insertar(6, Arbol5, Arbol6),
    mostrarPre(Arbol6), nl.

% Eliminar un nodo hoja en un arbol binario
% Los nodos hoja no tienen hijos.

% Si la lista esta vacia, sigue asi
eliminar(Num, [], []) :- !.

% Caso donde el elemento es una raiz y una hoja
eliminar(Num, [ [], Num, [] ], []) :- !.

% Caso donde el elemento a eliminar es menor que la raiz
eliminar(Num, [SubI, Dato, SubD], [SubINuevo, Dato, SubD]) :-
    Num =< Dato, !,
    eliminar(Num, SubI, SubINuevo).

% Caso donde el elemento a eliminar es mayor que la raiz
eliminar(Num, [SubI, Dato, SubD], [SubI, Dato, SubDNuevo]) :-
    Num > Dato, !,
    eliminar(Num, SubD, SubDNuevo).

pruebaEliminar :-
    % Crear un árbol
    Arbol = [ [ [], 1, [] ], 3, [ [], 5, [] ] ],
    % Mostrar el árbol en orden
    mostrarPre(Arbol), nl,
    eliminar(1, Arbol, ArbolNuevo),
    mostrarPre(ArbolNuevo), nl.

% Eliminar un nodo cualquier de un abb sin considerar repeticion

