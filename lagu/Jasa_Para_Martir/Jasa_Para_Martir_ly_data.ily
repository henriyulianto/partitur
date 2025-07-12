\version "2.25.26"
% -*- master: Jasa_Para_Martir.ly;

%% VARIABLES
EngraveNotAngka = ##t
EngraveNotBalok = ##f
StandardStaffSize = #18.5
SolmisasiStaffSize = #18.5
TwoVoicesPerStaff = ##f
AlwaysShortInstrumentName = ##t
UnfoldBarNumbers = ##f
UnfoldRepeatsForSVG = ##t

myPartial =
#(define-music-function
  (bar-number music time-sig-after show-time-sig?)
  (integer? ly:music? fraction? boolean?)
  (let ((partial-fraction (moment->fraction (ly:music-length music)))
        (show-time-sig-music
         (if show-time-sig?
             (empty-music)
             #{ \once\omit Score.TimeSignature #})))
    #{
      \set Score.currentBarNumber = #bar-number
      %\once\omit Score.TimeSignature
      \set Score.timeSignatureFraction = #time-sig-after
      \time #partial-fraction
      $music
      $show-time-sig-music
      \time $time-sig-after
    #}
    ))

SopranoMusic = {
  <<
    #(if (not is-svg?) #{ \disallowPageBreak #})
    \disallowLineBreak
    %\omit Score.KeySignature
    \once\omit Score.BarNumber
    \omit Score.MetronomeMark
    \override Score.SystemStartBar.collapse-height = #5
    %\override NoteHead.font-series = #'bold
    \tempo 4 = 90
    \time 4/4
    \key f \major
  >>
  \partial 4 s4
  s1 | % 6
  \time 3/4 s2. | % 7
  %\tweak transparent ##t \mark\default
  \time 4/4 s1 | % 8
  s2.

  \repeat volta 3 {
    \bar "||" \break
    c'8 c'8 \bar "|" |
    f'4. f'8 g'4 bes'4 | % 6
    \time 3/4 a'4 g'4 a'8 g'8 | % 7
    \time 4/4 c''4. a'8 f'4 g'4 | % 8
    f'2.
    \bar "" \break

    c'8 c'8
    f'4. f'8 g'4 bes'4 | % 6
    \time 3/4 a'4 g'4 a'8 g'8 | % 7
    \time 4/4 c''4. a'8 f'4 g'4 | % 8
    f'2.
    \bar "" \pageBreak

    a'8 a'8
    g'4. e'8 f'4 a'4 | % 14
    g'2. a'8 b'8 | % 15
    c''4. c''8 d''4  b'4 | % 16
    c''2.
    \bar "" \break

    c''4
    bes'4. a'8 g'4 a'8  bes'8 | % 18
    c''4. f'8 f'4 f'8 a'8 | % 19
    <<
      \once\omit Score.TimeSignature
      \volta #'() {
        \once \override TextSpanner.bound-details.left.text =
        \markup { \bold rit. (bait 3) }
        s4*6\startTextSpan
        s4\stopTextSpan
      }
      \volta 1 {
        c''4 bes'8 a'8 bes'4 g'4 | % 20
        f'2.
      }
      \volta 2 {
        \unfolded {
          c''4 bes'8 a'8 bes'4 g'4 | % 20
          f'2.
        }
      }
      \volta 3 {
        \unfolded {
          <<
            #(if is-svg?
                 #{
                   {
                     \once \override TextSpanner.bound-details.left.text =
                     \markup { \bold rit. }
                     s4*6\startTextSpan
                     s4\stopTextSpan
                   }
                 #})
            {
              \tempo 4 = 90
              c''4
              \tempo 4 = 74
              bes'8 a'8
              \tempo 4 = 76
              bes'4
              \tempo 4 = 66
              g'4 | % 20
              f'2.
            }
          >>
        }
      }
    >>
  }
  \bar "|."
}

AltoMusic = {
  r4 R1 | % 1
  \time 3/4 R2. | % 2
  \numericTimeSignature \time 4/4 R1 | % 3
  r2 r4
  \repeat volta 3 {
    \spanBarOff c'8 c'8  % 5
    c'4. c'8 d'4 g'4 | % 6
    \time 3/4 f'4 e'4 d'8 e'8 | % 7
    \numericTimeSignature \time 4/4 f'8 ( g'8 a'8 ) f'8 d'4 c'4 | % 8
    c'2. c'8 c'8 | % 9

    % 10
    c'4. c'8 d'4 g'4 | % 10
    \time 3/4 f'4 e'4 d'8 e'8 | % 11
    \numericTimeSignature \time 4/4 f'8 ( g'8 a'8 ) f'8 d'4 c'4 | % 12
    c'2. f'8 f'8 | % 13
    c'4. c'8 d'4 f'4 | % 14
    e'2. d'8 f'8 | % 15
    g'4. g'8 g'4 f'4 | % 16
    e'2. fis'4 | % 17
    g'8 ( a'8 g'8 ) f'!8
    e'4 c'8 c'8 | % 18
    f'4. c'8 d'4 d'8
    f'8 | % 19

    % 20
    f'4 f'8 f'8 f'4
    e'4 | % 20
    f'2.
  }
}

TenorMusic = {
  r4 R1 | % 1
  \time 3/4 R2. | % 2
  \numericTimeSignature \time 4/4 R1 | % 3
  r2 r4
  \repeat volta 3 {
    c'8 bes8  % 5
    a4. a8 bes4 d'4
    | % 6
    \time 3/4 c'4 c'4 a8 g8 | % 7
    \numericTimeSignature \time 4/4 f4. a8 bes4 bes4 | % 8
    a2. c'8 bes8 | % 9

    % 10
    a4. a8 bes4 d'4
    | % 10
    \time 3/4 c'4 c'4 a8 g8 | % 11
    \numericTimeSignature \time 4/4 f4. a8 bes4 bes4 | % 12
    a2. c'8 b8 | % 13
    c'4. c'8 a4 b4
    | % 14
    c'2. a8 f8 | % 15
    g4. a8 b4 d'4 | % 16
    c'2. c'4 | % 17
    d'4. d'8 c'4     c'8 bes8 | % 18
    a8 ( g8 ) f8 ( e8 )
    d4 f8 f8 | % 19

    % 20
    f8 ( a8 ) bes8 c'8
    bes4 bes4 | % 20
    a2.
  }
}

BassMusic = {
  r4 R1 | % 1
  \time 3/4 R2. | % 2
  \numericTimeSignature \time 4/4 R1 | % 3
  r2 r4
  \repeat volta 3 {
    c8 c8  % 5
    f4 ( a,8 ) a,8     bes,4 bes,4 | % 6
    \time 3/4 c4 c4 bes,8 bes,8 | % 7
    \numericTimeSignature \time 4/4 a,8 ( bes,8
    c8 ) d8 c4 c4 | % 8
    f2. c8 c8 | % 9

    % 10
    f4 ( a,8 ) a,8     bes,4 bes,4 | % 10
    \time 3/4 c4 c4 bes,8 bes,8 | % 11
    \numericTimeSignature \time 4/4 a,8 ( bes,8
    c8 ) d8 c4 c4 | % 12
    f2. f8 f8 | % 13
    e4. e8 d4 d4
    | % 14
    c2. d8 d8 | % 15
    e4. f8 g4 g,4
    | % 16
    c2. a4 | % 17
    g4. f8 e4 f8
    g8 | % 18
    f8 ( e8 ) d8 ( c8 ) bes,4 b,8 b,8 | % 19

    % 20
    c4 c8 c8 d4 c4 | % 20
    f2.
  }
}

% ORGAN
PianoInstrumentName = "Organ"
PianoShortInstrumentName = ""
PianoRHVoiceOne = {
  c'8 c'8
  <c' f'>4. <c' f'>8 <d' g'>4 <g' bes'>4 | % 1
  <f' a'>4 <e' g'>4 <d' a'>8 <e' g'>8 | % 2
  \voiceOne c''4. a'8
  f'4 g'4 | % 3
  \once\omit Score.TimeSignature
  \oneVoice <c' f'>2.

  \repeat volta 3 {
    c'8 c'8  % 5
    <c' f'>4. <c' f'>8 <d' g'>4 <g' bes'>4 | % 6
    <f' a'>4 <e' g'>4 <d' a'>8 <e' g'>8 | % 7
    \voiceOne c''4. a'8 f'4 g'4 | % 8
    \once\omit Score.TimeSignature
    \oneVoice <c' f'>2. c'8 c'8 | % 9
    <c' f'>4. <c' f'>8 <d' g'>4 <g' bes'>4 | % 10
    \time 3/4 <f' a'>4 <e' g'>4 <d'
    a'>8 <e' g'>8 | % 11
    \numericTimeSignature \time 4/4 \voiceOne c''4. a'8 f'4 g'4 | % 12
    \once\omit Score.TimeSignature
    \oneVoice <c' f'>2. <f' a'>8 <f'
    a'>8 | % 13
    <c' g'>4. <c' e'>8 <d' f'>4 <f' a'>4 | % 14
    <e' g'>2. <d' a'>8 <f' b'>8 | % 15
    \voiceOne c''4. c''8 d''4 b'4 | % 16
    \once\omit Score.TimeSignature
    \oneVoice <e' c''>2. <fis' c''>4 | % 17
    \voiceOne bes'4. a'8 g'4 a'8 bes'8 | % 18
    \oneVoice <f' c''>4. <c' f'>8 <d'
    f'>4 <d' f'>8 <f' a'>8 | % 19
    \voiceOne c''4 bes'8 a'8 bes'4 g'4 | % 20
    \oneVoice <c' f'>2.
  }
}

PianoRHVoiceTwo = {
  s4*5 | % 1
  \time 3/4 s2. | % 2
  \numericTimeSignature \time 4/4
  f'8 g'8 a'8 f'8 d'4 c'4 s2.
  \repeat volta 3 {
    s4
    s1 | % 6
    \time 3/4 s2. | % 7
    \numericTimeSignature \time 4/4 f'8 g'8
    a'8 f'8 d'4     c'4 s1 s1 | % 10
    \time 3/4 s2. | % 11
    \numericTimeSignature \time 4/4 f'8 g'8
    a'8 f'8 d'4     c'4 s1*2 s1 | % 15
    g'2. f'4 s1 | % 17
    g'8 a'8 g'8     f'!8 e'4 c'8 c'8 s1 | % 19

    % 20
    f'2 f'4 e'4
    s2.
  }
}

PianoLHVoiceOne = {
  c'8 bes8 <f a>2 <g bes>4
  <bes d'>4 | % 1
  \time 3/4 c'2 a8 g8 | % 2
  \numericTimeSignature \time 4/4 f4. a8 bes4 ~ <c bes>4 | % 3
  <f a>2.
  \repeat volta 3 {
    c'8 bes8  % 5
    <f a>2 <g bes>4 <bes d'>4 | % 6
    \time 3/4 c'2 a8 g8 | % 7
    \numericTimeSignature \time 4/4 f4. a8 bes4 ~ <c bes>4 | % 8
    <f a>2. c'8 bes8 | % 9
    <f a>2 <g bes>4 <bes d'>4 | % 10
    \time 3/4 c'2 a8 g8 | % 11
    \numericTimeSignature \time 4/4 f4. a8 bes4 <c bes>4 | % 12
    <f a>2. c'8 b8 | % 13
    c'2 a4 b4 | % 14
    <g c'>2. a8 <d f>8 | % 15
    g4. a8 b4 d'4 | % 16
    <g c'>2. <a c'>4 | % 17
    <g d'>2 <e c'>4 <f a>8 <e g>8 | % 18
    <f a>8 <e g>8 <d f>8   <c e>8 d4 <f a>4 | % 19
    <f c'>8 a8 bes!8 c'8 bes2 | % 20
    <f a>2.
  }
}

PianoLHVoiceTwo = {
  c4 f,8 g,8 a,4 bes,2 | % 1
  \time 3/4 c2 bes,4 | % 2
  \numericTimeSignature \time 4/4 a,8 bes,8
  c8 d8 c4 c,4 | % 3
  f,2.
  \repeat volta 3 {
    c4  % 5
    f,4 a,4 bes,2 | % 6
    \time 3/4 c2 bes,4 | % 7
    \numericTimeSignature \time 4/4 a,8 bes,8
    c8 d8 c4 c,4
    | % 8
    f,2. c4 | % 9
    f,4 a,4 bes,2 | % 10
    \time 3/4 c2 bes,4 | % 11
    \numericTimeSignature \time 4/4 a,8 bes,8
    c8 d8 c4 c,4
    | % 12
    f,2. f4 | % 13
    e2 d2 | % 14
    c2. d4 | % 15
    e4. f8 g2 | % 16
    c2. a,4 | % 17
    g,4. f,8 e,4     f,8 g,8 | % 18
    a,2 bes,4 b,4 | % 19
    c2 c4 c,4 | % 20
    f,2.
  }
}

PianoRHMusic = <<
  \mergeDifferentlyDottedOn
  \mergeDifferentlyHeadedOn
  \clef "treble" \numericTimeSignature
  \key f \major
  \context Voice = "PianoRHVoiceOne" {
    \voiceOne \PianoRHVoiceOne
  }
  \context Voice = "PianoRHVoiceTwo" {
    \voiceTwo \PianoRHVoiceTwo
  }
>>

PianoLHMusic = <<
  \mergeDifferentlyDottedOn
  \mergeDifferentlyHeadedOn
  \clef "bass" \numericTimeSignature
  \key f \major
  \context Voice = "PianoLHVoiceOne" {
    \voiceOne \PianoLHVoiceOne
  }
  \context Voice = "PianoLHVoiceTwo" {
    \voiceTwo \PianoLHVoiceTwo
  }
>>

% LYRICS

VerseOne = \lyricmode {
  #(if is-svg?
       #{
         \boxedAlphabetMark #LEFT "Bait 1"
       #})
  \set stanza = "1."
  \syairDiKiri Ma -- ri ki -- ta me -- lam -- bung -- kan
  pu -- ji -- an ba -- gi Al -- lah;
  \syairDiKiri Se -- bab I -- " a " t'lah ber -- ke -- nan
  pa -- da da -- rah ham -- ba -- Nya.
  \syairDiKiri Ber -- kat kur -- ban hi -- dup -- nya,
  mur -- ni ha -- rum na -- ma -- nya;
  \syairDiKiri Me -- ne -- la -- dan Sang A -- nak Dom -- ba,
  Ye -- sus Kris -- tus, Tu -- han ki -- ta.
}

VerseTwo = \lyricmode {
  #(if is-svg?
       #{
         \boxedAlphabetMark #LEFT "Bait 2"
       #})
  \set stanza = "2."
  \syairDiKiri Pa -- ra mar -- tir ber -- gi -- rang -- lah
  dan ber -- so -- rak gem -- bi -- ra;
  \syairDiKiri Kar -- na mah -- ko -- ta mu -- li -- a
  ki -- ni t'lah di -- te -- ri -- ma.
  \syairDiKiri Pes -- ta Pas -- kah mu -- li -- a
  me -- nyam -- but -- nya di sur -- ga;
  \syairDiKiri Do -- a -- kan ka -- mi u -- mat g're -- ja
  yang ber -- zi -- a -- rah di du -- nia.
}

VerseThree = \lyricmode {
  #(if is-svg?
       #{
         \boxedAlphabetMark #LEFT "Bait 3"
       #})
  \set stanza = "3."
  \syairDiKiri Ma -- ri ki -- ta me -- nge -- nang -- kan
  ke -- ja -- ya -- an me -- re -- ka;
  \syairDiKiri Ber -- se -- ku -- tu da -- lam i -- man,
  peng -- ha -- rap -- an dan cin -- ta.
  \syairDiKiri Se -- mo -- ga ki -- ta ke -- lak tu -- rut ber -- ba -- ha -- gi -- a
  \syairDiKiri ber -- sa -- ma me -- mu -- lia -- kan Al -- lah
  da -- lam su -- ka -- ci -- ta sur -- ga.
}

BassLyricsOne = \lyricmode {
  \VerseOne
  #(if is-svg?
       #{ \lyricmode { \VerseTwo \VerseThree } #}
       (empty-music))
}
BassLyricsTwo = #(if is-svg? #f VerseTwo)
BassLyricsThree = #(if is-svg? #f VerseThree)

AltoLyricsOne   = \BassLyricsOne
AltoLyricsTwo   = \BassLyricsTwo
AltoLyricsThree = \BassLyricsThree

%% MIDI
SopranoMidiInstrument = #"flute"
AltoMidiInstrument    = #"clarinet"
TenorMidiInstrument   = #"oboe"
BassMidiInstrument    = #"bassoon"
WomenMidiInstrument   = #"trumpet"
MenMidiInstrument     = #"trombone"
IntroMidiInstrument   = #"banjo"
PianoMidiInstrument   = #"church organ"

\paper {
  IndentSolmisasi = 27
  ShortIndentSolmisasi = 8.5
}