:- use_module(library(clpfd)).

ton_semi(c, 0).
ton_semi(cis, 1).
ton_semi(d, 2).
ton_semi(dis, 3).
ton_semi(e, 4).
ton_semi(f, 5).
ton_semi(fis, 6).
ton_semi(g, 7).
ton_semi(gis, 8).
ton_semi(a, 9).
ton_semi(ais, 10).
ton_semi(b, 11). 

ton_transpose(Ton, Semis, TransposedTon) :-
    ton_semi(Ton, N),
    (N1 #= N + Semis
        ; N1 #= N + Semis - 12),
        N1 in 0..11,
    ton_semi(TransposedTon, N1).

ton_fourth(Ton, Fourth) :-
    ton_transpose(Ton, 5, Fourth).

ton_fifth(Ton, Fifth) :-
    ton_transpose(Ton, 7, Fifth).

root_harmony(Root, Fourth, Fifth) :-
    ton_fourth(Root, Fourth),
    ton_fifth(Root, Fifth).

harmonies(Tones, Root, Fourth, Fifth) :-
    length(Tones, 3),
    permutation([Root, Fourth, Fifth], Tones),
    root_harmony(Root, Fourth, Fifth).
