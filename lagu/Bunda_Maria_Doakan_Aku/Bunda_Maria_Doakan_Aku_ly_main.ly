\version "2.25.26"
% -*- master: Bunda_Maria_Doakan_Aku.ly;

\include "jazzchords.ily"

%% VARIABLES
EngraveNotAngka = ##t
EngraveNotBalok = ##f
StandardStaffSize = #20
SolmisasiStaffSize = #20
TwoVoicesPerStaff = ##f
CetakWatermark = ##f
AlwaysShortInstrumentName = ##t

Global = {
  \disallowLineBreak
  #(if (not is-svg?) #{ \disallowPageBreak #})
  \omit KeySignature
  \omit Score.TimeSignature
  \numericTimeSignature
  \time 4/4
  \key c \major
  \override Score.Hairpin.to-barline = ##f
  \override Score.DynamicTextSpanner.dash-fraction = #0.3
  \override Score.DynamicTextSpanner.dash-period = #2.0
  \once\hide Score.BarNumber
  %\set Score.dalSegnoTextFormatter = #format-dal-segno-text-brief
  \set Score.dalSegnoTextFormatter =
  #(lambda (context repeat-count markups)
     #{ \markup \null #})

  \tag#'midi {
    \tempo 4=60 s4
    \tempo 4=63 s4
    \tempo 4=66 s4
    \tempo 4=69 s4
  }
  \tag#'notangka {
    %\omit Score.BarNumber
    \tweak extra-offset #'(0 . -1) \mark \markup \smaller\caps\bold "Intro"
    s1
  }
  \once\omit Score.MetronomeMark
  \tempo 4=72
  s1*5 \break
  \tweak X-offset #-2.18 \mark\default
  s1*4 \break
  s1*4 \break
  s1*4 \break
  \once\override Score.SegnoMark.X-offset = #-4
  \once\override Score.SegnoMark.Y-offset = #3
  \once\override Score.SegnoMark.font-size = #5
  \repeat segno 2 {
    \set Score.rehearsalMark = #2
    \tweak X-offset #-2.1 \tweak extra-offset #'(0 . -0.5) \mark\default
    s1*4 \break
    s1*4 \pageBreak
    s1*4 \break
    \tweak X-offset #-2.18 \tweak extra-offset #'(0 . -1) \mark\default
    s1*4 \break
    s1*4
    #(if (not is-svg?)
         #{
           \tweak Y-offset #-2.7 \textEndMark \markup \line {
             \italic \concat {
               2 \super nd " to Coda " \larger \coda
             }
           }
         #})
    \break
    \alternative {
      \volta 1 {
        \once\omit Score.CodaMark
        \mark \markup \smaller\caps\bold "Interlude"
        % \once \override Score.CodaMark.self-alignment-X = #RIGHT
        %         \once \override Score.CodaMark.extra-offset = #'(0.75 . -4)
        %         \once \set Score.codaMarkFormatter =
        %         #(lambda args
        %            #{
        %              \markup \line {
        %                \smaller \italic \concat {
        %                  2 \super nd " to Coda " \larger \coda
        %                }
        %              }
        %            #})
        s1*4
        #(if (not is-svg?)
             #{ \textEndMark \markup \italic { D.S. al. Coda } #})
        \break
      }
      \volta 2 \volta #'() {
        \section
        \sectionLabel \markup { \hspace #0.5 \larger \coda Coda }
      }
    }
  }
  s1*3 \fine
}

%% INTRO
IntroMusic = {
  \set Staff.instrumentName = ""
  \numericTimeSignature
  \time 4/4
  \key c \major
  \set Score.proportionalNotationDuration = #1/3
  <>-\tweak extra-offset #'(0 . -1)-\tweak self-alignment-X #LEFT ^\dynamicText "(strings)" R1
  \unset Score.proportionalNotationDuration
  a'8 c''8 c''8 a'8 b'2 | % 2
  b'8 d''8 d''8 b'8 c''16 b'16
  d''16 c''16 b'16  a'16
  g'16 e'16 | % 3
  f'8 a'8 b'8 c''8 b'4. c''8 | % 4
  \set Score.proportionalNotationDuration = #1/3
  c''1 | % 5
  R1 \bar "||" % 6
  \unset Score.proportionalNotationDuration
  s1*32
  \set Staff.shortInstrumentName = ""
  a'8 c''8 c''8 a'8 b'2 | % 2
  b'8 d''8 d''8 b'8 c''16 b'16
  d''16 c''16 b'16  a'16
  g'16 e'16 | % 3
  f'8 a'8 b'8 c''8 b'4. c''8 |
  \set Score.proportionalNotationDuration = #1/6
  c''2 r2
  \unset Score.proportionalNotationDuration
}

