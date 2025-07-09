\version "2.25.26"
% -*- master: Bersama_Kristus.ly;

%% VARIABLES
EngraveNotAngka = ##t
EngraveNotBalok = ##f
StandardStaffSize = #20
SolmisasiStaffSize = #(* 20 (/ 6.5 7))
TwoVoicesPerStaff = ##f
AlwaysShortInstrumentName = ##t
UnfoldBarNumbers = ##f

Global = {
  #(if (not is-svg?) #{ \disallowPageBreak #})
  \disallowLineBreak
  \omit Score.TimeSignature
  \omit Score.KeySignature
  \omit Score.BarNumber
  %\override Score.SystemStartBar.collapse-height = #4
  \numericTimeSignature
  \key e \major
  \once\omit Score.MetronomeMark \tempo 4=116
  \override Score.TupletBracket.Y-offset = #1.5
  \override Score.TupletBracket.extra-offset = #'(0 . -0.2)
  \override Score.TupletNumber.extra-offset = #'(0 . -0.1)
  \override Score.TupletBracket.bracket-visibility = #'if-no-beam
  \override Score.Beam.extra-offset = #'(0 . 0.5)
  \override Score.SystemStartBracket.collapse-height = #5
  %   s1*7 \break
  %   s1*6 \break
}

WomenInstrumentName = \markup\bold "Intro"
WomenShortInstrumentName = \WomenInstrumentName
WomenMusic = {
  \clef "treble"
  \numericTimeSignature
  \time 4/4
  \key e \major
  %\tweak extra-offset #'(0 . -0.5)\mark \markup\smaller\caps\bold "Intro"
  \pseudoIndent #1
  \temporary\override NoteHead.style = #'slash
  \temporary\override NoteHead.font-size = #-0.5
  \repeat unfold 2 {
    \repeat volta 4 {
      \volta #'() {
        \after 1*7/4 <>-\tweak extra-offset #'(0 . -1.5)
        ^\markup \with-dimensions-from "x" { \bold "4×" }
        e1*2
      }
    }
  }
  e1*3
  e2
  \revert NoteHead.style
  \revert NoteHead.font-size
  \break
  \undo \omit Score.BarNumber
  \set Staff.shortInstrumentName = "I+II"

  gis'4-\tweak self-alignment-X #-0.5 -\tweak Y-offset #-1.5 ^\dynamicText "Unis." a'4 | % 21
  b'4 e'8. e'8. e'8 b'8 b'8 ( | % 22
  b'8) a'8 gis'8 a'8 r4 fis'8 gis'8 | % 23
  a'4 dis'8. dis'8. dis'8 a'8 a'8 ( | % 24
  a'8 ) gis'8 fis'8 gis'8 r4 \break
  a'8 b'8 | % 26
  cis''4 e'8. fis'1*5/16 gis'8 a'8 | % 27
  b'4 dis'8. e'1*5/16 fis'8 gis'8 | % 28
  a'4 b'8 gis'4 fis'8 ( e'8 ) e'8 ( | % 29
  e'1 ) | % 30
  R1 \break

  \once\override Score.RehearsalMark.extra-offset = #'(0.5 . 0)
  \boxedAlphabetMark #LEFT "Bait 1"
  \set Staff.shortInstrumentName = \markup\with-dimensions-from "II" \center-align "I"

  \bar #(if is-svg? "||" ".|:-||")
  \repeat volta 2 {
    b4 b'8. a'8. gis'8
    fis'8 gis'8 | % 32
    b2. r4 | % 33
    b4 b'8. a'8. gis'8
    fis'8 e'8 | % 34
    \shape #'((0 . 0) (0.5 . 0) (2 . -0.5) (0 . 0)) Slur
    \slurDashed gis'4. ( \slurSolid a'16 \=2( gis'16 ) \=2) fis'4 r4
    \break
  }
  | % 35
  dis'4 fis'8. e'8. e'8 dis'8 e'8 | % 36
  cis'4 gis'8. fis'1*5/16 r4 | % 37
  dis'4 fis'8. e'8. e'8 dis'8 e'8 | % 38
  b1 | % 39
  R1 % 40
  \break

  \bar #(if is-svg? "||" ".|:-||")
  \repeat volta 2 {
    s1*4
  }
  s1*5 s2

  \set Staff.shortInstrumentName = "I+II"
  \once\override Score.RehearsalMark.extra-offset = #'(0.5 . 0)
  \boxedAlphabetMark #LEFT "Refrain 1"

  gis'4 a'4 | % 50
  \repeat volta 2 {
    b'4 e'8. e'8. e'8
    b'8 b'8 ( | % 51
    b'8) a'8 gis'8 a'8 r4 fis'8 gis'8 | % 52
    a'4 dis'8. dis'8. dis'8 a'8 a'8 ( | % 53
    a'8 ) gis'8 fis'8 gis'8 r4 \break
    a'8 b'8 | % 55
    cis''4 e'8. fis'1*5/16 gis'8 a'8 | % 56
    b'4 dis'8. e'1*5/16 fis'8 gis'8 | % 57
    \alternative {
      {
        a'4 gis'8 a'4  b'4 fis'8 ( | % 58
        fis'4 ) r4
        #(if is-svg? #{ \break #})
        gis'4 a'4
      }
      {
        a'4 b'8 gis'4 fis'8 ( e'8 ) e'8 (
      }
    }
  }
  \break
  %\set Score.proportionalNotationDuration = #1
  e'1 ) | % 61
  R1
  %\unset Score.proportionalNotationDuration

  % s1 \hide Staff.BarLine
  %   \tweak extra-offset #'(-1.5 . -1.5)
  %   \sectionLabel \markup \with-dimensions-from \null \line { ----- \bold "Interlude:" 4 birama ----- }
  %   s1*3\break
  %   \undo\hide Staff.BarLine
  %   \bar "||" \break
  % \tweak self-alignment-X #LEFT \mark \markup\smaller\caps\bold "Interlude 1"
  \temporary\override NoteHead.style = #'slash
  \repeat volta 2 {
    e2 e2
    e2 e2
  }
  \revert NoteHead.style
  \pageBreak

  \boxedAlphabetMark #LEFT "Bait 3"
  \set Staff.shortInstrumentName = \markup\with-dimensions-from "II" \center-align "I"
  b4 b'8. a'8. gis'8 fis'8 gis'8 \spanBarOff | % 41
  b2. r4 \spanBarOn | % 42
  b4 b'8. a'8. gis'8 fis'8 e'8 \spanBarOff | % 43
  gis'4. a'16( gis'16 ) fis'4 r4 \spanBarOn \break | % 44
  R1
  b4 b'8. a'8. gis'8 fis'8 gis'8 \spanBarOff | % 41
  b2( cis'2 |
  e'2 dis'4) r4 \spanBarOn |
  \set Staff.shortInstrumentName = "I+II"
  dis'4 fis'8. e'8.   e'8 dis'8 e'8 | % 45
  cis'4 gis'8. fis'1*5/16 r4 | % 46
  dis'4 fis'8. e'8.   e'8 fis'8 gis'8 | % 47
  a'2 r8 a'8 a'8 b'8 ( | % 48
  b'1) | % 49
  r2 \break

  \once\override Score.RehearsalMark.extra-offset = #'(0.5 . 0)
  \boxedAlphabetMark #LEFT "Refrain 2"

  gis'4 a'4 | % 50
  \repeat volta 2 {
    b'4 e'8. e'8. e'8
    b'8 b'8 ( | % 51
    b'8) a'8 gis'8 a'8 r4 fis'8 gis'8 | % 52
    a'4 dis'8. dis'8. dis'8 a'8 a'8 ( | % 53
    a'8 ) gis'8 fis'8 gis'8 r4 \break
    a'8 b'8 | % 55
    cis''4 e'8. fis'1*5/16 gis'8 a'8 | % 56
    b'4 dis'8. e'1*5/16 fis'8 gis'8 | % 57
    \alternative {
      {
        a'4 gis'8 a'4  b'4 fis'8 ( | % 58
        fis'4 ) r4
        #(if is-svg? #{ \break #})
        gis'4 a'4
      }
      {
        a'4 b'8 gis'4 fis'8 ( e'8 ) e'8 (
      }
    }
  }
  \break
  %\set Score.proportionalNotationDuration = #3/8
  e'1 ) | % 61
  R1
  %\unset Score.proportionalNotationDuration

  % s1 \hide Staff.BarLine
  %   \tweak extra-offset #'(5 . -1.5)
  %   \sectionLabel \markup \with-dimensions-from \null \line { ----- \bold "Interlude:" 8 birama ----- }
  %   s1*7\break
  %   \undo\hide Staff.BarLine
  %   \bar #(if is-svg? "||" ".|:-||")
  %\tweak self-alignment-X #LEFT \mark \markup\smaller\caps\bold "Interlude 2"
  \temporary\override NoteHead.style = #'slash
  \repeat unfold 2 {
    \repeat volta 2 {
      e2 e2
      e2 e2
    }
  }
  \revert NoteHead.style
  \break

  \once\override Score.RehearsalMark.extra-offset = #'(0.5 . 0)
  \boxedAlphabetMark #LEFT "Outro"
  \repeat volta 2 {
    gis'8 gis'16 gis'8 gis'16 \tweak stencil ##f ~ \dot gis'16 gis'8 gis'16 \tweak stencil ##f ~ \dot gis'16 gis'8 gis'16 \tweak stencil ##f ~ \dot gis'8 | % 101
    fis'8 gis'16 fis'1*9/16 r4 | % 102
    gis'8 gis'16 gis'8 gis'16 \tweak stencil ##f ~ \dot gis'16 gis'8 gis'16 \tweak stencil ##f ~ \dot gis'16 gis'8 gis'16 \tweak stencil ##f ~ \dot gis'8 | % 101
    fis'8 gis'16 fis'1*9/16 r4 | % 102
    \break
  }
  %\break | % 104
  gis'8 gis'16 gis'8 gis'16 \tweak stencil ##f ~ \dot gis'16 gis'8 gis'16 \tweak stencil ##f ~ \dot gis'16 gis'8 gis'16 \tweak stencil ##f ~ \dot gis'8  | % 105
  gis'8 gis'16 gis'16 \bar "|."
}

MenInstrumentName = "II"
MenShortInstrumentName = \MenInstrumentName
MenMusic = {
  \clef "bass"
  \numericTimeSignature
  \time 4/4
  \key e \major

  s1*8

  s1*9

  \repeat volta 2 {
    s1*4
  }
  s1*5

  \once\override Score.RehearsalMark.extra-offset = #'(0.5 . 0)
  \boxedAlphabetMark #LEFT "Bait 2"
  \repeat volta 2 {
    b,4 b8. a8. gis8 fis8 gis8 | % 41
    b,2. r4 | % 42
    b,4 b8. a8. gis8 fis8 e8 | % 43
    \shape #'((0 . 0) (0.5 . 0) (2 . -0.5) (0 . 0)) Slur
    \slurDashed gis4. ( \slurSolid a16 \=2(
    gis16 ) \=2) fis4 r4 \break
  }
  | % 44
  dis4 fis8. e8.   e8 dis8 e8 | % 45
  cis4 gis8. fis1*5/16 r4 | % 46
  dis4 fis8. e8.   e8 fis8 gis8 | % 47
  a2 r8 a8 a8 b8 ( | % 48
  b1) | % 49
  r2\break

  s2
  \repeat volta 2 {
    s1*6
    \alternative { { s1*2 } { s1 } }
  }
  s1*2

  \repeat volta 2 { s1*2 }

  R1
  b,4 b8. a8. gis8 fis8 gis8 | % 41
  b,2( cis2 |
  e2 dis4) r4 |
  b,4 b8. a8. gis8 fis8 gis8 | % 41
  b,2. r4 | % 42
  b,4 b8. a8. gis8 fis8 e8 | % 43
  gis4. a16( gis16 )
  fis4 r4 \break | % 44
  s1*5 s2

  s2
  \repeat volta 2 {
    s1*6
    \alternative { { s1*2 } { s1 } }
  }
  s1*2

  \repeat unfold 2 { \repeat volta 2 { s1*2 } }

  \repeat volta 2 {
    %\bar ".|:-||"
    cis'8 cis'16 cis'8 cis'16 \tweak stencil ##f ~ \dot cis'16 cis'8 cis'16 \tweak stencil ##f ~ \dot cis'16 cis'8 cis'16 \tweak stencil ##f ~ \dot cis'8 | % 101
    b8 cis'16 b1*9/16 r4 | % 102
    cis'8 cis'16 cis'8 cis'16 \tweak stencil ##f ~ \dot cis'16 cis'8 cis'16 \tweak stencil ##f ~ \dot cis'16 cis'8 cis'16 \tweak stencil ##f ~ \dot cis'8 | % 101
    b8 cis'16 b1*9/16 r4 | % 102
  }
  \break | % 104
  cis'8 cis'16 cis'8 cis'16 \tweak stencil ##f ~ \dot cis'16 cis'8 cis'16 \tweak stencil ##f ~ \dot cis'16 cis'8 cis'16 \tweak stencil ##f ~ \dot cis'8  | % 105
  cis'8 cis'16 cis'16 \bar "|."
}

Chords = \chordmode {
  \temporary\override ChordName.extra-offset = #'(0 . -1)
  \repeat unfold 3 {
    b2/+cis cis2:7 | % 101
    a2/+b b2:7 | % 102
  }
  b2/+cis cis2:7 | % 101
  b2:sus s2 | % 102
  \revert ChordName.extra-offset

  e1 | % 22
  a1 | % 23
  b1:7 | % 24
  e1 | % 26
  a2 b2 | % 27
  gis2:m cis2:m | % 28
  fis2:m b2 | % 29
  e1 | % 30
  s1

  \repeat volta 2 {
    e4 s8. a8./+e s4. | % 32
    d4/+e s8. a8./+e s4. | % 33
    e4 s8. a8. s8 s8 s8 | % 34
    fis4.:m s16 b16 s4 s4
  }
  gis4:m s8. cis8.:m s8 s8 s8 | % 36
  fis4:m s8. b16 s4 s4 | % 37
  gis4:m s8. cis8.:m s8 s8 s8 | % 38
  fis1:m | % 39
  b1

  \repeat volta 2 {
    e4 s8. a8./+e s4. | % 32
    d4/+e s8. a8./+e s4. | % 33
    e4 s8. a8. s8 s8 s8 | % 34
    fis4.:m s16 b16 s4 s4
  }
  gis4:m s8. cis8.:m s8 s8 s8 | % 36
  fis4:m s8. b16 s4 s4 | % 37
  gis4:m s8. cis8.:m s8 s8 s8 | % 38
  fis1:m | % 39
  b1:sus
  s2 s2

  \repeat volta 2 {
    e1 | % 22
    a1 | % 23
    b1:7 | % 24
    e1 | % 26
    a2 b2 | % 27
    gis2:m cis2:m | % 28
    \alternative {
      {
        fis1:m | % 29
        b1 | % 30
      }
      {
        fis2:m b2 | % 29
      }
    }
  }
  e1 s1

  \repeat volta 2 {
    b2/+cis cis2:7 | % 101
    a2/+b b2:7 | % 102
  }

  \repeat unfold 2 {
    e4 s8. a8./+e s4. | % 32
    d4/+e s8. a8./+e s4. | % 33
    e4 s8. a8. s8 s8 s8 | % 34
    fis4.:m s16 b16 s4 s4
  }
  gis4:m s8. cis8.:m s8 s8 s8 | % 36
  fis4:m s8. b16 s4 s4 | % 37
  gis4:m s8. cis8.:m s8 s8 s8 | % 38
  fis1:m | % 39
  b1:sus
  s2 s2

  \repeat volta 2 {
    e1 | % 22
    a1 | % 23
    b1:7 | % 24
    e1 | % 26
    a2 b2 | % 27
    gis2:m cis2:m | % 28
    \alternative {
      {
        fis1:m | % 29
        b1 | % 30
      }
      {
        fis2:m b2 | % 29
      }
    }
  }
  e1 s1

  \repeat unfold 2 {
    \repeat volta 2 {
      b2/+cis cis2:7 | % 101
      a2/+b b2:7 | % 102
    }
  }
  \repeat volta 2 {
    b2/+cis cis2:7 | % 101
    a2/+b b2:7 | % 102
    b2/+cis cis2:7 | % 101
    a2/+b b2:7 | % 102
  }
  | % 104
  a1/+b s4
}

% Verse

VocalIntroVerse = \lyricmode {
  \repeat unfold 4 { \skip1 }
  " Ber" -- sa -- ma Kris -- tus ki -- ta
  \markup\with-dimensions-from\null "'kan"
  ba -- ha -- "gia,"
  ber -- sa -- ma Kris -- tus ka -- sih
  \markup\with-dimensions-from\null "'kan"
  sem -- pur -- "na."
  " Ber" -- sa -- ma Di -- "a," Pe -- ne -- bus ki -- "ta," __
  ba -- ha -- gia se -- la -- ma --
  \markup\with-dimensions-from\null "nya." __
}

WomenVerseOneLineTwo = \lyricmode {
  \repeat unfold 4 { \skip1 }
  Ha -- ti pun a -- kan re -- sah __
  tan -- pa tun -- tun -- an
  \set ignoreMelismata = ##t
  da -- \syairDiKiri ri --
  \skip1 \skip1 \skip1 \syairDiKiri "Nya."
  \set ignoreMelismata = ##f
}

WomenVerseOneLineOne = \lyricmode {
  Ji -- wa ki -- ta da -- ha -- ga __
  a -- kan sab -- da -- Nya yang
  \set ignoreMelismata = ##t
  \syairDiKiri mu -- \skip1 li -- \skip1 " a."
  \set ignoreMelismata = ##f
  #(if is-svg? #{ \lyricmode { \WomenVerseOneLineTwo } #})
  Di -- a -- lah Ye -- "sus," Tu -- han ki -- "ta,"
  Ju -- ru "S'la" -- mat du -- ni -- "a." __
}

WomenRefrainVerseLineTwo = \lyricmode {
  lam Kris -- tus ki -- ta \syairDiKiri sa -- ling cin -- "ta,"
  di da -- lam Kris -- tus ka -- sih -- i __ se -- sa -- "ma."
  " Ber" -- sa -- ma Di -- "a," Pe -- ne -- bus ki -- "ta,"
  ba -- "ha -"
  #(if (not is-svg?) #{ \lyricmode { \repeat unfold 7 { \skip1 } } #})
  gia se -- la -- ma -- "nya."
}

WomenRefrainVerseLineOne = \lyricmode {
  " Ber" -- sa -- ma Kris -- tus ki -- ta
  \markup\with-dimensions-from\null "'kan"
  ba -- ha -- "gia,"
  ber -- sa -- ma Kris -- tus ka -- sih
  \markup\with-dimensions-from\null "'kan"
  "  sem" -- pur -- "na."
  " Ma" -- ri -- lah ki -- ta te -- tap se -- ti -- a
  lak -- sa -- na -- kan sab -- da -- \markup\with-dimensions-from\null "Nya."
  Di "da -"
  #(if is-svg? #{ \lyricmode { \WomenRefrainVerseLineTwo } #})
  #(if (not is-svg?) #{ \lyricmode { \repeat unfold 4 { \skip 1 } "" } #})
  \tweak extra-offset #'(0 . -1) __ ""
}

WomenLyricsOne = \lyricmode {
  \VocalIntroVerse
  \WomenVerseOneLineOne
  \WomenRefrainVerseLineOne

  \repeat unfold 3 { \skip1 }
  Ye -- sus Kris -- "tus," Sang Sab -- "da," __
  \syairDiKiri te -- la -- dan hi -- dup di du -- ni -- "a."

  \syairDiKiri Ma -- ri wu -- jud -- kan cin -- ta __
  Di -- a -- lah Ye -- "sus," Tu -- han ki -- "ta,"
  Sang Pe -- ne -- bus yang ja -- ya "s'la" -- ma -- \markup\with-dimensions-from\null "nya." __

  \WomenRefrainVerseLineOne
}

WomenLyricsTwo = \lyricmode {
  \repeat unfold 39 { \skip1 }
  \WomenVerseOneLineTwo
  \repeat unfold 18 { \skip1 }
  \WomenRefrainVerseLineTwo
  \repeat unfold 48 { \skip1 }
  \WomenRefrainVerseLineTwo
}

MenVerseTwoLineTwo = \lyricmode {
  \set ignoreMelismata = ##f
  De -- ngan ri -- ang gem -- bi -- "ra," __
  ber -- sa -- ma ki -- ta me --
  \set ignoreMelismata = ##t
  \syairDiKiri mu -- \skip1 ji -- \skip1 "Nya."
  \set ignoreMelismata = ##f
}

MenVerseTwoLineOne = \lyricmode {
  Ma -- ri ki -- ta se -- mu -- a __
  meng -- ha -- dap ke ha -- di --
  \set ignoreMelismata = ##t
  \syairDiKiri rat -- \skip1 \skip1 \skip1 "Nya."
  \set ignoreMelismata = ##f
  #(if is-svg? #{ \lyricmode { \MenVerseTwoLineTwo } #})
  Di -- a -- lah Ye -- "sus," Tu -- han ki -- "ta,"
  Sang Pe -- ne -- bus yang ja -- ya "s'la" -- ma -- "nya." __
}

MenLyricsOne = \lyricmode {
  \MenVerseTwoLineOne
  Ye -- sus Kris -- "tus," Sang Sab -- da __

  " Ma" -- ri wu -- jud -- kan cin -- ta __
  \syairDiKiri se -- tu -- rut de -- ngan a -- jar -- an -- Nya.

  \repeat unfold #(if is-svg? 2 1) {
    " Ber" -- sa -- ma Kris -- tus Ye -- "sus," Tu -- han ki -- "ta," __
    ber -- sa -- ma Di -- a ki -- ta "'kan" ba -- ha -- "gia." __
  }
  " Ber" -- sa -- ma Kris -- tus Ye -- "sus," Tu -- han ki -- "ta!"
}

MenLyricsTwo = \lyricmode {
  \MenVerseTwoLineTwo
}

#(when is-svg?
   (set! WomenLyricsTwo #f)
   (set! MenLyricsTwo #f))
%% MIDI
SopranoMidiInstrument = "flute"
AltoMidiInstrument = "clarinet"
TenorMidiInstrument = "oboe"
BassMidiInstrument = "bassoon"
WomenMidiInstrument = "trumpet"
MenMidiInstrument = "trombone"
IntroMidiInstrument = "banjo"

\paper {
  IndentSolmisasi = 11\mm
  ShortIndentSolmisasi = 11\mm
}