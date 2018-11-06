minOfTwo(X, Y, Y) :- X >= Y.
minOfTwo(X, Y, X) :- X < Y.

minList([], 0).
minList([H], H).
minList([H|T], R) :- minList(T, R2), minOfTwo(H, R2, R).

% Counts the number of times Element appears in List
% noElems(List, Element, Result)
% noElems(i, i, o)
noElems([], _, 0).
noElems([H|T], E, R) :- H =\= E, noElems(T, E, R).
noElems([H|T], E, R) :- H =:= E, noElems(T, E, R2), R is R2 + 1.


% [2, 3, 4, 2] -> [2, 3, 4]
makeSet([], []).
makeSet([H|T], R) :- noElems([H|T], H, HCNT), HCNT > 1, makeSet(T, R).
makeSet([H|T], R) :- noElems([H|T], H, HCNT), HCNT =:= 1, makeSet(T, R2), R = [H|R2].

% same as remove max val
removeEl([], _, []).
removeEl([H|T], E, R) :- H =:= E, removeEl(T, E, R).
removeEl([H|T], E, R) :- H =\= E, removeEl(T, E, R2), R = [H|R2].

% this already removes duplicates without needing to call pointA
% (because removeEl removes all occurences of an element in a list)
sortInc([], []).
sortInc([H|T], R) :- minList([H|T], MINEL), removeEl([H|T], MINEL, NEWLST), sortInc(NEWLST, R2), R = [MINEL|R2].

%  [1, 2, [4, 1, 4], 3, 6, [7, 10, 1, 3, 9], 5, [1, 1, 1], 7]
pointB([], []).
pointB([H|T], R) :- is_list(H), sortInc(H, R2), pointB(T, R3), R = [R2|R3].
pointB([H|T], R) :- write(1), pointB(T, R2), R = [H|R2].