%% CHOIR
WomenShortInstrumentName = "SA"
WomenMusic = {
  \clef "treble" \numericTimeSignature \time 4/4 \key c \major
  s1 | % 1
  s1 | % 2
  s1 | % 3
  s1 | % 4
  s1 | % 5
  s1 \bar "||" % 6
  \temporary \override Beam.extra-offset = #'(0 . 0.4)
  e'8 -\< -\tweak self-alignment-X #-0.2 ^\mp e'8 e'8   e'8 d'8 \! e'8-\> f'8  g'8 | % 7
  e'2.\! r8[ \set stemLeftBeamCount = #2 \set stemRightBeamCount = #2 r16 c'16 | % 8
  g'8 g'8 g'8 g'8 f'8( g'16) a'8. f'16 g'16 ( | % 9
  g'2.) r4 | % 10
  f'8^\markup\italic "poco staccato" g'8 \tweak transparent ##t ~ \tuplet 3/2 {
    \dot g'8 f'8 e'8
  }
  d'4.-\tweak Y-offset #3.8 ^\markup\italic "legato" a'8 | % 11
  g'4 \tweak transparent ##t ~ \tuplet 3/2 {
    \dot g'8 f'8 g'8
  }
  e'2 | % 12
  d'8\< e'16 f'8.
  d'16\! b8. <>\>  b16
  c'8  d'16\tweak transparent ##t ~ \dot d'16  e'16 ( | % 13
  e'2.)\! r4 | % 14
  a'8 a'8 a'8 g'8 f'2 | % 15
  g'8 a'16 g'8.
  f'8 e'2 | % 16
  d'8 e'16 f'8.
  d'16 b8. b16
  e'8. d'8 | % 17
  c'2. r4 \bar "||" % 18
}

SopranoMusic = {
  \clef "treble" \numericTimeSignature \time 4/4 \key c \major
  s1*6
  s1*12
  \repeat segno 2 {
    \crescHairpin \dimHairpin
    \temporary \override Beam.extra-offset = #'(0 . 0.4)
    e'8-\< -\tweak self-alignment-X #-0.2 -\mp e'8 e'8 e'4 \! d'16 -\> e'16 f'8 g'8  | % 19
    e'2.\! r8[ \set stemLeftBeamCount = #2 \set stemRightBeamCount = #2 r16 c'16 | % 8
    g'8 g'8 g'8 g'8 f'8 g'16 a'8. f'16 g'16 ( | % 21
    g'1) | % 22
    f'8^\markup\italic "poco staccato" g'8 \tweak transparent ##t ~ \tuplet 3/2 {
      \dot g'8 f'8 e'8
    }
    d'4.-\tweak Y-offset #3.8 ^\markup\italic "legato" a'8 | % 23
    g'4 f'8 g'16 e'16 \tweak transparent ##t ~ \dot e'2 | % 24
    d'8 -\< e'8 f'8 d'8
    b16 \!  b16 \tweak transparent ##t ~ \dot b8 \>  c'8 d'8 | % 25
    e'1\! | % 26
    a'8 -\tweak self-alignment-X #-0.2 -\mf a'8 a'8 g'8
    f'2 | % 27
    g'8 a'16 g'8.
    f'16 e'16 \tweak transparent ##t ~ \dot e'2  | % 28
    d'8^\mp e'16 f'8.
    d'8 b8 b16 e'8. d'8 | % 29
    c'1 \bar "||" % 30

    \revert Beam.extra-offset
    \set crescendoText = \markup { \italic { poco cresc. } }
    \set crescendoSpanner = #'text
    a'8-\tweak extra-offset #'(0 . -0.5)\< -\tweak self-alignment-X #-0.2 ^\mf
    c''8 c''8 a'16 b'16 \tweak transparent ##t ~ \dot b'2 | % 31
    b'8 -\f d''16 d''8. b'16 d''16 (   c''2 ) | % 32
    \set decrescendoText = \markup { \italic { dim. } }
    \set decrescendoSpanner = #'text
    a'8 -\tweak extra-offset #'(0 . -0.5)\> c''16 c''8. c''16 b'8.
    b'8 a'8 b'8 | % 33
    a'8 g'16 g'16 \! \tweak transparent ##t ~ \dot g'2.
    | % 34
    a'8 -\tweak extra-offset #'(0 . -0.5)-\< -\tweak self-alignment-X #-0.2 -\mf c''16 c''8. a'16 b'16 \tweak transparent ##t ~ \dot b'2  | % 35
    b'8 -\f d''16 d''8 e''8. d''8 c''16
    c''16 \tweak transparent ##t ~ \dot c''4  | % 36
    a'8  c''16 c''8. c''16 b'8. b'8 a'8 b'8 | % 37
    d''8 c''16 c''16 \tweak transparent ##t ~ \dot c''2.  \bar "||" % 38
    \alternative {
      \volta 1 {
        s1*4
      }
      \volta 2 \volta #'() {
      }
    }
  }
  a'8  c''16 c''8. c''16 b'8. b'8 a'8 b'8 | % 37
  d''8 c''16 c''16 \tweak transparent ##t ~ ( \dot c''4 d''2 | % 46
  \crescHairpin
  e''2.)\< \tweak transparent ##t ~ \dot e''4 \! \bar "|."
}

