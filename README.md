# Prolog Transposer

Prolog (CLPFD) helpers for music theory: transpose notes by semitones, find fourths/fifths, and build major (`dur`) and minor (`moll`) triads from a root.

## Examples

```prolog
?- ton_transpose(c, 7, T).        % transpose C up a fifth
T = g.

?- root_chord(c, ChordTones, dur).  % C major triad
ChordTones = [c, e, g].
```

Tested with Scryer Prolog.
