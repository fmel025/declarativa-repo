% Retornar la posicion de un elemento determinado de una lista
% Sino se encuentra determinar -1.

% Ejemplo mio
buscar_element(Elemento, [Elemento|_], Posicion, Resultado) :-
    Resultado is Posicion.

% Si el elemento no es el primer de la lista, se aumenta en uno la iteracion
% de la posicion y se continua buscando
buscar_element(Elemento, [_|Cola], Posicion, Resultado) :-
    Posicion1 is Posicion + 1,
    buscar_element(Elemento, Cola, Posicion1, Resultado).

% Sino se encuentra se retorna -1
buscar_element(_, [], _, _, -1) :- !.

% Ejemplo del inge
buscar_elemento(_, [], _, -1) :- !.
buscar_elemento(Elemento, [Cab|Col], Ini, Pos) :-
    \==(Elemento, Cab),
    Ini1 is Ini + 1,
    buscar_elemento(Elemento, Col, Ini1, Pos).

buscar_elemento(Elemento, [Cab|_], Ini, Ini) :-
    ==(Elemento, Cab).

% Sumar todos los valores de una lista
suma_lista([], 0) :- !.

suma_lista([Elemento|Resto], Resultado ) :-
    suma_lista(Resto, Resultado1),
    Resultado is Resultado1 + Elemento.

% Sumar todo los elementos menores o iguales que un determinado valor de la lista.
% Caso base:
suma_lista_menores([], _, 0) :- !.

% Si el valor es menor o igual al elemento se suma.
suma_lista_menores([Elemento|Resto], Valor, Resultado) :-
    Elemento =< Valor,
    suma_lista_menores(Resto, Valor, Resultado1),
    Resultado is Resultado1 + Elemento.

% Sino solo se continua.
suma_lista_menores([Elemento|Resto], Valor, Resultado) :-
    Elemento > Valor,
    suma_lista_menores(Resto, Valor, Resultado).

% Crear una lista con datos introducidos desde teclado. Terminar con t
crear_lista(Resultado) :-
    read(Valor),
    Valor \== t,
    crear_lista(Resultado1),
    % Se unen los resultados en una lista.
    Resultado = [Valor|Resultado1].