AltoMusic = {
  \clef "treble" \numericTimeSignature \time 4/4 \key c \major
  s1*6
  s1*12
  \repeat segno 2 {
    \dynamicsOff
    \omit Slur
    \temporary \override Beam.extra-offset = #'(0 . 0.4)
    c'2 ( -\< -\tweak self-alignment-X #-0.2 -\mp d'2 \! -\> <> \! | % 19
    % 20
    c'4 ) r4 d'4 ( c'4 | % 20
    e'2 f'4. e'8 | % 21
    d'2 c'4 ) r4 | % 22
    d'8 d'8 \tweak transparent ##t ~ \tuplet 3/2 {
      \dot d'8 d'8 d'8
    }
    d'4. d'8 | % 23
    e'4 d'8 d'16 c'16 \tweak transparent ##t ~ \dot c'2 | % 24
    d'4 -\< d'4 b4 \! -\>   g4 <> \! | % 25
    c'4. d'8 e'2 | % 26
    c'2 ( -\mf b2 | % 27
    c'4 c'8 d'8 c'2 ) | % 28
    d'8 e'16 f'8.
    d'8 b8 b16 e'8. d'8 | % 29
    c'1 \bar "||" % 30

    \undo\omit Slur
    f'8 -\< -\mf f'8 f'8   e'16 d'16 \tweak transparent ##t ~ \dot d'2  | % 31
    g'8 -\f g'16 g'8.
    g'16 f'16 ( e'2 ) | % 32
    f'8 -\> f'16 f'8.
    e'16 d'8. g'8
    f'8 g'8 <> \! | % 33
    f'8 e'16 e'16 \tweak transparent ##t ~ \dot e'2.
    | % 34
    f'8 -\< -\mf f'16 f'8. e'16 d'16 \tweak transparent ##t ~ \dot d'2 | % 35
    g'8 -\f g'16 g'8
    g'8. gis'8 a'16 a'16 \tweak transparent ##t ~
    \dot a'4  | % 36
    f'8 f'16 f'8.
    e'16 d'8. g'!8
    f'8 g'8 | % 37
    g'8 g'16 g'16 \tweak transparent ##t ~ \dot g'2.
    \bar "||" % 38

    \alternative {
      \volta 1 {
        s1*4
      }
      \volta 2 \volta #'() {
      }
    }
  }
  f'8 f'16 f'8.
  e'16 d'8. g'!8
  f'8 g'8 | % 37
  gis'8 gis'16 gis'16 \tweak transparent ##t ~ ( \dot gis'4 f'2 | % 46
  g'!1 )
}

TenorMusic = {
  \clef "treble" \numericTimeSignature \time 4/4 \key c \major
  s1*6
  s1*12
  \repeat segno 2 {
    \dynamicsOff
    \omit Slur
    g2 ( -\< -\mp g2 \! -\> <> \! | % 19
    g4 ) r4 b4 ( a4 | % 20
    g4. c'8 b2 | % 21
    g2. ) r4 | % 22
    a8 a8 \tweak transparent ##t ~ \tuplet 3/2 {
      \dot a8 a8 a8
    }
    b4. c'8 | % 23
    c'4 b8 b16 c'16 \tweak transparent ##t ~ \dot c'2 | % 24
    a4 -\< a4 g4 \! -\> g4
    <> \! | % 25
    c'4. b8 bes2 | % 26
    \temporary \override Beam.extra-offset = #'(0 . 0.4)
    a2 ( -\mf g2 | % 27
    c'4 b8 g8 a2 ) | % 28
    f8 g16 a8. f8 d8 d16 g8. f8 | % 29
    e1 \bar "||" % 30

    \revert Beam.extra-offset
    \undo\omit Slur
    c'8 -\< -\mf a8 a8 c'16 d'16 \tweak transparent ##t ~ \dot d'2  | % 31
    e'8 -\f b16 b8. b16 b16 ( c'2 ) | % 32
    c'8 -\> a16 a8.
    c'16 d'8. d'8 c'8 d'8 <> \! | % 33
    c'8 c'16 c'16 \tweak transparent ##t ~ \dot c'2. | % 34
    c'8 -\< -\mf a16 a8. c'16 d'16 \tweak transparent ##t ~ \dot d'2  | % 35
    e'8 -\f b16 b8 b8. b8 c'16
    c'16 \tweak transparent ##t ~\dot c'4  | % 36
    c'8 a16 a8.c'16 d'8. d'8 c'8 d'8 | % 37
    d'8 e'16 e'16 \tweak transparent ##t ~ \dot e'2. \bar "||" % 38

    \alternative {
      \volta 1 {
        s1*4
      }
      \volta 2 \volta #'() {
      }
    }
  }
  c'8 a16 a8.c'16 d'8. d'8 c'8 d'8 | % 37
  dis'8 dis'16 dis'16 \tweak transparent ##t ~ ( \dot dis'4 d'2 | % 46
  c'1 )
}

