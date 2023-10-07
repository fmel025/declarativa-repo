
% Make a list from a range of numbers
make_list_from_range(CurrentValue, Last, List) :-
    make_list_aux(CurrentValue, Last, [], List).

% Base case
make_list_aux(Last, Last, ListAux, List) :-
    reverse([Last | ListAux], List),
    !.

% Recursive case
make_list_aux(CurrentValue, Last, ListAux, List) :-
    NextValue is CurrentValue + 1,
    make_list_aux(NextValue, Last, [CurrentValue | ListAux], List).


% Make a list from a range of numbers in inverse order
make_list_inv(CurrentValue, Last, List) :-
    make_list_aux_inv(CurrentValue, Last, [], List).

% Base case
make_list_aux_inv(Last, Last, ListAux, [Last | ListAux]) :- !.

% Recursive case
make_list_aux_inv(CurrentValue, Last, ListAux, List) :-
    NextValue is CurrentValue + 1,
    make_list_aux_inv(NextValue, Last, [CurrentValue | ListAux], List).