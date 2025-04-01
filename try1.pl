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

chord_type(dur).
chord_type(moll).

ton_transpose(Ton, Semis, TransposedTon) :-
    ton_semi(Ton, N),
    (N1 #= N + Semis
        ; N1 #= N + Semis - 12),
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

root_chorddur(Root, ChordTones) :-
    ChordTones = [Root, ChordTone1, ChordTone2],
    length(ChordTones, 3),
    ton_transpose(Root, 4, ChordTone1),
    ton_transpose(Root, 7, ChordTone2).

root_chordmoll(Root, ChordTones) :-
    ChordTones = [Root, ChordTone1, ChordTone2],
    length(ChordTones, 3),
    ton_transpose(Root, 3, ChordTone1),
    ton_transpose(Root, 7, ChordTone2).

root_chord(Root, ChordTones, ChordType) :-
    chord_type(ChordType),
    ChordType = dur,
    root_chorddur(Root, ChordTones).

root_chord(Root, ChordTones, ChordType) :-
    chord_type(ChordType),
    ChordType = moll,
    root_chordmoll(Root, ChordTones).

root_chord_universal(Root, ChordTones, ChordType) :-
    chord_type(ChordType),
    permutation(ChordTones, ChordTonesPerm),
    root_chord(Root, ChordTonesPerm, ChordType).
    
% usage eg:
% harmonies([g, c, _], Root, Fourth, Fifth).
% root_chord(g, ChordTones, dur).
% root_chord_universal(Root, [c, e, Y], Type).