BassMusic = {
  \clef "treble" \numericTimeSignature \time 4/4 \key c \major
  s1*6
  s1*12
  \repeat segno 2 {
    \dynamicsOff
    \omit Slur
    \temporary \override Beam.extra-offset = #'(0 . 0.4)
    c2 ( -\< -\mp b,2 \! -\> <> \! | % 19
    c4 ) r4 g4 ( f4 | % 20
    c2 d4 g,4 | % 21
    c2. ) r4 | % 22
    d8 d8 \tweak transparent ##t ~ \tuplet 3/2 {
      \dot d8 d8 d8
    }
    g,4. g,8 | % 23
    c4 g8 g16 a16 \tweak transparent ##t ~ \dot a2 | % 24
    f4 -\< f4 d4 \! -\> b,4 <> \! | % 25
    c4. c8 c2 | % 26
    d4 ( -\mf e4 g,2 | % 27
    e4 g,4 a,2 ) | % 28
    f8 g16 a8. f8 d8 d16 g8. f8 | % 29
    e1 \bar "||" % 30

    \undo\omit Slur
    f8 -\< -\mf f8 f8 f16 g16 \tweak transparent ##t ~ \dot g2  | % 31
    e8 -\f e16 e8. e16 a,16( a,2) | % 32
    f8 -\> f16 f8. f16 g8.
    g8 g8 g8 <> \! | % 33
    c8 c16 c16 \tweak transparent ##t ~ \dot c2.  | % 34
    f8 -\< -\mf f16 f8. f16 g16 \tweak transparent ##t ~ \dot g2  | % 35
    e8 -\f e16 e8 e8. a,8 a,16 a,16 \tweak transparent ##t ~ \dot a,4  | % 36
    f8 f16 f8.
    f16 g8. g8
    g8 g8 | % 37
    c8 c16 c16 \tweak transparent ##t ~ \dot c2. \bar "||" % 38

    \alternative {
      \volta 1 {
        s1*4
      }
      \volta 2 \volta #'() {
      }
    }
  }
  f8 f16 f8.
  f16 g8. g8
  g8 g8 | % 37
  gis8 gis16 gis16 \tweak transparent ##t ~ ( \dot gis4 bes4 bes,!4 | % 46
  c1 )
}

Chords = \chordmode {
  s1
  f2 f2/g |
  e2:m a2:m |
  d2:m g2 |
  c1 |
  c1 |

  c2 g2/b |
  c1 |
  c2/e d4:m g4 |
  c2 a2:7/cis |
  d2:m g2/b |
  e2:m7 a2:m |
  d2:m g2 |
  c2 c2:7 |
  f2 g2/f |
  e2:m7 a2:m |
  d2:m g2 |
  c1 |

  \repeat segno 2 {
    c2 g2/b |
    c2 g4 f4 |
    c2/e d4:m g4 |
    c2. a4:m |
    d2:m g2 |
    c4 g4 a2:m |
    d2:m g4/b g4 |
    c2 c2:7 |
    f2 g2 |
    c4 g4 a2:m |
    d2:m g2 |
    c2. c4:7 |

    f2 g2 |
    e2:m a2:m |
    f2 g2 |
    c1 |
    f2 g2 |
    e2:m a2:m |
    f2 g2 |
    c4 s2. |

    \alternative {
      \volta 1 {
        f2 f2/g |
        e2:m a2:m |
        d2:m g2 |
        c1 |
      }
      \volta 2 \volta #'() {}
    }
  }
  f2 g2 |
  aes2 bes2 |
  c1
}

%% Verses

