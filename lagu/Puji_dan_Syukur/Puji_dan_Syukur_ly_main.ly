\version "2.25.26"
% -*- master: Puji_dan_Syukur.ly;

%% VARIABLES
EngraveNotAngka = ##t
EngraveNotBalok = ##f
StandardStaffSize = #20
SolmisasiStaffSize = #20
TwoVoicesPerStaff = ##f
CetakWatermark = #(not is-svg?)
AlwaysShortInstrumentName = ##t

Global = {
  %\omit KeySignature
  \numericTimeSignature
  \time 4/4
  \tag #'notangka {
    \override KeySignature.extra-offset = #'(21.5 . 0)
    \hide KeySignature
  }
  \key ees \major
  \tag #'midi {
    \tempo 4 = 84
  }

  \once \override Score.BarNumber.stencil = ##f
  \tag #'notbalok {
    \tempo \markup \normal-text {
      \concat {
        \bold \italic "Andante moderato"
        ", tegak bersungguh-sungguh."
      }
    }
  }

  \tag #'notangka {
    \omit Score.MetronomeMark
    \tempo 4 = 84
    \disallowLineBreak
    \disallowPageBreak
    \pseudoIndents #0 #23
    %\mark \markup\smaller\caps\bold "Intro"
    \partial 4 r4 R1*4 \break
    %\once \override Score.TimeSignature.break-visibility = #begin-of-line-visible
    s1*6 \break
    s1*6 \break
    s1*7 \break
    s1*7 \break
    s1*4
    \tempo 4=80 s4
    \tempo 4=76 s4
    \tempo 4=70 s4
    \tempo 4=62 s4
    \tempo 4=52 s1
  }

  \tag #'notbalok {
    \disallowPageBreak
    \partial 4 r4 R1*4 \break
    s1*5 \break
    s1*6 \pageBreak
    s1*5 \break
    s1*6 \break
    s1*5 \pageBreak
    s1*5
  }
}

%% INTRO
IntroInstrumentName = ##f
IntroMusic = {
  \once\override Staff.InstrumentName.extra-offset = #'(26.5 . 0)
  \numericTimeSignature
  \tag #'notangka { \hide Staff.TimeSignature }
  \time 4/4
  \key ees \major
  \tag #'notangka {
    \once \override Score.SystemStartBar.collapse-height = #10
  }
  \partial 4
  f'4 |
  g'4 g'4 bes'4 aes'4 |
  g'4 f'4 ees'4 g'4 |
  c''2 bes'2 |
  bes'2. r4 \bar "||"
  \break
}
IntroMidiInstrument = "acoustic grand"

%% CHOIR
SopranoMusic = {
  \time 4/4
  \key ees \major
  \partial 4 r4
  R1*4
  g'2  aes'4 f'4 | % 5
  ees'2 ees'4 g'4 | % 6
  bes'4 bes'4 bes'4  c''4 | % 7
  bes'2. ees'4 | % 8
  f'2 f'4 g'4 | % 9
  aes'2 g'4 f'4 | % 10
  ees'4 bes4 c'4 f'4 | % 11
  f'1 | % 12

  g'2 aes'4 f'4 | % 13
  ees'2 ees'4 g'4 | % 14
  bes'4 bes'4 ees''4 bes'4 | % 15
  c''2. f'4 | % 16
  g'4 g'4 bes'4 aes'4 | % 17
  g'4 ( f'4 ) ees'2 | % 18
  c'2 f'4 ( d'4 ) | % 19
  ees'2. r4 |% 20

  bes'4  bes'4 bes'4 c''4 | % 21
  bes'2. ees'4 | % 22
  aes'4 g'4 f'4 ees'4 | % 23
  f'1 | % 24
  bes'4 bes'4 bes'4  c''4 | % 25
  d''2 f'4 f'4  | % 26
  g'4 c''4 bes'4 a'4 | % 27
  bes'2. r4  |% 28

  g'2  aes'4 f'4 | % 29
  ees'4  f'4 g'4 aes'4 | % 30
  bes'2 ees''4 bes'4 <>  | % 31
  c''2.  f'4  | % 32
  g'4 g'4 bes'4 aes'4 | % 33
  g'4 ( f'4 ) ees'2 | % 34
  c'2 f'4 d'4 | % 35
  ees'1 \bar "|."
}

