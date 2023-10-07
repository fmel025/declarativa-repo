%Ejercicio 1,2,3,4 xd. 
% Derivada de una constante es 0:
d(_, C, 0) :- number(C).

% Derivada de Var respecto a sí misma es 1:
d(Var, Var, 1) :- !.

% Derivada de Var a la N:
d(Var, Var^N, N*Var^N1) :- number(N), N1 is N-1, !.

% Derivada de una constante por Var es la constante:
d(Var, C*Var, C) :- number(C), !.

% Derivada de una constante por Var elevada a la N:
d(Var, C*Var^N, N2*Var^N1) :- number(N), number(C), N1 is N-1, N2 is C*N, !.

% Derivada de la suma de dos funciones:
d(Var, A + B, A1 + B1) :- d(Var, A, A1), d(Var, B, B1), !.

% Derivada de la resta de dos funciones:
d(Var, A - B, A1 - B1) :- d(Var, A, A1), d(Var, B, B1), !.

% Derivada de una constante elevada a Var: a^Var * ln(a)
d(Var, C^Var, C^Var * log(C)) :- number(C), !.

% Derivada del logaritmo natural: 1/Var
d(Var, ln(Var), 1/Var) :- !.

% Derivada de Var a la N, evaluando puntos |N| > 1:
d(_, X^N, N*X^N1) :- number(N), N1 is N-1, !.

% Derivada de una constante por Var elevada a la N, evaluando puntos |N| > 1:
d(_, C*X^N, N2*X^N1) :- number(N), number(C), N1 is N-1, N2 is C*N, !.

% Realizar consulta así, donde Var es la variable de derivación:
% d(x, 2*x^2, R).


% Regla para calcular la derivada de una función
derivar(Var,F) :- 
    d(Var, F, F_Derivada),
    assertz((funcion_original(F) :- F)),
    assertz((funcion_derivada(F_Derivada) :- F_Derivada)).


% Ejercicio 5 newton_raphson
fun_original(X, Y) :- Y is X^2 - 2.
fun_derivada(X, Y) :- Y is 2*X.

% Implementar el método de Newton-Raphson.
newton_raphson(Xi, Tolerancia, Resp) :-
    fun_original(Xi, Fxi),
    fun_derivada(Xi, Fxideriv),
    Xsig is Xi - Fxi / Fxideriv,
    (abs(Xsig - Xi) =< Tolerancia ->
        Resp is Xsig ; 
        newton_raphson(Xsig, Tolerancia, Resp) ).

% Consulta: main. 
main :-
    Xi = 5.0,  
    Tolerancia = 0.0001,  
    newton_raphson(Xi, Tolerancia, Resp),
    format("La raiz aproximada es: ", [Resp]). % format es como printf en C 