WomenLyrics = \lyricmode {
  Di se -- ti -- ap lang -- kah hi -- dup -- ku, __
  te -- ra -- sa be -- rat di ba -- hu -- ku. __
  " Bun" -- da Ma -- ri -- a, Kau yang se -- ti -- a __
  lin -- dung -- i a -- ku da -- lam do -- a. __
  " Bun" -- da Ma -- ri -- a, do -- a -- kan a -- ku,
  di sa -- at le -- mah a -- ku rin -- du. __
}

SopranoLyrics = \lyricmode {
  " Sa" -- at ge -- lap meng -- i -- si ma -- lam, __
  ha -- rap -- an hi -- lang ha -- ti pun ke -- lam. __
  " Bun" -- da Ma -- ri -- a, si -- nar -- mu te -- rang,
  ba -- wa da -- mai he -- ning di re -- lung; __
  " Ka" -- sih -- mu ha -- dir, se -- la -- lu te -- guh,
  Bun -- da yang su -- ci, bim -- bing a -- ku. __
  #(if is-svg?
       #{
         \lyricmode {
           "" \repeat unfold 43 { \skip1 }
           " Sa" -- at ge -- lap meng -- i -- si ma -- lam, __
           ha -- rap -- an hi -- lang ha -- ti pun ke -- lam. __
           " Bun" -- da Ma -- ri -- a, si -- nar -- mu te -- rang,
           ba -- wa da -- mai he -- ning di re -- lung; __
           " Ka" -- sih -- mu ha -- dir, se -- la -- lu te -- guh,
           Bun -- da yang su -- ci, bim -- bing a -- ku. __
         }
       #})
}

AltoLyrics = \lyricmode {
  \repeat unfold 29 { \skip1 }
  " Da" -- lam ha -- ti -- ku, __ 'ku me -- mang -- gil -- mu, __
  Bun -- da yang mu -- lia se -- ti -- a dan te -- guh. __
  " Do" -- a -- mu su -- ci, __ me -- ngu -- atkan \skip1 ha -- ti -- ku;
  s'la -- lu ber -- sa -- ma hing -- ga a -- khir za -- man. __
  #(if is-svg?
       #{
         \lyricmode {
           "" \repeat unfold 28 { \skip1 }
           " Da" -- lam ha -- ti -- ku, __ 'ku me -- mang -- gil -- mu, __
           Bun -- da yang mu -- lia se -- ti -- a dan te -- guh. __
           " Do" -- a -- mu su -- ci, __ me -- ngu -- atkan \skip1 ha -- ti -- ku;
           s'la -- lu ber -- sa -- ma hing -- ga a -- khir za -- man. __
         }
       #})
  " S'la" -- lu ber -- sa -- ma hing -- ga a -- khir za -- man. __
}

BassLyrics = \lyricmode {
  Uu __ Uu __
  " Bun" -- da Ma -- ri -- a, si -- nar -- mu te -- rang,
  da -- mai he -- ning di re -- lung;
  Uu __ Bun -- da yang su -- ci, bim -- bing a -- ku. __
  " Da" -- lam ha -- ti -- ku, __ 'ku me -- mang -- gil -- mu, __
  Bun -- da yang mu -- lia se -- ti -- a dan te -- guh. __
  " Do" -- a -- mu su -- ci, __ me -- ngu -- atkan \skip1 ha -- ti -- ku;
  s'la -- lu ber -- sa -- ma hing -- ga a -- khir za -- man. __
  #(if is-svg?
       #{
         \lyricmode {
           Uu __ Uu __
           " Bun" -- da Ma -- ri -- a, si -- nar -- mu te -- rang,
           da -- mai he -- ning di re -- lung;
           Uu __ Bun -- da yang su -- ci, bim -- bing a -- ku. __
           " Da" -- lam ha -- ti -- ku, __ 'ku me -- mang -- gil -- mu, __
           Bun -- da yang mu -- lia se -- ti -- a dan te -- guh. __
           " Do" -- a -- mu su -- ci, __ me -- ngu -- atkan \skip1 ha -- ti -- ku;
           s'la -- lu ber -- sa -- ma hing -- ga a -- khir za -- man. __
         }
       #})
  " S'la" -- lu ber -- sa -- ma hing -- ga a -- khir za -- man. __
}

%% MIDI
IntroMidiInstrument = "acoustic grand"
SopranoMidiInstrument = "flute"
AltoMidiInstrument = "oboe"
TenorMidiInstrument = "clarinet"
BassMidiInstrument = "bassoon"
WomenMidiInstrument = "trumpet"

\paper {
  ShortIndentSolmisasi = 9.25\mm
}