AltoMusic = {
  \time 4/4
  \key ees \major
  \partial 4 r4
  R1*4
  ees'2  ees'4 d'4 | % 5
  bes2 c'4 ees'4 | % 6
  d'4 d'4 ees'4 ees'4 | % 7
  ees'2. ees'4 | % 8
  d'2 c'4 e'4 | % 9
  f'4 ( ees'!4 ) d'4 d'4 | % 10
  c'4 bes4 aes4 c'4 | % 11
  d'1 | % 12

  d'2 f'4 d'4 | % 13
  bes2 c'4 ees'4 | % 14
  f'4 f'4 ees'4 ees'4 | % 15
  ees'2. d'4 | % 16
  ees'4 d'4 f'4 f'4 | % 17
  d'2 c'4 ( bes4 ) | % 18
  aes4 ( c'4 ) d'4 ( bes4) | % 19
  bes2. r4 |% 20

  ees'4  d'4 ees'4 ees'4| % 21
  ees'2. ees'4 | % 22
  f'4 ees'4 c'4 c'4 | % 23
  d'1 | % 24
  d'4 ees'4 f'4 f'4 | % 25
  f'2 d'4 f'4 | % 26
  ees'4 g'4 f'4 ees'4 | % 27
  d'2. r4 |% 28
  ees'2  ees'4 d'4 | % 29
  bes4  f'4 ees'4 f'4 | % 30
  ees'2 bes'4 g'4 <>  | % 31
  ees'2.  d'4  | % 32
  ees'4 ees'4 f'4 f'4 | % 33
  d'2 c'4 ( bes4 ) | % 34
  aes4 ( c'4 ) d'4 bes4 | % 35
  bes1 \bar "|."
}

TenorMusic = {
  \time 4/4
  \key ees \major
  \partial 4 r4
  R1*4
  bes2  c'4 aes4 | % 5
  g2 g4 c'4 | % 6
  g4 aes4 g4 aes4 | % 7
  g2. g4 | % 8
  bes2 c'4 bes4 | % 9
  aes4 ( c'4 ) bes4 aes4 | % 10
  g4 ees4 ees4 c'4 | % 11
  bes1 | % 12
  b2 c'4 aes4 | % 13
  g2 g4 c'4 | % 14
  d'4 d'4 bes4 bes4 | % 15
  aes2. c'4 | % 16
  bes4 bes4 c'4 c'4 | % 17
  d'4 ( g4 ) g4 ( ees4 ) | % 18
  ees4 ( f8 g8 ) aes2 | % 19

  g2. r4  % 20
  g4  aes4 bes4 aes4 | % 21
  g2. g4 | % 22
  c'4 bes4 aes4 g4 | % 23
  bes1 | % 24
  bes4 bes4 bes4 a4 | % 25
  bes2 bes4 bes4 | % 26
  bes4 ees'4 d'4 c'4 | % 27
  bes2. r4  % 28
  bes2  c'4 aes4 | % 29
  g4  bes4 bes4 c'4 | % 30
  des'2 des'4 des'4 | % 31
  c'2.  c'4  | % 32
  bes4 bes4 bes4 d'4 | % 33
  d'4 ( g4 ) g4 ( ees4) | % 34
  ees4 ( f8 g8 ) aes4 aes4 | % 35
  g1 \bar "|."
}

BassMusic = {
  \time 4/4
  \key ees \major
  \partial 4 r4
  R1*4
  ees2  aes,4 bes,4 | % 5
  ees2 c4 c4 | % 6
  g4 f4 ees4 aes,4 | % 7
  ees2. c4 | % 8
  bes,2 aes,4 g,4 | % 9

  %10
  f,2 bes,4 b,4 | % 10
  c4 g,4 aes,4 aes,4 | % 11
  bes,1 | % 12
  g,2 f,4 bes,4 | % 13
  ees2 c4 c4 | % 14
  bes,4 aes,4 g,4 g,4 | % 15
  aes,2. aes4 | % 16
  g4 g4 f4 f4 | % 17
  b,2 c4 ( g,4 ) | % 18
  aes,2 bes,!2 | % 19

  %20
  ees2. r4  % 20
  ees4  f4 g4
  aes4 | % 21
  ees2. c4 | % 22
  f,4 g,4 aes,4 c4 | % 23
  bes,1 | % 24
  bes,4 c4 d4 f4 | % 25
  bes,2 bes,4 d4 | % 26
  ees4 c4 f4 f4 | % 27
  bes,2. r4  % 28
  ees2  aes,4 bes,4 | % 29

  %30
  ees4  d4 ees4
  ees4 | % 30
  g,2 g4 ees4 | % 31
  aes2.  aes4  | % 32
  g4 ees4 d4 bes,4
  | % 33
  b,2 c4 ( g,4 ) | % 34
  aes,2 bes,4 bes,4 | % 37
  ees1 \bar "|."
}

% PianoRHOne = {
%   \partial 4 f'4 |
%   g'4 g'4 bes'4 aes'4 | % 1
%   g'4  f'4 ees'4 <es' g'>4  | % 2
%   <as' c''>2 bes'2 | % 3
%   \oneVoice <es' bes'>2. r4  % 4
%   \bar "||"
%   \voiceOne g'2 aes'4 f'4 | % 5
%   ees'2 ees'4 g'4 | % 6
%   bes'4 bes'4 bes'4 c''4 | % 7
%   bes'2. ees'4 | % 8
%   f'2 f'4 g'4 | % 9
%   aes'2 g'4 f'4 | % 10
%   ees'4 bes4 c'4 f'4 | % 11
%   \oneVoice <d' f'>1 | % 12
%   \voiceOne g'2 aes'4 f'4 | % 13
%   ees'2 ees'4 g'4 | % 14
%   bes'4 bes'4 ees''4 bes'4 | % 15
%   c''2. f'4 | % 16
%   g'4 g'4 bes'4 aes'4 | % 17
%   g'4 f'4 ees'2 | % 18
%   c'2 f'4 d'4 | % 19
%   \oneVoice <bes ees'>2 ees'8  f'8 g'8 aes'8 | % 20
%   \voiceOne bes'4 bes'4 bes'4 c''4 | % 21
%   bes'2. ees'4 | % 22
%   aes'4  g'4 f'4 ees'4 | % 23
%   \oneVoice <d' f'>1  | % 24
%   \voiceOne bes'4 bes'4 bes'4 c''4 | % 25
%   d''2 f'4 f'4  | % 26
%   g'4 c''4 bes'4 a'4 | % 27
%   \oneVoice <d' bes'>1  | % 28
%   \voiceOne g'2 aes'4 f'4 | % 29
%   ees'4  f'4 g'4 aes'4 | % 30
%   bes'2 ees''4 bes'4 | % 31
%   c''2.  f'4  | % 32
%   g'4 g'4 bes'4 aes'4 | % 33
%   g'4 f'4 ees'2  | % 34
%   c'2 f'4 d'4 | % 35
%   ees'1 \bar "|."
% }
%
% PianoRHTwo = {
%   \partial 4 d'4 |
%   ees'4 d'4 f'2 | % 1
%   d'2 c'4 bes4 | % 2
%   c'2 ees'4 d'4 s1  % 4
%   ees'2 ees'4 d'4 | % 5
%   bes2 c'4 ees'4 | % 6
%   d'2 ees'2 | % 7
%   ees'2. ees'4 | % 8
%   d'2 c'4 e'4 | % 9
%   f'4 ees'!4 d'2 | % 10
%   c'4 bes4 aes4
%   c'4 s1 | % 12
%   d'2 f'4 d'4 | % 13
%   bes2 c'4 ees'4 | % 14
%   f'2 ees'2 | % 15
%   ees'2. d'4 | % 16
%   ees'4 d'4 f'2 | % 17
%   d'2 c'4 bes4 | % 18
%   aes4 c'4 d'4
%   bes4 s1  % 20
%   ees'4 d'4 ees'2 | % 21
%   ees'2. ees'4 | % 22
%   f'4 ees'4 c'4
%   <a c'>4 s1 | % 24
%   d'4 ees'4 f'2 ~ | % 25
%   f'2 d'4 f'4 | % 26
%   ees'4 g'4 f'4
%   ees'4 s1  % 28
%   ees'2 ees'4 d'4 | % 29
%   bes4 f'4 ees'4
%   f'4 | % 30
%   ees'2 bes'4 g'4 | % 31
%   ees'2. d'4 | % 32
%   ees'2 f'2 | % 33
%   d'2 c'4 bes4 | % 34
%   aes4 c'4 d'4
%   bes4 | % 35
%   bes1 \bar "|."
% }
%
% PianoLHOne = {
%   \partial 4 <as c'>4
%   <g bes>2 <as c'>2 | % 1
%   d'4 g4 g4 ees4 ~ | % 2
%   ees4 f8 g8 aes2 | % 3
%   <es g>2. \oneVoice r4  % 4
%   \voiceOne <es bes>2 c'4 aes4 | % 5
%   <es g>2 g4 c'4 | % 6
%   g4 <f aes>4 <es g>4 aes4
%   | % 7
%   <es g>2. g4 | % 8
%   bes2 c'4 bes4 | % 9
%
%   % 10
%   aes4 c'4 bes4 aes4 | % 10
%   g4 ees4 ees4 c'4 | % 11
%   bes1 | % 12
%   b2 c'4 aes4 | % 13
%   <es g>2 g4 c'4 | % 14
%   d'2 bes2 | % 15
%   aes2. <as c'>4 | % 16
%   <g bes>2 <f c'>2 | % 17
%   d'4 g4 g4 ees4 ~ | % 18
%   ees4 f8 g8 aes2 | % 19
%
%   % 20
%   <es g>2 g4 ees8 f8 % 20
%   <es g>4 <f aes>4 <g bes>4 aes4 | % 21
%   <es g>2. g4 | % 22
%   c'4 bes4 aes4 g4 | % 23
%   \oneVoice <bes, bes>1 | % 24
%   \voiceOne bes2. <f a>4 | % 25
%   bes2.~ <d bes>4 | % 26
%   <es bes>4 <g ees'>4 <f d'>4 <es c'>4
%   | % 27
%   <f bes>1  % 28
%   <es bes>2 c'4 aes4 | % 29
%
%   % 30
%   <es g>4 <d bes>4 <es~ bes>4 <es c'>4 | % 30
%   <g des'~>2 <g des'~>4 <es des'~>4 | % 31
%   <as c'>1 | % 32
%   <g bes~>4 <es bes~>4 <d~ bes>4 <d d'>4 | % 33
%   d'4 g4 g4 ees4 ~ | % 34
%   ees4 f8 g8 aes2 | % 35
%   <es g>1 \bar "|."
% }
%
% PianoLHTwo = {
%   \partial 4 aes,4
%   g,2 f,2 | % 1
%   b,2 c4 g,4 | % 2
%   aes,2 bes,!2 | % 3
%   ees,2. s4 % 4
%   ees,2 aes,4 bes,4 | % 5
%   ees,2 c2 | % 6
%   g,4 f,4 ees,4
%   aes,4 | % 7
%   ees,2. c4 | % 8
%   bes,2 aes,4 g,4 | % 9
%   f,2 bes,4 b,4 | % 10
%   c4 g,4 aes,2 | % 11
%   bes,2 d8 c8
%   bes,8 aes,8 | % 12
%   g,2 f,4 bes,!4 | % 13
%   ees,2 c2 | % 14
%   bes,4 aes,4 g,2 | % 15
%   aes,2. aes,4 | % 16
%   g,2 f,2 | % 17
%   b,2 c4 g,4 | % 18
%   aes,2 bes,!2 | % 19
%   ees,1  % 20
%   ees,4 f,4 g,4
%   aes,4 | % 21
%   ees,2. c4 | % 22
%   f,4 g,4 aes,4 c4
%   s1 | % 24
%   bes,4 c4 d4 f,4 | % 25
%   bes,2. d,4 | % 26
%   ees,8 d,8 c,4
%   f,4 f,4 | % 27
%   bes,4 aes,4 g,4
%   f,4  % 28
%   ees,2 aes,4 bes,4 | % 29
%
%   ees,4 d,4 ees,2 | % 30
%   g,2 g,4 ees,4 | % 31
%   aes,1 | % 32
%   g,4 ees,4 d,4 bes,4 | % 33
%   b,2 c8 bes,8
%   aes,8 g,8 | % 34
%   aes,2 bes,2 | % 35
%   ees,1 \bar "|."
% }
%
% PianoRHMusic = {
%   \numericTimeSignature
%   \time 4/4
%   \key ees \major
%   <<
%     %\mergeDifferentlyDottedOn
%     %\mergeDifferentlyHeadedOn
%     % \context Voice = "PartPOneVoiceOne" {
%     %       \voiceOne \PianoRHOne
%     %     }
%     %     \context Voice = "PartPOneVoiceTwo" {
%     %       \voiceTwo \PianoRHTwo
%     %     }
%     << \PianoRHOne \\ \PianoRHTwo >>
%   >>
% }
%
% PianoLHMusic = {
%   \numericTimeSignature
%   \time 4/4
%   \key ees \major
%   <<
%     %\mergeDifferentlyDottedOn
%     %\mergeDifferentlyHeadedOn
%     % \context Voice = "PartPTwoVoiceOne" {
%     %       \voiceOne \PianoLHOne
%     %     }
%     %     \context Voice = "PartPTwoVoiceTwo" {
%     %       \voiceTwo \PianoLHTwo
%     %     }
%     << \PianoLHOne \\ \PianoLHTwo >>
%   >>
% }
%
% PianoInstrumentName = #"Organ"
% PianoShortInstrumentName = "Org."
% PianoMidiInstrument = #"church organ"

%% Verses

VerseOne = \lyricmode {
  %   \override Lyrics.LyricText.font-name = #"Roboto Condensed"
  %   \override Lyrics.LyricText.font-size = #1.5
  \set stanza = "1."
  Pu -- ji dan syu -- kur pa -- da -- Mu, ya Tu -- han,
  me -- lim -- pah ber -- kat -- Mu ser --
  \leftAlignedOnSolmisasiOnly ta pe -- nga -- sih --
  % \tag #'solmisasi { an; __ }
  %   \tag #'notbalok { an; }
  \extenderOnSolmisasiOnly an;
  Ku -- a -- sa ka -- sih bim -- bing -- an ta -- ngan -- Mu
  me -- \leftAlignedOnSolmisasiOnly nun -- tun hi -- dup ka -- mi se -- la --
  \extenderOnSolmisasiOnly lu.
  Ha -- dir -- lah Tu -- han di an -- ta -- ra ka --
  \extenderOnSolmisasiOnly mi,
  ja -- di -- kan -- lah ka -- mi ge -- re -- ja se -- ha --
  \extenderOnSolmisasiOnly ti.
  Di -- mu -- lia -- kan -- lah na -- ma -- Mu, ya Tu -- han,
  se -- ga -- la pu -- ji syu -- kur ke -- pa -- da --
  \extenderOnSolmisasiOnly Mu.
}

VerseTwo = \lyricmode {
  %   \override Lyrics.LyricText.font-name = #"Roboto Condensed"
  %   \override Lyrics.LyricText.font-size = #1.5
  \set stanza = "2."
  U -- pa -- ya ka -- mi mem -- ba -- ngun du -- ni --
  \extenderOnSolmisasiOnly a
  se -- tu -- rut se -- ma -- ngat Ye --
  \leftAlignedOnSolmisasiOnly sus Tu -- han ki --
  \extenderOnSolmisasiOnly ta.
  Cu -- rah -- kan Roh -- Mu ke -- pa -- da u -- mat -- Mu,
  dam -- \leftAlignedOnSolmisasiOnly ping -- i ka -- mi, Tu -- han, se -- la --
  \extenderOnSolmisasiOnly lu.
  A -- nu -- g'rah -- i -- lah s'lu -- ruh Nu -- san -- ta --
  \extenderOnSolmisasiOnly ra,
  a -- gar hi -- dup ru -- kun da -- mai se -- jah -- te --
  \extenderOnSolmisasiOnly ra.
  Ka -- mi ber -- su -- jud pa -- da -- Mu, ya Tu -- han,
  Eng -- kau yang Ma -- ha -- mu -- rah, Ma -- ha -- be --
  \extenderOnSolmisasiOnly sar.
}

% AltoLyricsOne = \VerseOne
% AltoLyricsTwo = \VerseTwo
BassLyricsOne = \VerseOne
BassLyricsTwo = \VerseTwo

%% MIDI
SopranoMidiInstrument = "flute"
AltoMidiInstrument = "oboe"
TenorMidiInstrument = "clarinet"
BassMidiInstrument = "bassoon"

\paper {
  ShortIndentSolmisasi = 9.25\mm
}