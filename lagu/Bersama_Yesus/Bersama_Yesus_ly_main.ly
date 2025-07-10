\version "2.25.26"
% -*- master: Bersama_Yesus.ly;

%% VARIABLES
EngraveNotAngka = ##t
EngraveNotBalok = ##f
StandardStaffSize = #20
SolmisasiStaffSize = #20
TwoVoicesPerStaff = ##f
AlwaysShortInstrumentName = ##t
UnfoldBarNumbers = ##f

Global = {
  #(if (not is-svg?) #{ \disallowPageBreak #})
  \disallowLineBreak
  \omit Score.TimeSignature
  \omit Score.KeySignature
  \once\omit Score.BarNumber
  \override Score.SystemStartBar.collapse-height = #5
  \numericTimeSignature
  \key d \major
  \once\omit Score.MetronomeMark \tempo 4=112
  \set Score.currentBarNumber = 0
  \override Score.TupletBracket.Y-offset = #1.5
  \override Score.TupletBracket.extra-offset = #'(0 . -0.2)
  \override Score.TupletNumber.extra-offset = #'(0 . -0.1)
  \override Score.TupletBracket.bracket-visibility = #'if-no-beam
  \override Score.Parentheses.font-size = #-1
  \override Score.Parentheses.padding = #0
}

