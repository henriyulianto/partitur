\version "2.25.26"
% -*- master: Kerinduan.ly;

\include "jazzchords.ily"

%% VARIABLES
EngraveNotAngka = ##t
EngraveNotBalok = ##f
StandardStaffSize = #20
SolmisasiStaffSize = #20
TwoVoicesPerStaff = ##f
CetakWatermark = ##f
AlwaysShortInstrumentName = ##t
UnfoldBarNumbers = ##f

Global = {
  #(if (not is-svg?) #{ \disallowPageBreak #})
  \disallowLineBreak
  \omit Score.TimeSignature
  \omit Score.KeySignature
  \once\omit Score.BarNumber
  %\override Score.SystemStartBar.collapse-height = #5
  \numericTimeSignature
  \time 4/4
  \key d \major
  \once\omit Score.MetronomeMark \tempo 4=70
  \tweak X-offset #12.5 \tweak extra-offset #'(0 . -2.5)
  \sectionLabel \markup\smaller\caps\bold "Intro"
  \set Score.proportionalNotationDuration = #48
  \pseudoIndents #10 #15
  \partial 4 s4
  \unset Score.proportionalNotationDuration
  s1*3
  \after 2. {
    \bar "!" \break
    \boxedAlphabetMark #LEFT "Verse 1"
  } s1
  s1*6 \after 2 \break s1*2

  s1*5 \break
  s1*3 \bar "||"

  \boxedAlphabetMark #-0.75 "Verse 2"
  s1*3 \after 2. \break s1
  s1*6 \pageBreak
  s1*5
  \after 2. {
    \break
    \boxedAlphabetMark #LEFT "Chorus"
  } s1
  s1*5
  \after 2. \break s1
  s1*4 \bar "||" \break

  %\once \override Score.NonMusicalPaperColumn.line-break-system-details = #'((Y-offset . 122))
  \boxedAlphabetMark #LEFT "Interlude"
  \after 1 {
    \tweak transparent ##t \mark \markup \column {
      A B
    }
  } s1*4\break
  %\once \override Score.NonMusicalPaperColumn.line-break-system-details = #'((Y-offset . 133))
  \after 1 {
    \tweak transparent ##t \mark \markup \smaller\smaller\smaller \column {
      a
    }
  } s1*4
  \after 2. {
    \bar "!" \pageBreak
    \boxedAlphabetMark #LEFT "Chorus"
  } s1 |

  s1*5
  \after 2. \break s1
  s1*3
  s1 \break
  s1*5
  \after 2. \break s1
  s1*3
  s1
  #(if is-svg? #{ \break #})
  s1*3 \bar "|."
}

IntroInstrumentName = ""
IntroShortInstrumentName = ""
IntroMusic = {
  \clef "treble"
  \numericTimeSignature
  \time 4/4
  \key d \major
  \temporary\override Beam.extra-offset = #'(0 . 0.3)
  \partial 4 a4
  fis'2 fis'8 e'8 fis'8 a'8 | % 1
  d'2 b'8 a'8 g'8 fis'8 | % 2
  fis'4 b4 d'2 | % 3
  d'4. e'8 e'4 s4 |

  s1*42

  \revert Beam.extra-offset
  d''8 f''8 g''8 a''8 d''8 f''8 g''8 a''8 | % 47
  c''8 f''8 g''8 a''8 c''2 | % 48
  c''8 ees''8 d''8 ees''8 f''8 ees''4. | % 49
  bes'8 ees''8 d''8 ees''8 bes'2 | % 50
  bes'8 aes'8 bes'8 c''8 c''2 | % 51
  c''8 b'!8 c''8 d''8 g'2 | % 52
  d''8 cis''!8 d''8 e''8 e''2 | % 53
  d''1 | % 54
  \newSpacingSection
  \override Score.SpacingSpanner.spacing-increment = 1
  \tweak direction #DOWN \tweak extra-offset #'(0 . 0.8)
  \tuplet 3/2 {
    a'16-> a'16-> a'16->
  }
  a'8-> r8[
  \tweak direction #DOWN \tweak extra-offset #'(0 . 0.8)
  \tuplet 3/2 {
    a'16-> a'16-> a'16->
  }]
  a'4->
  \newSpacingSection
  \revert Score.SpacingSpanner.spacing-increment
  s4
}

