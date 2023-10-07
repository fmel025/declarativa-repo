mamifero(perro).
mamifero(gato).
mamifero(conejo).

% Ejemplo de madre

madre(blanca).
madre(carmen).

madre(blanca, aurora).
madre(blanca, amanda).
madre(blanca, elisa).

alguien(flori).
alguien(sasi).

% Derivada de una constante
derivada(x, C, 0) :-
    number(C), !.

% Derivada de x con la funcion x:
derivada(x, x, 1) :- !.

% Derivada de x a la N:
derivada(x, x^N, N*x^N1) :-
    number(N), N1 is N-1, !.

% Derivada de una constante por x:
derivada(x, C*x, C) :-
    number(C), !.

% Derivada de una funcion polinomial:
derivada(x, C*x^N, N2*x^N1) :-
    number(C), number(N), N1 is N-1, N2 is C*N, !.

% Derivada de la suma de dos funciones:
derivada(x, F1+F2, DF1+DF2) :-
    derivada(x, F1, DF1),
    derivada(x, F2, DF2), !.

% Derivada de la resta de dos funciones:
derivada(x, F1-F2, DF1-DF2) :-
    derivada(x, F1, DF1),
    derivada(x, F2, DF2), !.

% Derivada de un algoritmo natural de x:
derivada(x, ln(X), 1/X) :- !.

% Derivada de una constante elevada a la x:
derivada(x, C^X, C^X*ln(C)) :-
    number(C), !.

% Tarea, hacer la funcion de la raiz cuadrada

