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

ton_semi(Name, N) :-
    N #> 11,
    N1 #= N - 12,
    ton_semi(Name, N1).

ton_semi(Name, N) :-
    N #< 0,
    N1 #= N + 12,
    ton_semi(Name, N1).

ton_transpose(Ton, Semis, TransposedTon) :-
    ton_semi(Ton, N),
    N1 #= N + Semis,
    ton_semi(TransposedTon, N1).

root_harmony(Root, Fourth, Fifth) :-
    ton_semi(Root, N),
    FourthNumber #= N + 5,
    FifthNumber #= N + 7,
    [N, FourthNumber, FifthNumber] ins 0..11,
    ton_semi(Fourth, FourthNumber),
    ton_semi(Fifth, FifthNumber).

harmonies(Tones, Root, Fourth, Fifth) :-
    length(Tones, 3),
    Tones = [A, B, C],
    root_harmony(Root, Fourth, Fifth),
    (
        Fifth = A,
        Fourth = B,
        Root = C
    ;
        Fifth = B,
        Fourth = C,
        Root = A
    ;
        Fifth = C,
        Fourth = A,
        Root = B
    ;
        Fifth = A,
        Fourth = C,
        Root = B
    ;
        Fifth = B,
        Fourth = A,
        Root = C
    ;
        Fifth = C,
        Fourth = B,
        Root = A
    ).