SopranoMusic = {
  \override Score.Hairpin.to-barline = ##f
  \clef "treble"
  \numericTimeSignature
  \time 4/4
  \key d \major
  \partial 4 s4
  s1*3
  s2.

  \temporary\override Beam.extra-offset = #'(0 . 0.3)
  a4 -\tweak extra-offset #'(0.5 . -0.5)-\mp |
  fis'2 e'4 a'4 | % 5
  \after 2 [ d'1*5/8 r8] e'8 ( \< fis'8 ) | % 6
  \after 4 \! g'2 g'8 fis'8 g'8 ( \> a'8 ) | % 7
  \after 4 \! e'2  r4 d'4 <>\< | % 8
  b'2 cis''4 d''4 \! | % 9
  d''4 a'4 \> fis'4 ( d'4 ) | % 10
  g'2 \! fis'8 ( g'8 ) a'4 | % 11
  e'2 r4

  a4 | % 12
  fis'2
  \once\override Score.TupletBracket.staff-padding = #-1
  \once\override Score.TupletBracket.Y-offset = #1.5
  %\tweak TupletNumber.font-size #-1
  \tuplet 3/2 {
    e'4 fis'4 a'4
  } | % 13
  d'2 r4 e'8 ( fis'8 ) | % 14
  g'2 g'8 ( fis'8 ) g'8 ( a'8 ) | % 15
  e'2 r4 e'8 d'8 | % 16
  cis'2 fis'4. cis'8 | % 17
  e'4 d'2 b8 ( cis'8 ) | % 18
  d'2 b8 d'8 fis'4 | % 19
  e'2 r4

  a4-\tweak Y-offset #-1.5 -\mp |% 20
  fis'2 e'4 a'4 | % 21
  d'2 r4 e'8 ( fis'8 ) | % 22
  g'2 g'8 ( fis'8 ) g'8
  ( a'8 ) | % 23
  e'2 r4
  \temporary\override Staff.BarLine.allow-span-bar = ##f
  d'4 | % 24
  b'2 cis''4 d''4 | % 25
  d''4 a'4 fis'4 d'4 | % 26
  g'2 fis'8 ( g'8 ) a'4 | % 27
  e'2 r4

  a4 | % 28
  fis'2 fis'8 ( e'8 ) fis'8 a'8 | % 29
  d'2. e'8 fis'8
  \revert Staff.BarLine.allow-span-bar
  | % 30
  g'2 g'8 fis'8 g'8 a'8
  \temporary\override Staff.BarLine.allow-span-bar = ##f
  | % 31
  e'2 r4 e'8 d'8 | % 32
  cis'2 fis'4. cis'8 | % 33
  e'4 d'2 b8 ( cis'8 ) | % 34
  d'2 d'8 e'4 cis'8 | % 35
  \after 2 [ d'1*5/8 r8]

  \revert Staff.BarLine.allow-span-bar
  \revert Beam.extra-offset
  a'4 -\tweak Y-offset -1.25 \f |
  d''2 d''4. cis''8 | % 37
  cis''4 b'2 b'4 | % 38
  b'2 d''4 b'4 | % 39
  cis''2. cis''4 | % 40
  cis''4. e''8 e''4. fis''8 | % 41
  e''8 d''8 d''2 r8[ b'16 cis''16 \temporary\override Staff.BarLine.allow-span-bar = ##f | % 42
  d''4 d''8 d''4. r8[ b'16 cis''16 | % 43
  d''4 d''8 d''4. r8[ b'16 cis''16 | % 44
  d''4. d''8 d''8 e''4 cis''8 | % 45
  d''2. r4 \revert Staff.BarLine.allow-span-bar

  s1*8 s2.

  a'4 -\tweak Y-offset -1.25 -\f |

  % repeat 1
  d''2 d''4. cis''8  % 37
  cis''4 b'2 b'4  % 38
  b'2 d''4 b'4  % 39
  cis''2. cis''4  % 40
  cis''4. e''8 e''4. fis''8  % 41
  e''8 d''8 d''2 r8[ b'16 cis''16 \temporary\override Staff.BarLine.allow-span-bar = ##f  % 42
  d''4 d''8 d''4. r8[ b'16 cis''16  % 43
  d''4 d''8 d''4. r8[ b'16 cis''16  % 44
  d''4. d''8 d''8 e''4 cis''8  % 45
  d''2 r4 a'4 \revert Staff.BarLine.allow-span-bar
  % repeat 2
  d''2 d''4. cis''8  % 37
  cis''4 b'2 b'4  % 38
  b'2 d''4 b'4  % 39
  cis''2. cis''4  % 40
  cis''4. e''8 e''4. fis''8  % 41
  e''8 d''8 d''2 r8[ b'16 cis''16 \temporary\override Staff.BarLine.allow-span-bar = ##f  % 42
  d''4 d''8 d''4. r8[ b'16 cis''16  % 43
  d''4 d''8 d''4. r8[ b'16 cis''16  % 44
  d''4. d''8 d''8 e''4 cis''8  % 45
  d''2 r4 b'8\mp cis''8 \override Staff.BarLine.allow-span-bar = ##f

  d''4. d''8 d''8 e''4\> cis''8 | % 76
  d''1 ( | % 77
  d''1)\! \override Staff.BarLine.allow-span-bar = ##t
}

AltoMusic = {
  \clef "treble"
  \numericTimeSignature
  \time 4/4
  \key d \major
  \partial 4 s4
  s1*3
  s2.

  \dynamicsOff

  \temporary\override Beam.extra-offset = #'(0 . 0.3)
  a4 -\mp |
  fis'2 e'4 a'4 | % 5
  \after 2 [ d'1*5/8 r8 e'8 ( fis'8 ) | % 6
  g'2 g'8 fis'8 g'8 ( a'8 ) | % 7
  e'2 r4 d'4 | % 8
  g'2 g'4 g'4 | % 9
  fis'4 fis'4 d'4 ( b4 ) | % 10
  e'2
  \temporary\override Staff.BarLine.allow-span-bar = ##f
  d'8 ( e'8 ) d'4 | % 11
  d'4 ( cis'4 ) r4

  a4 | % 12
  d'2
  %\tweak TupletNumber.font-size #-1
  \tuplet 3/2 {
    cis'4 d'4 cis'4
  } | % 13
  b2 r4 cis'8 ( d'8 ) | % 14
  e'2 e'4 e'4 | % 15
  e'2 r4 e'8 d'8 | % 16
  cis'2 cis'4. cis'8
  \revert Staff.BarLine.allow-span-bar
  | % 17
  cis'4 b2 b4
  \temporary\override Staff.BarLine.allow-span-bar = ##f
  | % 18
  b2 b8 b8 d'4 | % 19
  cis'2 r4

  a4 | % 20
  d'2 e'4 e'4 | % 21
  d'2 r4 cis'8 ( d'8 ) | % 22
  e'2 e'4 b4 | % 23
  cis'2 r4 d'4 | % 24
  g'2 g'4 g'4 | % 25
  fis'4 fis'4 d'4 b4 | % 26
  e'2 d'8 ( e'8 ) fis'4 | % 27
  d'4 ( cis'4 ) r4 a4 % 28
  d'1 | % 29
  d'8 ( e'8 ) d'8 cis'8 d'2
  \revert Staff.BarLine.allow-span-bar
  | % 30
  r4 b4 b4 d'4 | % 31
  d'8. ( cis'16 ) cis'4 r4 e'8 d'8
  \temporary\override Staff.BarLine.allow-span-bar = ##f | % 32
  cis'2 cis'4. ais8 | % 33
  cis'4 b2 b4 | % 34
  b2 b8 cis'4 a8 | % 35
  \after 2 [ a1*5/8 r8]

  e'4\f  | % 36
  fis'2 a'4. fis'8 | % 37
  a'4 g'2 g'4 | % 38
  gis'2 gis'4 gis'4 | % 39
  a'2. g'!4 | % 40
  fis'4. fis'8 fis'4.   fis'8 | % 41
  fis'8 fis'8 fis'2 r4 \revert Staff.BarLine.allow-span-bar | % 42
  r4 g'4 fis'4 g'4 | % 43
  r4 a'4 g'4 a'8 g'16 fis'16 \temporary\override Staff.BarLine.allow-span-bar = ##f | % 44
  e'4. g'8 g'8 g'4 e'8 | % 45
  d'2. r4 \revert Staff.BarLine.allow-span-bar

  s1*8 s2.

  e'4\f | % 36

  \override Staff.BarLine.allow-span-bar = ##f

  % repeat 1
  fis'2 a'4. fis'8 | % 37
  a'4 g'2 g'4 | % 38
  gis'2 gis'4 gis'4 | % 39
  a'2. g'!4 | % 40
  fis'4. fis'8 fis'4.   fis'8 | % 41
  fis'8 fis'8 fis'2 r4 \override Staff.BarLine.allow-span-bar = ##t | % 42
  r4 g'4 fis'4 g'4 | % 43
  r4 a'4 g'4 a'8 g'16
  fis'16 \temporary\override Staff.BarLine.allow-span-bar = ##f| % 44
  e'4. g'8 g'8 g'4 e'8   | % 45
  d'2 r4 e'4 | \override Staff.BarLine.allow-span-bar = ##t
  % repeat 2
  fis'2 a'4. fis'8 | % 37
  a'4 g'2 g'4 | % 38
  gis'2 gis'4 gis'4 | % 39
  a'2. g'!4 | % 40
  fis'4. fis'8 fis'4.   fis'8 | % 41
  fis'8 fis'8 fis'2 r4 \override Staff.BarLine.allow-span-bar = ##t | % 42
  r4 g'4 fis'4 g'4 | % 43
  r4 a'4 g'4 a'8 g'16
  fis'16 \temporary\override Staff.BarLine.allow-span-bar = ##f| % 44
  e'4. g'8 g'8 g'4 e'8   | % 45
  d'2 r2

  \override Staff.BarLine.allow-span-bar = ##t
  R1*2
  \dynamicsOn
  fis'1-\tweak Y-offset #-1.25 \p
}

TenorMusic = {
  \clef "treble_8"
  \numericTimeSignature
  \time 4/4
  \key d \major
  \partial 4 s4
  s1*3
  s2.

  s4 |
  R1*8 |
  a1( \tweak Y-offset #-1.5 -\p | % 13
  fis1) | % 14
  b1( | % 15
  d'2 cis'2) | % 16
  \shape #'(
             ((0 . 0) (0.25 . 0) (0.5 . 0) (0 . -0.75))
             ((0 . -0.5) (0 . 0) (0 . 0) (0 . 0))
             ) Slur
  b2( ais2 | % 17
  fis2) a!4 ( \tweak Y-offset #-1.5 -\mp fis4 ) | % 18
  \temporary\override Beam.extra-offset = #'(0 . 0.3)
  g2 g8 a8 b4 | % 19
  a2 r4

  a4  | % 20
  a2 a4 a4 | % 21
  fis2. a4 | % 22
  b2 b4 g4 | % 23
  a2 r2 | % 24
  r4 b8 a8 g4 b4 \temporary\override Staff.BarLine.allow-span-bar = ##f | % 25
  a4 d'4 a4 fis4 | % 26
  b2 a4 a4 | % 27
  a2 r4 a4 | % 28
  a2 a4 b8 ( cis'8 ) | % 29
  b2 a8 ( b8 ) a8 ( fis8 )
  \revert Staff.BarLine.allow-span-bar
  | % 30
  g2 g8 a8 b8 a8
  \temporary\override Staff.BarLine.allow-span-bar = ##f
  | % 31
  a2 r4 cis'8 b8 | % 32
  ais2 ais4. fis8 | % 33
  e4 fis2 fis8 ( a!8 ) | % 34
  g2 g8 g4 g8 | % 35
  \after 2 [ fis1*5/8 r8]

  \revert Beam.extra-offset
  \dynamicsOff
  cis'4\f \revert Staff.BarLine.allow-span-bar | % 36
  d'2 d'4. e'8 | % 37
  e'4 d'2 d'4 | % 38
  b2 b4 d'4 | % 39
  e'2. e'4 | % 40
  cis'4. cis'8 cis'4. cis'8 | % 41
  e'8 fis'8 fis'2 r4 | % 42
  r4 d'4 d'4 d'4 | % 43
  r4 d'4 d'4 d'4 | % 44
  r8[ g'8 fis'8 d'8 d'8 e'8 e'8 cis'8 \temporary\override Staff.BarLine.allow-span-bar = ##f | % 45
  d'2. r4 \revert Staff.BarLine.allow-span-bar

  s1*8 s2.

  cis'4\f

  % repeat 1
  d'2 d'4. e'8 | % 37
  e'4 d'2 d'4 | % 38
  b2 b4 d'4 | % 39
  e'2. e'4 | % 40
  cis'4. cis'8 cis'4. cis'8 | % 41
  e'8 fis'8 fis'2 r4 | % 42
  r4 d'4 d'4 d'4  | % 43
  r4 d'4 d'4 d'4 | % 44
  r8[ g'8 fis'8 d'8 d'8 e'8 e'8 cis'8
  \temporary\override Staff.BarLine.allow-span-bar = ##f | % 45
  d'2 r4 cis'4 \revert Staff.BarLine.allow-span-bar
  % repeat 2
  d'2 d'4. e'8 | % 37
  e'4 d'2 d'4 | % 38
  b2 b4 d'4 | % 39
  e'2. e'4 | % 40
  cis'4. cis'8 cis'4. cis'8 | % 41
  e'8 fis'8 fis'2 r4 | % 42
  r4 d'4 d'4 d'4  | % 43
  r4 d'4 d'4 d'4 | % 44
  r8[ g'8 fis'8 d'8 d'8 e'8 e'8 cis'8
  \temporary\override Staff.BarLine.allow-span-bar = ##f | % 45
  d'2 r2

  \override Staff.BarLine.allow-span-bar = ##t
  R1*2
  a1
}

BassMusic = {
  \clef "bass"
  \numericTimeSignature
  \time 4/4
  \key d \major
  \partial 4 s4
  s1*3
  s2.

  \dynamicsOff
  s4 |
  R1*8 |
  d2( -\p cis2 | % 13
  b,2 a,2) | % 14
  e2( d4 b,4 | % 15
  a,2)
  \shape #'(
             ((0 . 0) (0.25 . 0) (0.5 . 0) (0 . -0.75))
             ((0 . -0.5) (0 . 0) (0 . 0) (0 . 0))
             ) Slur
  a4( g4 | % 16
  fis2 cis2 | % 17
  b,2) cis4 ( -\mp d4 ) | % 18
  \temporary\override Beam.extra-offset = #'(0 . 0.3)
  d2 d8 d8 d4 | % 19
  a,2 r4

  a,4 | % 20
  d2 cis4 cis4 | % 21
  b,2 ( a,4 ) d4 | % 22
  e2 e4 e4 | % 23
  a,2 r2 | % 24
  r4 g8 fis8 e4 d4 | % 25
  fis4 d4 a,4 b,4 | % 26
  e2 d4 d4 | % 27
  a,2 r4 a,4 | % 28
  d2 cis2 | % 29
  b,2 a,2 | % 30
  e2 d4 b,4 | % 31
  a,2 r4 g8 g8 | % 32
  fis2 fis4. fis8 | % 33
  b,4 b,2 d8( fis8) | % 34
  e2 a,8 a,4 a,8 | % 35
  \after 2 [ d1*5/8 r8]

  a,4\f | % 36
  d2 fis4. fis8 | % 37
  g4 g2 g8( fis8) | % 38
  e2 gis4 e4 | % 39
  a2. a4 | % 40
  ais4. ais8 ais4. ais8 | % 41
  b8 b8 b2 r4 | % 42
  r4 b4 a4 b4 | % 43
  r4 fis4 e4 fis4 | % 44
  e4. e8 a,4 a,8 a,8 | % 45
  d2. r4

  s1*8 s2.

  a,4\f

  % repeat 1
  d2 fis4. fis8 | % 37
  g4 g2 g8( fis8) | % 38
  e2 gis4 e4 | % 39
  a2. a4 | % 40
  ais4. ais8 ais4. ais8 | % 41
  b8 b8 b2 r4 | % 42
  r4 b4 a4 b4 | % 43
  r4 fis4 e4 fis4 | % 44
  e4. e8 a,4 a,8 a,8 | % 45
  d2 r4 a,4
  % repeat 2
  d2 fis4. fis8 | % 37
  g4 g2 g8( fis8) | % 38
  e2 gis4 e4 | % 39
  a2. a4 | % 40
  ais4. ais8 ais4. ais8 | % 41
  b8 b8 b2 r4 | % 42
  r4 b4 a4 b4 | % 43
  r4 fis4 e4 fis4 | % 44
  e4. e8 a,4 a,8 a,8 | % 45
  d2 r2
  R1*2
  d1 \override Staff.BarLine.allow-span-bar = ##t
}

%% LYRICS

SopranoLyrics = \lyricmode {
  \temporary\omit LyricText
  \repeat unfold 56 { \skip1 }
  \revert LyricText.stencil
  ke -- ge -- lap -- an sir -- na Kau a -- da di sa -- na.
  Da -- lam pe -- luk -- an -- Mu __
  se -- "mu-" a __ te -- ra -- sa nya -- ta. __
  Do -- a -- ku pun ter -- ka -- bul,
  Eng -- kau men -- de -- ngar -- nya.

  \repeat unfold 19 { \skip1 }
  \syairDiKanan Da -- lam cin -- ta -- Mu a -- ku ber -- se -- rah,
  hi -- dup -- ku pe -- nuh a -- nu -- g’rah.

  \skip1
  \repeat volta 2 {
    \repeat unfold 18 { \skip1 }
    \syairDiKanan Da -- lam cin -- ta -- Mu a -- ku ber -- se -- rah,
    hi -- dup -- ku pe -- nuh a -- nu --
    \alternative {
      { "g’rah. " \syairDiKiri "Se -" }
      { g’rah. }
    }
  }

  \syairDiKiri Hi -- dup -- ku pe -- nuh a -- nu -- g’rah. __
}

AltoLyrics = \lyricmode {
  " Ka" -- la ‘ku su -- jud da -- lam ma -- lam su -- nyi,
  ku -- pan -- jat -- kan do -- a pe -- nuh ha -- rap -- an.

  Te -- tes a -- ir ma -- ta, ja -- tuh di pi -- pi.
  Ku -- de -- ngar su -- "a-" ra -- Mu
  pe -- nuh ke -- rin -- du -- an.

  Lang -- kah -- ku " ki" -- ni pe -- nuh \syairDiKiri ca -- \syairDiKiri ha -- ya,
  ke -- ge -- lap -- an sir -- na Kau a -- da di sa -- na.

  Da -- lam __ pe -- luk -- an -- Mu
  te -- ra -- sa nya -- ta.
  Do -- a -- ku pun ter -- ka -- bul,
  \syairDiKiri Eng -- kau men -- de -- ngar -- nya.

  \syairDiKiri Se -- ga -- la pu -- ji -- an \syairDiKiri ha -- nya ba -- gi -- Mu
  yang tak hen -- ti me -- me -- luk -- ku.
  Cin -- ta -- Mu ber -- se -- rah
  hi -- dup -- ku pe -- nuh a -- nu -- g’rah.

  \syairDiKiri Se --
  \repeat volta 2 {
    ga -- la pu -- ji -- an \syairDiKiri ha -- nya ba -- gi -- Mu
    yang tak hen -- ti me -- me -- luk -- ku.
    Cin -- ta -- Mu ber -- se -- rah
    hi -- dup -- ku pe -- nuh a -- nu --
    \alternative {
      {
        "g’rah. " \syairDiKiri "Se -"
      }
      {
        #(if is-svg?
             #{ \lyricmode { grah. } #}
             #{ \lyricmode { "" } #})
      }
    }
  }
}

TenorLyrics = \lyricmode {
  \repeat unfold 19 { \skip1 }
  ke -- ge -- lap -- an sir -- na Kau a -- da di sa -- na.

  Da -- lam \syairDiKiri pe -- luk -- Mu
  se -- mu -- a __ te -- ra -- sa nya -- ta. __
  Do -- a -- ku pun ter -- ka -- bul,
  Eng -- kau men -- de -- ngar -- nya.

  \repeat unfold 19 { \skip1 }
  Cin -- ta -- Mu ber -- se -- rah
  hi -- dup -- ku pe -- nuh a -- nu -- g’rah.

  \skip1
  \repeat volta 2 {
    \repeat unfold 18 { \skip1 }
    Cin -- ta -- Mu ber -- se -- rah
    hi -- dup -- ku pe -- nuh a -- nu --
    \alternative {
      {
        "g’rah. " \syairDiKiri "Se -"
      }
      {
        #(if is-svg?
             #{ \lyricmode { grah. } #}
             #{ \lyricmode { "" } #})
      }
    }
  }
}

BassLyrics = \lyricmode {
  Uu __ \skip1 \skip1
  pe -- nuh ke -- rin -- du -- an.

  Lang -- kah -- ku " ki" -- ni __ \syairDiKiri pe -- nuh \syairDiKiri ca -- \syairDiKiri ha -- ya,
  ke -- ge -- lap -- an sir -- na Kau a -- da di sa -- na.

  Da -- lam pe -- luk -- Mu se -- mua \syairDiKiri nya -- ta. __
  Do -- a -- ku pun ter -- ka -- bul,
  Eng -- kau men -- de -- ngar -- nya.

  \syairDiKiri Se -- ga -- la pu -- ji -- an ha -- nya ba -- gi -- Mu
  yang tak hen -- ti me -- me -- luk -- ku.
  Cin -- ta -- Mu ber -- se -- rah
  \tweak X-offset #-0.5 'ku pe -- nuh a -- nu -- g’rah.

  \syairDiKiri Se --
  \repeat volta 2 {
    ga -- la pu -- ji -- an ha -- nya ba -- gi -- Mu
    yang tak hen -- ti me -- me -- luk -- ku.
    Cin -- ta -- Mu ber -- se -- rah
    \tweak X-offset #-0.5 'ku pe -- nuh a -- nu --
    \alternative {
      { "g’rah. " \syairDiKiri "Se -" }
      {
        #(if is-svg?
             #{ \lyricmode { grah. } #}
             #{ \lyricmode { "" } #})
      }
    }
  }

  Hmmm.
}

Chords = \chordmode {
  \override ChordName.extra-offset = #'(0 . -0.25)
  \partial 4 s4
  d2 a2/cis |
  b2:m d2/a |
  g1:maj7 |
  a2:sus a4 s4 |

  d2 a2/cis |
  b2:m d2/a |
  e2:m e2:m/d |
  a2:sus a2 |
  g2 a2/g |
  d2/fis b2:m |
  e2:m e2:m/d |
  \tweak X-offset #-0.5 a4:sus a2. |

  d2 a2/cis |
  b2:m d2/a |
  e2:m e2:m/d |
  a2:sus a2 |
  fis2:sus fis2/ais |
  b2:m d2/a |
  g2 e2:m |
  \tweak X-offset #-0.5 a1 |

  d2 a2/cis |
  b2:m d2/a |
  e2:m e2:m/d |
  a1 |
  g2 a2/g |
  d2./fis \tweak X-offset #-0.5 b4:m |
  e2:m e2:m/d |
  \tweak X-offset #-0.5 a4:sus a2. |

  d2 a2/cis |
  b2:m d2/a |
  e2:m e2:m/d |
  a4:sus a2. |
  fis1 |
  b2:m d2/a |
  \tweak X-offset #-0.5 e2:m7/g a2 |
  d2 a2 |

  d2 d2/fis |
  g1
  e1
  a1
  fis1
  b2:m \tweak X-offset #-1 b2:m/a
  g1
  d1/fis
  e2:m7 a2 |
  d1

  bes1 | % 47
  f1/a | % 48
  as1 | % 49
  es1/g | % 50
  f1:m  | % 51
  g1 | % 52
  a1 | % 53
  d1 | % 54
  d4/a a4:sus a2 |

  \repeat volta 2 {
    d2 d2/fis |
    g1
    e1
    a1
    fis1
    b2:m \tweak X-offset #-1 b2:m/a
    g1
    d1/fis
    e2:m7 a2 |
    \alternative {
      { d2 a2 }
      { b2:m b2:m/a }
    }
  }
  e2:m7 a2 |
  d1 s1
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