IntroInstrumentName = ""
IntroShortInstrumentName = ""
IntroMusic = {
  \clef "treble"
  \numericTimeSignature
  \key d \major
  \time 2/4
  \set Score.currentBarNumber = 0
  \temporary\override Beam.extra-offset = #'(0 . 0.5)
  s2
  \bar ""
  \omit Score.SegnoMark
  \omit Score.CodaMark
  \repeat segno 2 {
    \once\omit Score.BarNumber
    \tweak extra-offset #'(0 . 0.5)\mark \markup\smaller\smaller\bold\caps { Intro dan Interlude }
    \set Score.currentBarNumber = 0
    r8[ a'8 a'8 a'8 |
    \time 4/4
    a'4 r4 r8[ a'8 a'8 a'8 | % 1
    b'4 r4 r8[ b'8 b'8 b'8 | % 2
    cis''4 cis''8 cis''8 d''4 dis''4 | % 3
    e''4 a''4\break

    % Verse
    \set Score.rehearsalMark = #1
    \mark\default
    s2 s1*4 s2 \break
    s2 s1*4 s2 \break
    s2 s1*4 \break
    s1*2 s4 \bar "!"

    % Bridge
    \mark\default
    s2.s1*3 \pageBreak
    s1*3
    s1 s2 \bar "!"

    % Chorus
    \mark\default
    s2 \break
    \repeat volta 2 {
      s1*4 #(if is-svg? #{ \break #})
      s1 #(if (not is-svg?) #{ \break #})
      \alternative {
        \volta 1 { s1*3 #(if is-svg? #{ \break #}) }
        \volta 2 { s1 }
      }
    }
    s1
    s2
    #(if (not is-svg?)
         #{ \textEndMark \markup\italic "D.C. Al Fine" #})
    \bar "||"
    \once \set Score.dalSegnoTextFormatter =
    #(lambda (context repeat-count markups)
       #{ \markup \null #})
    \break
  }
  s2 |
  s1*3
  %\set Score.proportionalNotationDuration = #1/2
  \after 2..
  \tweak extra-offset #'(4.25 . -10)\textEndMark \markup \with-dimensions-from\null
  \override #'(box-padding . 0.5) \box
  \override #'(baseline-skip . 2.3) \center-column \smaller {
    \caps\bold "Outro Musik"
    "3 Birama"
  } s1
  %s1*2 s2. \bar "|."
  \fine
}

SopranoMusic = {
  \clef "treble"
  \numericTimeSignature
  \key d \major
  \time 2/4
  s2
  \repeat segno 2 {
    s2
    \time 4/4
    s1*3
    s2

    % Verse
    \temporary\override Beam.extra-offset = #'(0 . 0.5)
    r8[ -\dynamicText "cf" a'8 a'8 a'8
    a'2 a'4 b'8 ( a'8 )  % 5
    a'4 r4 r8[ fis'8 fis'8 g'8  % 6
    a'2 g'4 fis'8 fis'8 (  % 7
    e'4 ) r4 r8[ g'8 g'8 g'8  % 8
    g'2 \tuplet 3/2 { e'4 a'4 g'4 }  % 9
    g'4 r4 r8[ cis''8 cis''8 cis''8  % 10
    cis''4 ( b'4 ) a'8 g'8 ( a'8 ) a'8 ( % 11
    a'4) r2.  % 12
    r4 a'8 a'8 a'4 r4  % 13
    \tuplet 3/2 { a'4 b'4 a'4 } a'4 r4  % 14
    r8 fis'8 fis'8 a'8 b'4 r4  % 15
    cis''8 b'4 a'4. r4  % 16
    r4 g'8 a'8 b'4. d''8  % 17
    cis''8 b'4 a'4 r8 a'8 a'8  % 18
    a'4 g'4 fis'4 e'4  % 19
    d'2. r4  % 20
    r4

    % Bridge
    a'4-\tweak extra-offset #'(-1.5 . -2.5) -\dynamicText "cf" a'4 a'4
    g'4. ( a'8 )   a'2  % 22
    r4 a'8 a'8 b'4 a'4  % 23
    a'4 ( fis'2. )  % 24
    R1  % 25
    cis''4. d''8 cis''4 b'4  % 26
    a'4 a'8 g'8 fis'4
    e'4  % 27
    d'1  % 28
    r4 r4-\tweak extra-offset #'(3 . -2.5) -\dynamicText "cf"

    % Chorus
    r8 d''8 d''8 d''8
    % repeat
    \repeat volta 2 {
      d''4 r4 d''8 e''4 d''8  % 30
      d''4 r4 r8 b'8 b'8 cis''8  % 31
      \slurDashed d''8 ( \slurSolid d''8 ) d''4 cis''4 b'4  % 32
      a'2 r8
      a'8
      -\tweak self-alignment-X #CENTER
      -\tweak extra-offset #'(-0.7 . -3.65)
      ^\markup\with-dimensions-from\null {
        \concat {
          \larger ( \hspace #1 \larger )
        }
      }
      a'8 a'8  % 33
      cis''4 cis''4 cis''4 d''4
      \alternative {
        % volta 1
        \volta 1 {
          cis''2 r4 cis''8 d''8  % 35
          cis''4 b'4 a'4 b'4  % 36
          a'2 r8 d''8 d''8 d''8
        }
        % volta 2
        \volta 2 {
          cis''2 r8 cis''8 cis''8 b'8
        }
      }
    }
    a'4. fis'8 g'4 e'4
    d'2
  }

  r4 a'8 a'8 | % 45
  cis''4 cis''4 cis''4 d''4 | % 46
  cis''2 r8 cis''8 cis''8 b'8 | % 47
  a'4. -\< a'8 b'4   cis''4 <> \! | % 48
  d''1
  % R1*2 r2.
  \fine
}

AltoMusic = {
  \clef "treble"
  \numericTimeSignature
  \key d \major
  \time 2/4
  s2
  \repeat segno 2 {
    s2
    \time 4/4
    s1*3
    s2

    % Verse
    \temporary\override Beam.extra-offset = #'(0 . 0.5)
    r8[ a'8 a'8 g'8 \spanBarOff % 4
    fis'2 fis'4 g'8 ( fis'8 ) | % 5
    fis'4 r4 r8 d'8 d'8 e'8 | % 6
    fis'2 e'4 d'8 d'8 ( | % 7
    cis'4 ) r4 r8 e'8 e'8 e'8 \spanBarOn | % 8
    e'2 \tuplet 3/2 { cis'4 fis'4 e'4 } \spanBarOff | % 9
    e'4 r4 r8[ a'8 a'8 a'8 | % 10
    a'4 ( g'4 ) fis'8 e'8
    ( fis'8 ) fis'8 ( | % 11
    fis'4) r4 r2 \spanBarOn | % 12
    r4 fis'8 fis'8 fis'4 r4 \spanBarOff | % 13
    \tuplet 3/2 { fis'4 g' fis' } fis'4 r4 \spanBarOn | % 14
    r8 d'8 e'8 fis'8 g'4 r4 | % 15
    e'8 d'4 cis'4. r4 | % 16
    r4 e'8 fis'8 g'4. d'8 \spanBarOff | % 17
    e'8 d'4 cis'4 r8 cis'8 d'8 \spanBarOn | % 18
    e'4 d'4 cis'4 cis'4 \spanBarOff | % 19
    d'2. r4 \spanBarOn | % 20
    r4 fis'4 fis'4 fis'4  |

    % Bridge
    e'4. ( d'8 ) cis'2  % 22
    r4 e'8 fis'8 g'4 e'4 \spanBarOff  % 23
    fis'4 ( d'2. ) \spanBarOn % 24
    R1  % 25
    e'4. fis'8 e'4 d'4 \spanBarOff % 26
    cis'4 cis'8 cis'8 d'4
    cis'4  % 27
    d'1 \spanBarOn  % 28
    r2

    % Chorus
    r8 fis'8 fis'8 fis'8
    % repeat
    \repeat volta 2 {
      g'4 r4 g'8 g'4 g'8 \spanBarOff % 30
      g'4 r4 r8 g'8 g'8 a'8  % 31
      \slurDashed g'8 ( \slurSolid g'8 )     g'4 a'4 g'4  % 32
      fis'2 r8
      fis'8
      -\tweak self-alignment-X #CENTER
      -\tweak extra-offset #'(-0.7 . -3.65)
      ^\markup\with-dimensions-from\null {
        \concat {
          \larger ( \hspace #1 \larger )
        }
      }
      fis'8 g'8  % 33
      a'4 a'4 a'4 gis'4 \spanBarOn
      \alternative {
        % volta 1
        \volta 1 {
          g'!2 r4 a'8 gis'8 \spanBarOff % 35
          g'!4 g'4 fis' g'4  % 36
          fis'2 r8 fis'8 fis'8 fis'8 \spanBarOn
        }
        % volta 2
        \volta 2 {
          a'2 r8 a'8 a'8 gis'8 \spanBarOff
        }
      }
    }
    % out repeat
    g'!4. fis'8 e'4 cis'4  % 39
    d'2 \spanBarOn
  }

  r4 fis'8 g'8 \spanBarOff | % 45
  a'4 a'4 a'4 gis'4 | % 46
  g'!2 r8 a'8 a'8 gis'8
  | % 47
  g'!4.a'8 b'4 a'4
  -\tweak extra-offset #'(1.5 . -2.85)
  ^\markup\with-dimensions-from\null {
    \combine
    \draw-line #'(3.1 . 1.5)
    \draw-line #'(3.1 . -1.5)
  } | % 48
  <fis' a'>1 \spanBarOn | % 49
  % R1*2 r2.
  \fine
}

TenorMusic = {
  \clef "treble_8"
  \numericTimeSignature
  \key d \major
  \time 2/4
  s2
  \repeat segno 2 {
    s2
    \time 4/4
    s1*3
    s2

    % Verse
    \temporary\override Beam.extra-offset = #'(0 . 0.5)
    r2
    r8 a8 a8 a8 a4 r4 | % 5
    a4 b8 ( a8 ) a4 r4 | % 6
    r8 a8 a8 a8 b4 r4 | % 7
    a8 a8 g8 ( fis8 ) e4 r4 | % 8
    r8 g8 g8 g8 g4 r4 | % 9
    \tuplet 3/2 { g4 a4 g4 } g4 r4 | % 10
    cis'8 cis'8 b4 a8 g8 ( a8 ) a8 ( | % 11
    a4) r4 r4 a8-\tweak extra-offset #'(-2 . -1.5) -\dynamicText "cf" a8 | % 12
    a2 \tuplet 3/2 { a4 b4 a4 }| % 13
    a4 r4 r8 fis8 fis8 g8 | % 14
    a4 a8 a8 g8 fis4 fis8 ( | % 15
    e4 ) r4 r4 g8 g8 | % 16
    g2 \tuplet 3/2 { g4 a g } | % 17
    g4 r4 r4 a8 a8 | % 18
    a4 g4 fis4 e4 | % 19
    d2. r4  % 20
    r4

    r2.
    r4 cis8 e8 g4 d'4  % 22
    cis'2. r4  % 23
    r4 a8 a8 a4 a4  % 24
    fis4 a4-\tweak extra-offset #'(-1.5 . -2.5)-\dynamicText "cf" a4 a4  % 25
    g4. ( a8 ) a2  % 26
    r4 a8 g8 fis4 e4  % 27
    d1  % m28
    r2

    r8 a8 a8 a8
    \repeat volta 2 {
      b4 r4 b8 b4 a8 | % 30
      b4 r4 r8 d'8 d'8 cis'8 | % 31
      \slurDashed b8 ( \slurSolid b8 ) b4 e'4 d'4 | % 32
      d'2 r8
      d'8
      -\tweak self-alignment-X #CENTER
      -\tweak extra-offset #'(-0.7 . -3.65)
      ^\markup\with-dimensions-from\null {
        \concat {
          \larger ( \hspace #1 \larger )
        }
      }
      d'8 d'8 | % 33
      e'4 e'4 e'4 d'4
      \alternative {
        {
          e'2 r4 cis'8 d'8 | % 35
          e'4 d'4 cis'4 e'4 | % 36
          d'2 r8 a8 a8 a8
        }
        {
          e'2 r8 e'8 e'8 d'8
        }
      }
    }
    | % 38
    cis'4. a8 b4 g4 | % 39
    fis2
  }

  r4 d'8 d'8 | % 45
  e'4 e'4 e'4 d'4
  | % 46
  e'2 r8 e'8 e'8   d'8 | % 47
  cis'4.-\< a8 b4   cis'4
  -\tweak extra-offset #'(1.5 . -2.85)
  ^\markup\with-dimensions-from\null {
    \combine
    \draw-line #'(3.1 . 1.5)
    \draw-line #'(3.1 . -1.5)
  } <>\! | % 48
  <a d'>1
  % R1*2 r2.
  \fine
}

BassMusic = {
  \clef "bass"
  \numericTimeSignature
  \key d \major
  \time 2/4
  s2
  \repeat segno 2 {
    s2
    \time 4/4
    s1*3
    s2

    % Verse
    \temporary\override Beam.extra-offset = #'(0 . 0.5)
    r2
    r8 d8  d8 d8 d4 r4 | % 5
    fis4 e4 d4 r4 | % 6
    r8 d8 e8 fis8 e4 r4 | % 7
    e8 d8 cis8 ( b,8 ) a,4 r4 | % 8
    r8 e8 e8 e8 e4 r4 | % 9
    \tuplet 3/2 { e4 cis4 b4 } a,4 r4 | % 10
    a8 a8 g4 fis8 e8 ( d8 ) d8 ( | % 11
    d4) r4 r4 fis8 fis8 | % 12
    fis2 \tuplet 3/2 { fis4 g4 fis4 } | % 13
    fis4 r4 r8 d8 d8 e8 | % 14
    fis4 fis8 fis8   e8 d4 d8 ( | % 15
    cis4 ) r4 r4 e8 e8 | % 16
    e2 \tuplet 3/2 { e4 fis e } | % 17
    e4 r4 r4 e8 d8 | % 18
    cis4 b,4 a,4 a,4 | % 19
    d2. r4 | % 20
    r4

    r2.
    r4 a,8 cis8 e4 b4  % 22
    a2. r4  % 23
    r4 fis8 fis8 fis4 e4  % 24
    d4 d4 d4 d4  % 25
    a,4. ( b,8 ) cis2  % 26
    r4 a,8 a,8 a,4 a,4  % 27
    d1  % 28
    r2

    r8 d8 e8 fis8
    % repeat
    \repeat volta 2 {
      g4 r4 d8 d4     d8 | % 30
      g4 r4 r8 b8 b8 a8 | % 31
      \slurDashed g8 ( \slurSolid g8 ) g4 a4 a,4 | % 32
      d2 r8
      d8
      -\tweak self-alignment-X #CENTER
      -\tweak extra-offset #'(-0.7 . -3.65)
      ^\markup\with-dimensions-from\null {
        \concat {
          \larger ( \hspace #1 \larger )
        }
      }
      fis8 g8 | % 33
      a4 a4 e4 e4
      \alternative {
        % volta 1
        \volta 1 {
          a2 r4 a8 e8 | % 35
          a,4 a,4 b,4 cis4 | % 36
          d2 r8 d8 e8 fis8
        }
        % volta 2
        \volta 2 {
          a2 r8 e8 cis8 b,8 | % 38
        }
      }
    }
    % out repeat
    a,4. a,8 b,4 cis4 | % 39
    d2
  }

  r4 fis8 g8 | % 45
  a4 a4 e4 e4 | % 46
  a2 r8 e8 cis8 b,8
  | % 47
  a,4. a,8 b,4 cis4
  d1
  % R1*2 r2.
  \fine
}

%% LYRICS

AltoVerse = \lyricmode {
  Ki -- ta da -- tang ber -- sa -- "ma," ki -- ni sa -- at -- nya pu --
  "lang." Ha -- ti pe -- nuh su -- ka -- ci -- "ta," ka -- sih Tu --
  han __ ge -- mi -- \markup\with-dimensions-from "lan" "lang."
  Ti -- a -- da yang mus --
  ta -- \syairDiKiri hil bi -- la Tu -- han di si -- "ni." Cin -- ta -- Nya yang a -- ba --
  di te -- guh -- " kan" ha -- ti i -- "ni." __

  Ber -- sa -- ma Ye -- "sus," ki -- ta me -- lang -- "kah." __
  Ber -- sa -- ma Ye -- " sus," ki -- ta ber -- sa -- "ma." __
  Ma -- ri pu -- \tweak self-alignment-X #-0.5 "lang,"
  ma -- ri pu -- "lang,"
  da -- lam da -- mai ka -- sih Tu -- "han."
  Su -- ka -- ci -- ta ki -- ta ba -- wa
  se -- pan -- jang hi -- dup ki -- "ta."
  Ma -- ri "pu- "
}

AltoChorus = \lyricmode {
  \tweak self-alignment-X #-0.5 "lang,"
  ma -- ri pu -- "lang,"
  Ye -- sus ser --
  \set ignoreMelismata = ##t
  ta -- i
  \set ignoreMelismata = ##f
  lang -- kah ki -- "ta." \skip1
  Ber -- syu -- kur dan ber -- nya-
}

AltoLyricsOne = \lyricmode {
  \AltoVerse

  #(if is-svg? #{ \lyricmode { \AltoChorus } #})

  "nyi,"
  pu -- ji Tu -- han se -- la -- ma -- "nya."

  #(if is-svg?
       #{
         \lyricmode {
           \AltoVerse
           \AltoChorus
           "nyi,"
           pu -- ji Tu -- han se -- la -- ma -- "nya."
         }
       #})

  Ber -- syu -- kur dan ber -- nya -- nyi,
  pu -- ji Tu -- han se -- la -- ma -- \markup \with-dimension #Y #'(-0.8 . 1.7) "nya!" __
}

AltoLyricsTwo = \lyricmode {
  \repeat unfold 80 { \skip1 }
  \AltoChorus
}

BassVerse = \lyricmode {
  Ki -- ta da -- tang ber -- \syairDiKiri sa -- "ma," ki -- ni sa -- at ki -- ta pu --
  "lang." Ha -- ti pe -- \syairDiKiri nuh su -- ka -- ci -- "ta," ka -- sih -- Nya ge -- mi
  -- \markup\with-dimensions-from "lan" "lang."
  Ti -- a -- da yang mus -- ta -- hil bi -- la Tu --
  han a -- da di si -- "ni." __ Cin -- ta -- Nya yang a -- ba -- di te --
  guh -- " kan" ha -- ti i -- "ni." __

  Ber -- sa -- ma Ye -- "sus," __ ki -- ta me -- lang -- " kah."
  Ber -- sa -- ma Ye -- "sus," ki -- ta ber -- sa -- "ma." __
  Ma -- ri pu -- \tweak self-alignment-X #-0.5 "lang,"
  ma -- ri pu -- "lang,"
  da -- lam da -- mai ka -- sih Tu -- "han."
  Su -- ka -- ci -- ta ki -- ta ba -- wa
  se -- pan -- jang hi -- dup ki -- "ta."
  Ma -- ri "pu- "
}

BassLyricsOne = \lyricmode {
  \BassVerse

  #(if is-svg? #{ \lyricmode { \AltoChorus } #})

  "nyi,"
  pu -- ji Tu -- han se -- la -- ma -- "nya."

  #(if is-svg?
       #{
         \lyricmode {
           \BassVerse
           \AltoChorus
           "nyi,"
           pu -- ji Tu -- han se -- la -- ma -- "nya."
         }
       #})

  Ber -- syu -- kur dan ber -- nya -- nyi,
  pu -- ji Tu -- han se -- la -- ma -- "nya!" __
}

BassLyricsTwo = \lyricmode {
  \repeat unfold 82 { \skip1 }
  \AltoChorus
}

#(when is-svg?
   (set! AltoLyricsTwo #f)
   (set! BassLyricsTwo #f))

Chords = \chordmode {
  s2
  \repeat segno 2 {
    s8 a8 a8/b a8/cis |

    d4 s4. d8/d d/e d/fis  |
    g4 s4. g8/e g/fis g/g |
    a2 g4/b e4/gis |
    a2 s2 |

    d2 d2/a |
    d2 d4/fis d4/e |
    d2 e2:m |
    a2 a8/a a8/b a8/cis a8/d |
    e2:m
    \temporary \override ChordName.extra-offset = #'(0 . 0.5)
    e2:m/d |
    a2/cis a8/a a8/b a8/cis a8/e |
    a4 a/g a/fis a/e |
    d2 a8 a/g a/fis a/e |

    d2 d2/a |
    d2 d4/fis d4/e |
    d2 e2:m |
    a2 a8/a a8/b a8/cis a8/d |
    e2:m e2:m/d |
    a2/cis a8/a a8/b a8/cis a8/e |
    \revert ChordName.extra-offset
    a4 a/g a/fis a/e |
    d2 a2 |
    d4

    s2. |
    a2:7 a2:7/e |
    a2 a2/e |
    d2 d2/fis |
    d2 d8/d d8/e d8/fis d8/g |
    a2:7 a2:7/e |
    a2 a2/e |
    d2 d4/fis d4/e |
    d2 d2:7 |

    % repeat
    \repeat volta 2 {
      g2 g2/d |
      g2 g4/d g8/b g8/a |
      g2 a2 |
      d2 d8/d d8/e d8/fis d8/g |
      a2 a2/e |
      \alternative {
        % volta 1
        \volta 1 {
          a2:7 a2:7/e |
          a4 a/a a/b a/cis |
          d2 d8:/fis d8:/d d8:/e d8:/fis |
        }
        % volta 2
        \volta 2 {
          a2:7 a2:7/e |
        }
      }
    }
    a4 a/a a/b a/cis |
    d2
  }

  % coda
  s4 d8/fis d8/g |
  a2 a2/e |
  a2:7 a2:7/e |
  a4 a/a a/b a/cis |
  d1 |
  % d4 a d a |
  %   d2 a |
  %   d2.
}

%% MIDI
SopranoMidiInstrument = "flute"
AltoMidiInstrument = "clarinet"
TenorMidiInstrument = "oboe"
BassMidiInstrument = "bassoon"
WomenMidiInstrument = "trumpet"
IntroMidiInstrument = "banjo"

\paper {
  ShortIndentSolmisasi = 8.5\mm
}