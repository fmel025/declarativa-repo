% Delete a leaf node
delete_node([[], X, []], X, []) :- !.

% Delete a node with only a left child
delete_node([[L, X, R], Y, []], Y, [L, X, R]) :- !.

% Delete a node with only a right child
delete_node([[], Y, [L, X, R]], Y, [L, X, R]) :- !.

% Delete a node with two children
delete_node([L, X, R], X, [L1, Y, R]) :-
    in_order_predecessor(R, Y),  % Find the in-order predecessor of X in R
    delete_node(R, Y, R1),       % Delete Y from R
    delete_node(L, X, L1).       % Delete X from L

% Recursive case for deleting in left subtree
delete_node([L, X, R], Y, [L1, X, R]) :-
    Y < X,
    delete_node(L, Y, L1).

% Recursive case for deleting in right subtree
delete_node([L, X, R], Y, [L, X, R1]) :-
    Y > X,
    delete_node(R, Y, R1).

% Helper: Find in-order predecessor (rightmost node of left subtree)
in_order_predecessor([L, X, []], X) :- !.
in_order_predecessor([_, _, R], X) :- in_order_predecessor(R, X).
