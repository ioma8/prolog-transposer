:- use_module(library(clpfd)).

ton(c, 0).
ton(cis, 1).
ton(d, 2).
ton(dis, 3).
ton(e, 4).
ton(f, 5).
ton(fis, 6).
ton(g, 7).
ton(gis, 8).
ton(a, 9).
ton(ais, 10).
ton(b, 11).

ton(Name, N) :-
    N #> 11,
    N1 #= N - 12,
    ton(Name, N1).

ton(Name, N) :-
    N #< 0,
    N1 #= N + 12,
    ton(Name, N1).